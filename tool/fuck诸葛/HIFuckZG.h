//
//  HIFuckZG.h
//  风聆
//
//  Created by HIChen on 16/7/7.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "God.h"
#import "Zhuge.h"
#import "ZGLaunch.h"
#import "ZGMain.h"
#import "ZGHome.h"
#import "ZGConversation.h"
#import "ZGFeelingWall.h"
#import "ZGDiscover.h"
#import "ZGProfile.h"
#import "ZGChat.h"

#define ID_APP @"app活动"
@interface HIFuckZG : NSObject
+ (instancetype)manager;

/** 登录注册模块事件*/
@property (nonatomic, strong) ZGLaunch *launch;
/** 整体模块事件*/
@property (nonatomic, strong) ZGMain *main;
/** 首页聊聊模块事件*/
@property (nonatomic, strong) ZGHome *home;
/** 消息模块事件*/
@property (nonatomic, strong) ZGConversation *conversation;
/** 心墙模块事件*/
@property (nonatomic, strong) ZGFeelingWall *feeling;
/** 发现模块事件*/
@property (nonatomic, strong) ZGDiscover *discover;
/** 个人中心模块事件*/
@property (nonatomic, strong) ZGProfile *profile;
/** 聊天过程模块事件*/
@property (nonatomic, strong) ZGChat *chat;

#pragma mark - app活动的事件记录

/** 启动诸葛*/
- (void)startZhugeWithOptions:(NSDictionary *)launchOptions;

/** 记录启动app*/
- (void)launchApp;

/** 记录进入后台*/
- (void)enterBackground;

/** 记录回到前台*/
- (void)enterForeground;

/** 记录登录用户*/
- (void)registerLaunchUser;
@end
