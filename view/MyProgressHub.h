//
//  MyProgressHub.h
//  talk_cons
//
//  Created by iMac206 on 16/8/18.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyProgressHub : UIView

+(BOOL)isShowing;

//显示一个菊花和一句文字
+(void)showProgress:(NSString*)msg;

//显示一句文字
+(void)showMessage:(NSString*)msg;

//显示一个钩和一句文字
+(void)showSuccess:(NSString*)msg;

//显示一个叉和一句文字
+(void)showError:(NSString*)msg;

//显示主动隐藏
+(void)hide;

+(void)askToLogin;

@end
