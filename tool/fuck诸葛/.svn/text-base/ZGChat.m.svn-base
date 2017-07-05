//
//  ZGChat.m
//  风聆
//
//  Created by HIChen on 16/7/7.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import "ZGChat.h"

@implementation ZGChat

/** 接受聆听*/
- (void)acceptListenerServer{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_CHAT forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"接受聆听" properties:params];
}
/** 拒绝聆听*/
- (void)rejectListenerServer{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_CHAT forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"拒绝聆听" properties:params];
}
/** 超时未对聆听做操作*/
- (void)overListenerServer{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_CHAT forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"超时未对聆听做操作" properties:params];
}
/** 尝试开始计时*/
- (void)tryBeginServer{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_CHAT forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试开始计时" properties:params];
}
/** 成功开始计时*/
- (void)successedBeginServer{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_CHAT forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功开始计时" properties:params];
}
/** 结束聆听*/
- (void)endListenerServer{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_CHAT forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"结束聆听" properties:params];
}
/** 尝试评价聆听服务*/
- (void)tryEvaluateServer{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_CHAT forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试评价聆听服务" properties:params];
}
/** 成功评价聆听服务*/
- (void)successedEvaluateServer{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_CHAT forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功评价聆听服务" properties:params];
}
/** 放弃评价聆听服务*/
- (void)cancelEvaluateServer{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_CHAT forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"放弃评价聆听服务" properties:params];
}
/** 尝试举报用户*/
- (void)tryComplainUser{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_CHAT forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试举报用户" properties:params];
}
/** 成功举报用户*/
- (void)successedComplainUser{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_CHAT forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功举报用户" properties:params];
}
/** 放弃举报用户*/
- (void)cancelComplainUser{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_CHAT forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"放弃举报用户" properties:params];
}
@end
