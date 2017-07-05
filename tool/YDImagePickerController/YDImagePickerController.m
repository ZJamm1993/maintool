//
//  YDImagePickerController.m
//  橙子
//
//  Created by Macbook Air on 15/11/7.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import "YDImagePickerController.h"
#import "YDPhotosCell.h"
#import "YDAlbumViewController.h"

@interface YDImagePickerController()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,YDAlbumViewControllerDelegate,YDPhotosCellDelegate>

/** 展现图片的collection容器*/
@property (nonatomic ,weak) UICollectionView *collection;

/** 显示选择了多少张图片的label*/
@property (nonatomic ,weak) UILabel *imageCount;

/** 确定选择图片的按钮*/
@property (nonatomic ,weak) UIButton *confirmBtn;

/** 当前控制器所有照片asset url路径的数组*/
@property (nonatomic, strong) NSMutableArray *photos;

/** 获取的每一张图片asset资源*/
@property (nonatomic, strong) ALAssetsGroup *currentAlbum;

/** 被选择的照片的url数组*/
@property (nonatomic, strong) NSMutableArray *selectPhotoUrls;

/** 图片放大等工具*/
@property (nonatomic, weak) UIImageView *imageView;

/** 保存frame*/
@property (nonatomic, assign) CGRect lastFrame;

/** 遮罩*/
@property (nonatomic ,weak) UIView *cover;

@end

@implementation YDImagePickerController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = color_background;
    
    /** 设置导航栏属性*/
    [self setupNavigationBar];
    
    /** 设置底部控件*/
    [self setupBottomView];
    
    /** 初始化数组*/
    [self initialArray];
    
    /** 设置照片显示容器*/
    [self setupCollectionView];
    
    /** 获取所有照片的asset*/
    [self getAllPictures];
}

/** 初始化数组*/
- (void)initialArray
{
    if(self.selectPhotos == nil)
    {
        self.selectPhotos = [[NSMutableArray alloc] init];
        self.selectPhotoUrls = [[NSMutableArray alloc] init];
    }
    else
    {
        self.selectPhotoUrls = [[NSMutableArray alloc] init];
        for (ALAsset *asset in self.selectPhotos )
        {
            [self.selectPhotoUrls addObject:[asset valueForProperty:ALAssetPropertyAssetURL]];
        }
        self.imageCount.text = [NSString stringWithFormat:@"已经选择%lu张照片",(unsigned long)self.selectPhotos.count];
    }
}

/** 获取所有照片的asset*/
- (void)getAllPictures
{
    /** ALAssetsGroupType
     *  ALAssetsGroupLibrary       从ituns来到相册内容
     *  ALAssetsGroupAlbum         设备自身或从ituns备份来的照片
     *  ALAssetsGroupEvent         相机接口事件产生的相册（app拍照？）
     *  ALAssetsGroupFaces         脸部照片？
     *  ALAssetsGroupSavedPhotos   相机照片流
     *  ALAssetsGroupPhotoStream   照片流
     *  ALAssetsGroupAll           除了ALAssetsGroupLibrary的所有内容
     **/
    
    // 直接访问的相册类型为相机照片流
    NSUInteger groupTypes = ALAssetsGroupSavedPhotos;
    
    // 创建一个block变量，成功时加载图片的asset
    ALAssetsLibraryGroupsEnumerationResultsBlock listGroupBlock = ^(ALAssetsGroup *group, BOOL *stop) {
        ALAssetsFilter *onlyPhotosFilter = [ALAssetsFilter allPhotos];
        [group setAssetsFilter:onlyPhotosFilter];
        if ([group numberOfAssets] > 0)
        {
            // 将每个图片asset添加到数组中
            [self showPhoto:group];
        }
        else
        {
            YDLog(@"读取相册完毕");
        }
    };
    
    // 拒绝相册访问，或者访问相册失败的block
    ALAssetsLibraryAccessFailureBlock failureBlock = ^(NSError *error)
    {
        YDLog(@"ALAssetsLibraryAccessFailureBlock");
//        NSString *errorMessage = nil;
        
//        switch ([error code]) {
//                
//            case ALAssetsLibraryAccessUserDeniedError:
//                YDLog(@"ALAssetsLibraryAccessUserDeniedError");
//                
//            case ALAssetsLibraryAccessGloballyDeniedError:
//                YDLog(@"ALAssetsLibraryAccessGloballyDeniedError");
//                errorMessage = @"The user has declined access to it.";
//                
//                break;
//                
//            default:
//                
//                errorMessage = @"Reason unknown.";
//                
//                break;
//                
//        }
    };
    // 单例，确保能够执行一次，且只会执行一次（整个app中只执行一次）
    static dispatch_once_t pred = 0;
    static ALAssetsLibrary *library = nil;
    dispatch_once(&pred,
                  ^{
                      // 获取所有图片资源
                      library = [[ALAssetsLibrary alloc] init];
                  });
    
    // 根据block，获取对应的图片asset，并加载到数组中
    [library enumerateGroupsWithTypes:groupTypes usingBlock:listGroupBlock failureBlock:failureBlock];
}

