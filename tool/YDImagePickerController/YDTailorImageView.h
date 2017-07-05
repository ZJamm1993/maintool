//
//  YDTailorImageView.h
//  橙子
//
//  Created by Macbook Air on 15/11/13.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^comfirButtonBlock)(id object);
typedef void(^cancelButtonBlock)(id object);

@interface YDTailorImageView : UIView
/** comfirButton的block回调*/
@property (nonatomic, strong) comfirButtonBlock comfirButtonBlock;
/** cancelButton的block回调*/
@property (nonatomic, strong) cancelButtonBlock cancelButtonBlock;


/** 设置裁剪的图片*/
- (void)setImage:(UIImage *)image;
/** 获取被裁剪的图片*/
- (UIImage *)cropImage;

/** 设置裁剪框的大小，和显示的圆角*/
- (void)setCropSize:(CGSize)size cornerRaduis:(CGFloat)cornerRaduis;

- (void)setComfirBlock:(comfirButtonBlock)comfirBlock cancelBlock:(cancelButtonBlock)cancelBlock;

@end
