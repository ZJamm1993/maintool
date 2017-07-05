//
//  UIFont+Category.m
//  橙子
//
//  Created by Macbook Air on 15/10/10.
//  Copyright (c) 2015年 Macbook Air. All rights reserved.
//

#import "UIFont+Category.h"

@implementation UIFont (Category)
+ (CGSize)sizeWithString:(NSString *)string withMaxSize:(CGSize)maxSize withFont:(CGFloat)fontSize
{
    NSDictionary *dict= @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize size = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}
@end
