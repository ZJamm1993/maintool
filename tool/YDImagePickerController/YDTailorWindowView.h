//
//  YDTailorWindowView.h
//  橙子
//
//  Created by Macbook Air on 15/11/13.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YDTailorWindowView : UIView


/** 是否为圆形裁剪框*/
@property (nonatomic, assign, getter = isCircle) BOOL circle;

/** 设置裁剪框的大小*/
- (void)setCropSize:(CGSize)size cornerRaduis:(CGFloat)cornerRaduis;
- (CGSize)cropSize;

@end
