//
//  ZGLaunch.h
//  风聆
//
//  Created by HIChen on 16/7/7.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

/** 负责记录登录注册模块事件的工具类*/
#import <Foundation/Foundation.h>
#import "Zhuge.h"

#define ID_LAUNCH @"登录注册模块"
@interface ZGLaunch : NSObject
/** 获取验证码*/
- (void)getCode;
/** 尝试验证手机*/
- (void)tryTestCode;
/** 验证手机成功*/
- (void)successedTestCode;
#pragma mark - 登录
/** 尝试登录*/
- (void)tryLaunch;
/** 成功登录应用服务器*/
- (void)successedLaunchApp;
/** 成功登录环信服务器*/
- (void)successedLaunchChat;
/** 成功登录*/
- (void)successedLaunch;
/** 进入注册页面*/
- (void)enterRegister;
/** 进入找回密码*/
- (void)enterModifyPassword;
#pragma mark - 注册
/** 尝试注册用户*/
- (void)tryRegister;
/** 注册成功*/
- (void)successedRegister;
/** 退出注册*/
- (void)outRegister;
#pragma mark - 忘记密码
/** 尝试修改密码*/
- (void)tryChangePassword;
/** 成功修改密码*/
- (void)successedChangePassword;
/** 退出修改密码*/
- (void)outChangePassword;
@end