#pragma mark - GUI
/** 设置导航栏属性*/
- (void)setupNavigationBar
{
    UIButton *backBtn = [[UIButton alloc] init];
    backBtn.frame = CGRectMake(0, 0, 44, 44);
    [backBtn addTarget:self action:@selector(albumAction) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setTitle:@"相册" forState:UIControlStateNormal];
    [backBtn setTitleColor:color_main_app forState:UIControlStateNormal];
    [backBtn setTitleColor:color_Highlighted_app forState:UIControlStateHighlighted];
    backBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
}

/** 设置照片显示容器*/
- (void)setupCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, navBar_height, screenWidth, screenHeight - 40 - navBar_height) collectionViewLayout:flowLayout];
    collection.backgroundColor = [UIColor clearColor];
    collection.dataSource = self;
    collection.delegate = self;
    //
    [collection registerClass:[YDPhotosCell class] forCellWithReuseIdentifier:@"photocell"];
    [self.view addSubview:collection];
    self.collection = collection;
}

/** 设置底部控件*/
- (void)setupBottomView
{
    // 创建容器
    UIView *bottomView = [[UIView alloc] init];
    bottomView.width = screenWidth;
    bottomView.height = 40;
    bottomView.x = 0;
    bottomView.y = screenHeight - bottomView.height;
    [self.view addSubview:bottomView];
    
    // 创建提示label
    UILabel *label = [[UILabel alloc] init];
    label.x = 20;
    label.y = 0;
    label.width = 200;
    label.height = bottomView.height;
    label.text = @"请选择照片";
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = RGBAColor(51, 51, 51, 1);
    [bottomView addSubview:label];
    self.imageCount = label;
    
    // 创建完成按钮
    UIButton *confirmBtn = [[UIButton alloc] init];
    confirmBtn.width = 50;
    confirmBtn.height = bottomView.height - 12;
    confirmBtn.x = screenWidth - confirmBtn.width - 6;
    confirmBtn.y = 6;
    confirmBtn.layer.cornerRadius = 6.0;
    confirmBtn.clipsToBounds = YES;
    [confirmBtn setBackgroundImage:[UIImage createImageWithColor:color_main_app] forState:UIControlStateNormal];
    [confirmBtn setBackgroundImage:[UIImage createImageWithColor:color_Highlighted_app] forState:UIControlStateHighlighted];
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [confirmBtn addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:confirmBtn];
    self.confirmBtn = confirmBtn;
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photos.count;
}

