//
//  ZGDiscover.h
//  风聆
//
//  Created by HIChen on 16/7/7.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

/** 负责记录发现模块事件的工具类*/
#import <Foundation/Foundation.h>
#import "Zhuge.h"

#define ID_DISCOVER @"发现模块"
@interface ZGDiscover : NSObject
/** 查看活动*/
- (void)checkAtivity;
/** 查看文章*/
- (void)checkArticle;
/** 退出查看文章或活动*/
- (void)outArticleOrAtivity;
/** 尝试将文章标记为不喜欢*/
- (void)tryApproveArticleForUnlike;
/** 取消将文章标记为不喜欢*/
- (void)cancelApproveArticleForUnlike;
/** 成功将文章标记为不喜欢*/
- (void)successedApproveArticleForUnlike;

/** 尝试进行举报文章或活动*/
- (void)tryComplainArticleOrActivity;
/** 取消举报文章或活动*/
- (void)cancelComplainArticleOrActivity;
/** 成功举报文章或活动*/
- (void)successedComplainArticleOrActivity;
/** 尝试在文章或活动页面进行评论*/
- (void)trySendCommentInAA;
/** 取消在文章或活动页面进行评论*/
- (void)cancelSendCommentInAA;
/** 成功在文章或活动页面进行评论*/
- (void)successedSendCommentInAA;
/** 进入评论页面查看评论*/
- (void)enterAAComents;
/** 收藏文章*/
- (void)collectAA;
/** 尝试分享文章或活动*/
- (void)tryShareAA;
/** 取消分享文章或活动*/
- (void)cancelShareAA;
/** 成功分享文章或活动*/
- (void)successedShareAA;
/** 尝试在评论页面进行评论文章或活动*/
- (void)trySendCommentInComents;
/** 取消在评论页面进行评论文章或活动*/
- (void)cancelSendCommentInComents;
/** 成功在评论页面评论文章或活动*/
- (void)successedSendCommentInComments;
/** 尝试在评论页面评论他人的评论*/
- (void)tryReplyOtherComment;
/** 取消在评论页面评论他人的评论*/
- (void)cancelReplyOtherComment;
/** 成功在评论页面评论他人的评论*/
- (void)successeddReplyOtherComment;
/** 尝试举报他人对文章或活动的评论*/
- (void)tryComplainComment;
/** 取消举报他人对文章或活动的评论*/
- (void)cancelComplainComment;
/** 成功举报他人对文章或活动的评论*/
- (void)successedCompalinComment;

/** 尝试刷新文章或活动的评论*/
- (void)tryRefreshComments;
/** 尝试加在更多的文章或活动评论*/
- (void)tryLoadMoreComments;
@end
