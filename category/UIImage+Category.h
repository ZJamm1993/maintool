//
//  UIImage+Category.h
//  橙子
//
//  Created by Macbook Air on 15/10/8.
//  Copyright (c) 2015年 Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

/* 颜色转换为图片*/
+(UIImage*) createImageWithColor:(UIColor*) color;
+(UIImage*)imageWithColor:(UIColor*)color;

/** 垂直翻转*/
- (UIImage *)flipVertical;

/** 水平翻转*/
- (UIImage *)flipHorizontal;

/** 改变size*/
- (UIImage *)resizeToWidth:(CGFloat)width height:(CGFloat)height;

/** 裁切*/
- (UIImage *)cropImageWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;

/** 获取图片*/
+ (UIImage *)getImageFromURL:(NSString *)fileURL;

/** 获取图片data*/
+ (NSData *)getDataFromURL:(NSString *)fileURL;

/** 加载图片*/
+ (UIImage *)loadImage:(NSString *)fileName;

/** 保存图片*/
+ (void)saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension;

@end
