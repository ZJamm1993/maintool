//
//  ZGFeelingWall.h
//  风聆
//
//  Created by HIChen on 16/7/7.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

/** 负责记录心墙模块事件的工具类*/
#import <Foundation/Foundation.h>
#import "Zhuge.h"

#define ID_FEELING @"心墙模块"
@interface ZGFeelingWall : NSObject
#pragma mark - 心墙
/** 尝试刷新心墙*/
- (void)tryRefreshFeelings;
/** 加载更多心情*/
- (void)tryLoadMoreFeelings;
/** 进入心情详情*/
- (void)enterFeelingDetail;
/** 心墙页面进行点赞心情*/
- (void)approveFeelingInWall;
/** 心墙页面尝试进行评论心情*/
- (void)trySendCommentInWall;
/** 心墙页面成功进行评论心情*/
- (void)successedSendCommentInWall;
/** 尝试发表心情*/
- (void)trySendFeeling;
/** 成功发表心情*/
- (void)successedSendFeeling;
/** 退出发表心情*/
- (void)cancelSendFeeling;

#pragma mark - 心情
/** 心情页面尝试进行评论心情*/
- (void)trySendCommentInFeeling;
/** 心情页面进行点赞心情*/
- (void)approveFeelingInFeeling;
/** 取消进行评论心情*/
- (void)cancelSendComment;
/** 成功评论心情*/
- (void)successedSendCommentInFeeling;
/** 尝试进行回复其他评论*/
- (void)tryReplyOtherComment;
/** 成功回复其他评论*/
- (void)successedReplyOtherComment;
/** 尝试进行举报心情*/
- (void)tryComplainFeeling;
/** 取消进行举报心情*/
- (void)cancelComplainFeeling;
/** 成功举报心情*/
- (void)successedComplainFeeling;
/** 尝试进行举报他人评论*/
- (void)tryComplainOtherFeelingComment;
/** 取消进行举报他人评论*/
- (void)cancelComplainOtherFeelingComment;
/** 成功举报他人评论*/
- (void)successedComplainOtherFeelingComment;
/** 尝试刷新心情*/
- (void)tryRefreshFeeling;
/** 尝试加在更多的心情评论*/
- (void)tryLoadMoreFeelingComments;
/** 退出心情页面*/
- (void)outFeeling;
@end
