//
//  ZGLaunch.m
//  风聆
//
//  Created by HIChen on 16/7/7.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import "ZGLaunch.h"

@implementation ZGLaunch
/** 获取验证码*/
- (void)getCode{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_LAUNCH forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"获取验证码" properties:params];
}
/** 尝试验证手机*/
- (void)tryTestCode{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_LAUNCH forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试验证手机" properties:params];
}
/** 成功验证手机*/
- (void)successedTestCode{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_LAUNCH forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功验证手机" properties:params];
}
#pragma mark - 登录
/** 尝试登录*/
- (void)tryLaunch{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_LAUNCH forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试登录" properties:params];
}
/** 成功登录应用服务器*/
- (void)successedLaunchApp{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_LAUNCH forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功登录应用服务器" properties:params];
}
/** 成功登录环信服务器*/
- (void)successedLaunchChat{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_LAUNCH forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功登录环信服务器" properties:params];
}
/** 成功登录*/
- (void)successedLaunch{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_LAUNCH forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功登录" properties:params];
}
/** 进入注册页面*/
- (void)enterRegister{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_LAUNCH forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"进入注册页面" properties:params];
}
/** 进入找回密码*/
- (void)enterModifyPassword{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_LAUNCH forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"进入找回密码" properties:params];
}
#pragma mark - 注册
/** 尝试注册用户*/
- (void)tryRegister{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_LAUNCH forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试注册用户" properties:params];
}
/** 注册成功*/
- (void)successedRegister{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_LAUNCH forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"注册成功" properties:params];
}
/** 退出注册*/
- (void)outRegister{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_LAUNCH forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"退出注册" properties:params];
}
#pragma mark - 忘记密码
/** 尝试修改密码*/
- (void)tryChangePassword{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_LAUNCH forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试修改密码" properties:params];
}
/** 成功修改密码*/
- (void)successedChangePassword{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_LAUNCH forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功修改密码" properties:params];
}
/** 退出修改密码*/
- (void)outChangePassword{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_LAUNCH forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"退出修改密码" properties:params];
}
@end
