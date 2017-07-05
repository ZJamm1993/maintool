//
//  ZGMain.m
//  风聆
//
//  Created by HIChen on 16/7/7.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import "ZGMain.h"

@implementation ZGMain
/** 进入个人中心*/
- (void)enterProfile{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_MAIN forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"进入个人中心" properties:params];
}
/** 进入首页模块*/
- (void)enterHome{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_MAIN forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"进入首页模块" properties:params];
}
/** 进入消息模块*/
- (void)enterConversation{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_MAIN forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"进入消息模块" properties:params];
}
/** 进入心墙模块*/
- (void)enterFeelingWall{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_MAIN forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"进入心墙模块" properties:params];
}
/** 进入发现模块*/
- (void)enterDiscover{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_MAIN forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"进入发现模块" properties:params];
}
/** 退出个人中心*/
- (void)outProfile{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_MAIN forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"退出个人中心" properties:params];
}

@end