/** 显示所有的照片*/
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"photocell";
    YDPhotosCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.delegate = self;
    [cell sizeToFit];
    
    // 取出对应的照片asset
    ALAsset *asset = self.photos[indexPath.row];
    
    // 根据thumbnail取出缩略图的url
    CGImageRef thumbnailImageRef = [asset thumbnail];
    
    // 根据url加载缩略图
    UIImage *thumbnail = [UIImage imageWithCGImage:thumbnailImageRef];
    
    cell.photoView.image = thumbnail;
    
    // 取出照片url
    NSString *url = [asset valueForProperty:ALAssetPropertyAssetURL];
    
    // 判断url是否在被选中的照片url数组中
    [cell.selectedBtn setSelected:[self.selectPhotoUrls containsObject:url]];
    return cell;
}

#pragma mark - UICollectionViewDelegate
/** 点击item触发,切换状态*/
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    YDPhotosCell *cell=(YDPhotosCell *)[collectionView cellForItemAtIndexPath:indexPath];
    /**
     * fullScreenImage     满屏的图片
     * fullResolutionImage  完全分辨率的图片
     */
    // 加载的满屏图片
    ALAsset *asset = self.photos[indexPath.row];
    ALAssetRepresentation *assetRep = [asset defaultRepresentation];
    CGImageRef imageRef = [assetRep fullScreenImage];
    UIImage *fullScreenImage = [UIImage imageWithCGImage:imageRef];
    
    // 放大照片
    // 添加一个遮盖
    UIView *cover = [[UIView alloc] init];
    cover.frame = [UIScreen mainScreen].bounds;
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0;
    [cover addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchCover:)]];
    [[UIApplication sharedApplication].keyWindow addSubview:cover];
    self.cover = cover;
    
    // 添加一个加的照片
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = fullScreenImage;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    // 将cell.frame从self.collection坐标系转为cover坐标系
    imageView.frame = [cover convertRect:cell.frame fromView:self.collection];
    self.lastFrame = imageView.frame;
    [cover addSubview:imageView];
    self.imageView = imageView;
    
    // 放大
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = imageView.frame;
        frame.size.width = cover.width; // 占据整个屏幕;
        frame.size.height = frame.size.width * (imageView.image.size.height / imageView.image.size.width);
        frame.origin.x = 0;
        frame.origin.y = (cover.height - frame.size.height) * 0.5;
        imageView.frame = frame;
        self.cover.alpha = 1;
    }];
}

#pragma mark - YDPhotosCellDelegate
- (void)YDPhotosCell:(YDPhotosCell *)cell
{
    // 取出cell所在的位置
    NSIndexPath *index =  [self.collection indexPathForCell:cell];
    // 如果照片未被选中
    if(cell.selectedBtn.selected == NO)
    {
        // 最多只能选择9张照片
        if (self.selectPhotos.count > 8 || self.selectPhotoUrls.count > 8) {
            [MBProgressHUD showError:@"最多9张照片"];
            return;
        }
        
        [cell.selectedBtn setSelected:YES];
        
        // 取出对应的asset
        ALAsset *asset = self.photos[index.row];
        
        // 将asset对象添加到数组
        [self.selectPhotos addObject:asset];
        
        // 将图片对url
        [self.selectPhotoUrls addObject:[asset valueForProperty:ALAssetPropertyAssetURL]];
    }
    else // 如果照片被选择
    {
        [cell.selectedBtn setSelected:NO];
        
        // 取出对应的asset对象
        ALAsset *asset = self.photos[index.row];
        
        // 取出asset的url对比
        for (ALAsset *a in self.selectPhotos) {
            NSString *url1 = [asset valueForProperty:ALAssetPropertyAssetURL];
            NSString *url2 = [a valueForProperty:ALAssetPropertyAssetURL];
            
            // 对比。找到相同的url并从选中数组中移除asset
            if([url1 isEqual:url2])
            {
                [self.selectPhotos removeObject:a];
                break;
            }
        }
        
        // 移除不被选中的图片url
        [self.selectPhotoUrls removeObject:[asset valueForProperty:ALAssetPropertyAssetURL]];
    }
    
    if(self.selectPhotos.count == 0)
    {
        self.imageCount.text = @"请选择照片";
    }
    else
    {
        self.imageCount.text = [NSString stringWithFormat:@"已经选择%lu张照片",(unsigned long)self.selectPhotos.count];
    }
    
}


