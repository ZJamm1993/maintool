//
//  YDPhotosCell.h
//  橙子
//
//  Created by Macbook Air on 15/11/7.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YDPhotosCell;

@protocol YDPhotosCellDelegate <NSObject>

@required

/** 点击来按钮的代理方法*/
- (void)YDPhotosCell:(YDPhotosCell *)cell;

@end


@interface YDPhotosCell : UICollectionViewCell

/** 图片*/
@property (nonatomic ,weak) UIImageView *photoView;

/** 标记按钮*/
//@property (nonatomic ,weak) UIImageView *selectedBtn;

/** 标记按钮*/
@property (nonatomic ,weak) UIButton *selectedBtn;

/** 代理*/
@property (nonatomic ,weak) id<YDPhotosCellDelegate> delegate;
@end
