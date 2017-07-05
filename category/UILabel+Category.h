//
//  UILabel+Category.h
//  橙子
//
//  Created by Macbook Air on 15/10/28.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)

/** 根据label已有的属性设置行间距*/
+ (UILabel *)setLabel:(UILabel *)label lineSpace:(CGFloat)lineSpace;
-(void)setLineSpace:(CGFloat)lineSpace;

/** 根据label已有的属性设置行间距和裁剪样式*/
+ (UILabel *)setLabel:(UILabel *)label lineSpace:(CGFloat)lineSpace lineBreakMode:(NSLineBreakMode)lineBreakMode;

/** 根据文字设定属性返回一个size*/
+ (CGSize)sizeWithText:(NSString *)text textFont:(CGFloat)font lineSpace:(CGFloat)lineSpace maxSize:(CGSize)maxSize numberOfLines:(NSInteger)number;

+ (UILabel *)setLabel:(UILabel *)label Text:(NSString *)text textFont:(CGFloat)font lineSpace:(CGFloat)lineSpace numberOfLines:(NSInteger)number;
@end