/** 设置每个item的大小*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(70, 70);
}

/** 设置每个item的间距*/
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

#pragma mark - 私有方法

/** 关闭相册*/
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/** 打开相册*/
- (void)albumAction
{
    YDAlbumViewController *album = [[YDAlbumViewController alloc] init];
    album.delegate = self;
    [self.navigationController pushViewController:album animated:YES];
}

/** 确定选择照片*/
- (void)confirm
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(YDImagePickerController: getSelectedPhoto:)]) {
        [self.delegate YDImagePickerController:self getSelectedPhoto:self.selectPhotos];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

/** 将每个图片asset添加到数组中*/
- (void) showPhoto:(ALAssetsGroup *)album
{
    if(album != nil)
    {
        if(self.currentAlbum == nil || ![[self.currentAlbum valueForProperty:ALAssetsGroupPropertyName] isEqualToString:[album valueForProperty:ALAssetsGroupPropertyName]])
        {
            self.currentAlbum = album;
            if (!self.photos)
            {
                _photos = [[NSMutableArray alloc] init];
            }
            else
            {
                [self.photos removeAllObjects];
                
            }
            
            // 创建一个临时数组，存储所有照片的url，与被选中照片url匹配获得索引
            NSMutableArray *tempUrlArr = [NSMutableArray array];
            
            // 创建一个block变量，用于将照片asset添加到数组
            ALAssetsGroupEnumerationResultsBlock assetsEnumerationBlock = ^(ALAsset *result, NSUInteger index, BOOL *stop) {
                if (result)
                {
                    // 将asset存储到数组中
                    [self.photos addObject:result];
                    // 存储临时url数组
                    [tempUrlArr addObject: [result valueForProperty:ALAssetPropertyAssetURL]];
                }
                else
                {
                    
                }
            };
            
            ALAssetsFilter *onlyPhotosFilter = [ALAssetsFilter allPhotos];
            [self.currentAlbum setAssetsFilter:onlyPhotosFilter];
            
            // 调用block
            [self.currentAlbum enumerateAssetsUsingBlock:assetsEnumerationBlock];
            
            // 设置当前控制器的标题
            self.title = [self.currentAlbum valueForProperty:ALAssetsGroupPropertyName];
            
            // 刷新数据源
            [self.collection reloadData];
            
            // 创建一个indexPath
            NSIndexPath *indexPath = nil;
            
            if(self.selectPhotoUrls.count && [tempUrlArr containsObject:[self.selectPhotoUrls lastObject]]){
                // 如果有选中图片，indexPath为选中url数组中的最后一个
                NSUInteger index = [tempUrlArr indexOfObject:[self.selectPhotoUrls lastObject]];
                indexPath = [NSIndexPath indexPathForRow:index  inSection:0];
            
            }
            else{
                // 如果没有选中图片，indexPath为末尾
                indexPath = [NSIndexPath indexPathForRow:self.photos.count - 1 inSection:0];
            }
            
            // collection定位到indexPath，indexPath在视图中央
            [self.collection scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:NO];
        }
    }
}

/** 点击了遮罩*/
- (void)touchCover:(UITapGestureRecognizer *)recognizer
{
    [UIView animateWithDuration:0.25 animations:^{
        recognizer.view.backgroundColor = [UIColor clearColor];
        self.imageView.frame = self.lastFrame;
        //        self.cover.alpha = 0;
    } completion:^(BOOL finished) {
        [recognizer.view removeFromSuperview];
        self.imageView = nil;
    }];
}

#pragma mark - YDAlbumViewControllerDelegate
- (void)selectAlbum:(ALAssetsGroup *)album
{
    [self showPhoto:album];
}

#pragma mark - 懒加载

@end
