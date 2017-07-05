//
//  YDAlbumViewController.m
//  橙子
//
//  Created by Macbook Air on 15/11/7.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import "YDAlbumViewController.h"
#import "YDAlbumCell.h"

@interface YDAlbumViewController ()

/** 照片资源库*/
@property (nonatomic, strong) ALAssetsLibrary *assetsLibrary;

/** 照片专辑数组*/
@property (nonatomic, strong) NSMutableArray *albums;

@end

@implementation YDAlbumViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        UIBarButtonItem *cancle=[[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancle)];
        self.navigationItem.rightBarButtonItem=cancle;
        self.title=@"选择相册";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.albums == nil) {
        _albums = [[NSMutableArray alloc] init];
    } else {
        [self.albums removeAllObjects];
    }
    
    // setup our failure view controller in case enumerateGroupsWithTypes fails
    ALAssetsLibraryAccessFailureBlock failureBlock = ^(NSError *error) {
//        NSString *errorMessage = nil;
//        switch ([error code]) {
//            case ALAssetsLibraryAccessUserDeniedError:
//            case ALAssetsLibraryAccessGloballyDeniedError:
//                errorMessage = @"The user has declined access to it.";
//                break;
//            default:
//                errorMessage = @"Reason unknown.";
//                break;
//        }
        
    };
    
    // emumerate through our groups and only add groups that contain photos
    ALAssetsLibraryGroupsEnumerationResultsBlock listGroupBlock = ^(ALAssetsGroup *group, BOOL *stop) {
        
        ALAssetsFilter *onlyPhotosFilter = [ALAssetsFilter allPhotos];
        [group setAssetsFilter:onlyPhotosFilter];
        if ([group numberOfAssets] > 0)
        {
            [self.albums addObject:group];
        }
        else
        {
            [self.tableView reloadData];
        }
    };
    
    // enumerate only photos
    NSUInteger groupTypes = ALAssetsGroupAlbum | ALAssetsGroupEvent | ALAssetsGroupFaces | ALAssetsGroupSavedPhotos;
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)cancle{
    // 直接退出照片选择控制器
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger num=[_albums count];
    return num;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YDAlbumCell *cell = [YDAlbumCell cellWithTableView:tableView];
    
    // 取出图片
    ALAssetsGroup *group = [_albums objectAtIndex:indexPath.row];
    CGImageRef posterImageRef = [group posterImage];
    UIImage *posterImage = [UIImage imageWithCGImage:posterImageRef];
    
    // 添加属性
    cell.thumbnailView.image = posterImage;
    cell.albumLab.text = [ group valueForProperty:ALAssetsGroupPropertyName];
    cell.photosCountLab.text = [@(group.numberOfAssets) stringValue];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.navigationController popViewControllerAnimated:YES];
    if(self.delegate && [self.delegate respondsToSelector:@selector(selectAlbum:)])
    {
        [self.delegate selectAlbum:self.albums[indexPath.row]];
    }
    
}
@end
