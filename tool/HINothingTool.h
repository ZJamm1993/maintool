//
//  HINothingTool.h
//  风聆
//
//  Created by iMac206 on 16/6/28.
//  Copyright © 2016年 Macbook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HINothingTool : NSObject
+ (UIView *)nothingWithImageName:(NSString *)imageName description:(NSString *)description toAction:(NSString *)action;

+ (UIView *)nothingWithImageName:(NSString *)imageName description:(NSString *)description toAction:(NSString *)action frame:(CGRect)frame;

- (instancetype )initWithImageName:(NSString *)imageName description:(NSString *)description toAction:(NSString *)action frame:(CGRect)frame;

/** 刷新的回调Blocked*/
@property (nonatomic, strong) void(^refreshBlock)(id object);

/** view*/
@property (nonatomic, strong) UIView *nothingView;

/** activity*/
@property (nonatomic, weak) UIActivityIndicatorView *activity;
@end
