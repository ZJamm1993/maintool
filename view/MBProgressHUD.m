//
//  MBProgressHUD.m
//  风聆
//
//  Created by iMac206 on 16/11/29.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import "MBProgressHUD.h"

@implementation MBProgressHUD

+(void)hideHUD
{
    [super hide];
}

+(void)showMessage:(NSString *)msg toView:(UIView *)view
{
    [super showMessage:msg];
}

+(void)showError:(NSString *)msg toView:(UIView *)view
{
    [super showError:msg];
}

+(void)hideHUDForView:(UIView *)view
{
    [super hide];
}

@end
