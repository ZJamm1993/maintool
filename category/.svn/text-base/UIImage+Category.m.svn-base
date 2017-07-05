//
//  UIImage+Category.m
//  橙子
//
//  Created by Macbook Air on 15/10/8.
//  Copyright (c) 2015年 Macbook Air. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)

+ (UIImage*)createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, screenWidth, screenHeight);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+(UIImage*)imageWithColor:(UIColor*)color
{
    return [UIImage createImageWithColor:color];
}

- (UIImage *)flip:(BOOL)isHorizontal
{
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    // &UIGraphicsBeginImageContextWithOptions != nil 永远为真？
    if (&UIGraphicsBeginImageContextWithOptions != nil) {
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    }
    else {
//        UIGraphicsBeginImageContext(rect.size);
    }
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextClipToRect(ctx, rect);
    if (isHorizontal) {
        CGContextRotateCTM(ctx, M_PI);
        CGContextTranslateCTM(ctx, -rect.size.width, -rect.size.height);
    }
    CGContextDrawImage(ctx, rect, self.CGImage);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)flipVertical
{
    return [self flip:NO];
}

- (UIImage *)flipHorizontal
{
    return [self flip:YES];
}

- (UIImage *)resizeToWidth:(CGFloat)width height:(CGFloat)height
{
    CGSize size = CGSizeMake(width, height);
    if (&UIGraphicsBeginImageContextWithOptions != nil) {
        UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    }
    else {
//        UIGraphicsBeginImageContext(size);
    }
    [self drawInRect:CGRectMake(0, 0, width, height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)cropImageWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height
{
    // 获取到的是大图
    CGRect rect = CGRectMake(x, y, width, height);
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    return image;
}

+ (UIImage *)getImageFromURL:(NSString *)fileURL {
    YDLog(@"执行图片下载函数");
    UIImage *result;
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    
    return result;
}

+ (NSData *)getDataFromURL:(NSString *)fileURL {
    YDLog(@"执行图片下载函数");
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    
    return data;
}

+ (UIImage *)loadImage:(NSString *)fileName
{
    UIImage *result = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@", fileName]];
    
    return result;
}

+ (void)saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension
{
    NSString *filePath = imageName;
    if ([[extension lowercaseString] isEqualToString:@"png"])
    {
        BOOL isOK = [UIImagePNGRepresentation(image) writeToFile:filePath atomically:YES];
        YDLog(isOK?@"YES":@"NO");
    }
    else if([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"])
    {
        BOOL isOK = [UIImageJPEGRepresentation(image, 0.7) writeToFile:filePath atomically:YES];
        YDLog(isOK?@"YES":@"NO");
    }
    else
    {
        YDLog(@"文件后缀不认识");
    }
}

@end
