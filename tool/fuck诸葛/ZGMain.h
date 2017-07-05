//
//  ZGMain.h
//  风聆
//
//  Created by HIChen on 16/7/7.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

/** 负责记录APP框架点击事件的工具类*/
#import <Foundation/Foundation.h>
#import "Zhuge.h"

#define ID_MAIN @"主界面模块"
@interface ZGMain : NSObject
/** 进入个人中心*/
- (void)enterProfile;
/** 进入首页模块*/
- (void)enterHome;
/** 进入消息模块*/
- (void)enterConversation;
/** 进入心墙模块*/
- (void)enterFeelingWall;
/** 进入发现模块*/
- (void)enterDiscover;
/** 退出个人中心*/
- (void)outProfile;
@end
