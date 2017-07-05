//
//  HINothingView.h
//  风聆
//
//  Created by HIChen on 16/7/8.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HINothingView : UIView

- (instancetype )initWithImageName:(NSString *)imageName description:(NSString *)description toAction:(NSString *)action frame:(CGRect)frame;

/** 刷新的回调Blocked*/
@property (nonatomic, strong) void(^refreshBlock)(id object, id other);

/** view*/
@property (nonatomic, strong) UIView *nothingView;

/** activity*/
@property (nonatomic, weak) UIActivityIndicatorView *activity;
@end
