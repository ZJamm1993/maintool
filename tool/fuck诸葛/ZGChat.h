//
//  ZGChat.h
//  风聆
//
//  Created by HIChen on 16/7/7.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

/** 负责记录即使会话模块事件的工具类*/
#import <Foundation/Foundation.h>
#import "Zhuge.h"

#define ID_CHAT @"聆听服务过程"
@interface ZGChat : NSObject
/** 接受聆听*/
- (void)acceptListenerServer;
/** 拒绝聆听*/
- (void)rejectListenerServer;
/** 超时未对聆听做操作*/
- (void)overListenerServer;
/** 尝试开始计时*/
- (void)tryBeginServer;
/** 成功开始计时*/
- (void)successedBeginServer;
/** 结束聆听*/
- (void)endListenerServer;
/** 尝试评价聆听服务*/
- (void)tryEvaluateServer;
/** 成功评价聆听服务*/
- (void)successedEvaluateServer;
/** 放弃评价聆听服务*/
- (void)cancelEvaluateServer;
/** 尝试举报用户*/
- (void)tryComplainUser;
/** 成功举报用户*/
- (void)successedComplainUser;
/** 放弃举报用户*/
- (void)cancelComplainUser;
@end
