//
//  ZGConversation.h
//  风聆
//
//  Created by HIChen on 16/7/7.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

/** 负责记录消息模块事件的工具类*/
#import <Foundation/Foundation.h>
#import "Zhuge.h"

#define ID_CONVERSATION @"消息通知模块"
@interface ZGConversation : NSObject

/** 查看消息*/
- (void)checkMessages;
/** 查看通知*/
- (void)checkNotice;
/** 尝试刷新消息*/
- (void)tryRefreshMessages;

/** 进入查看与我相关的心情评论*/
- (void)enterFeelingOfMe;
/** 尝试刷新与我相关的心情评论*/
- (void)tryRefreshFeelingOfMe;
/** 从通知进入查看心情*/
- (void)checkFeeling;
/** 退出查看与我相关的心情评论*/
- (void)outFeelingOfMe;

/** 进入查看与我相关的文章评论*/
- (void)enterDiscoverOfMe;
/** 尝试刷新与我相关的文章评论*/
- (void)tryRefreshDiscoverOfMe;
/** 从通知进入查看文章*/
- (void)checkArticle;
/** 退出查看与我相关的文章评论*/
- (void)outArticleOfMe;

/** 进入查看与我相关的预约通知*/
- (void)enterAppointmentOfMe;
/** 尝试刷新与我相关的预约通知*/
- (void)tryRefreshAppointmentOfMe;
/** 从通知进入查看预约详情*/
- (void)checkAppointment;
/** 退出查看与我相关的预约*/
- (void)outAppointmentOfMe;

/** 进入查看官方公告*/
- (void)enterOfficial;
/** 尝试刷新官方公告*/
- (void)TryRefreshOfficial;
/** 查看官方公告*/
- (void)checkOfficial;
/** 退出查看官方公告*/
- (void)outOfficial;


/** 进入聊天窗口*/
- (void)enterChatting;
/** 删除消息*/
- (void)deleteMessage;
/** 尝试搜索消息*/
- (void)trySeachMessage;

@end
