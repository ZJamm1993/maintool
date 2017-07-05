//
//  ZGHome.h
//  风聆
//
//  Created by HIChen on 16/7/7.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

/** 负责记录首页聊聊模块事件的工具类*/
#import <Foundation/Foundation.h>
#import "Zhuge.h"

#define ID_HOME @"首页聊聊模块"
@interface ZGHome : NSObject

/** 查看推荐的聆听者*/
- (void)checkRecommendListener;
/** 查看筛选的聆听者*/
- (void)checkALlListener;
/** 尝试刷新聆听者列表*/
- (void)tryRefreshListener;

#pragma mark - 全部聆听者相关
/** 成功筛选聆听者*/
- (void)successedChooseListener;
/** 尝试搜索聆听者*/
- (void)trySearchListener;
/** 成功搜索聆听者*/
- (void)successedSeachListener;
/** 取消进行搜索聆听者*/
- (void)cancelSearchListener;

#pragma mark - 聆听者资料资料相关
/** 进入聆听者个人资料界面*/
- (void)enterListenerProfile;
/** 滑动卡片查看聆听者*/
- (void)checkListenerList;
/** 查看聆听者头像*/
- (void)checkListenerAvatar;
/** 查看聆听者卡片*/
- (void)checkListenerCard;
/** 点赞聆听者*/
- (void)approveListener;
/** 关注聆听者*/
- (void)attenListener;
/** 查看聆听服务评价*/
- (void)checkListenerEvoluation;
/** 查看聆听者资料*/
- (void)checkListenerProfile;
/** 退出聆听者资料界面*/
- (void)outListenerProfile;
/** 尝试刷新聆听者资料*/
- (void)tryRefreshListenerProfile;
/** 尝试刷新聆听者评价*/
- (void)tryRefreshListenerEvaluation;

#pragma mark - 呼叫预、约模块
/** 尝试预约*/
- (void)tryHaveAppointment;
/** 取消进行预约*/
- (void)cancelHaveAppointment;
/** 成功预约*/
- (void)successedHaveAppointment;
/** 尝试呼叫*/
- (void)tryCalling;
/** 成功呼叫*/
- (void)successedCalling;
/** 取消进行呼叫*/
- (void)cancelCalling;
@end
