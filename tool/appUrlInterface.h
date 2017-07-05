//
//  appUrlInterface.h
//  橙子
//
//  Created by Macbook Air on 15/10/13.
//  Copyright (c) 2015年 Macbook Air. All rights reserved.
//

/* 风聆app接口管理*/
#import <Foundation/Foundation.h>

@interface appUrlInterface : NSObject
#pragma mark - 创建方法
+ (instancetype)urlInterface;
/** 需要userName的创建方法*/
- (instancetype)initWithUserName:(NSString *)userName;
/** 需要listenerID的创建方法*/
- (instancetype)initWithListenerId:(NSString *)listenerId;
/** 需要feelingId的创建方法*/
- (instancetype)initWithFeelingId:(NSString *)feelingId;
/** 需要commentId的创建方法*/
- (instancetype)initWithCommentId:(NSString *)commentId;
/** 需要userID的创建方法*/
- (instancetype)initWithUserId:(NSString *)userId;
-(NSString*)mainUrl;

#pragma mark - 图片相关
/** 卡片图片地址*/
@property (nonatomic, copy) NSString *carImageUrl;
/** 头像地址*/
@property (nonatomic, copy) NSString *portraitUrl;
/** 心情图片地址*/
@property (nonatomic ,copy) NSString *feelingPhotosUrl;

#pragma mark - 用户相关
/** 登录接口*/
@property (nonatomic, copy) NSString *lauchToServer;
/** 修改密码*/
@property (nonatomic ,copy) NSString *modifyPassword;
/** 注册接口*/
@property (nonatomic ,copy) NSString *Register;
/** 通过user_id查询用户详细资料*/
@property (nonatomic ,copy) NSString *getUserDetailInfo;
/** 通过user_name查询用户详细资料*/
@property (nonatomic ,copy) NSString *getUserDetailInfoByUserName;
/** 修改资料*/
@property (nonatomic, copy) NSString *putModifyProfile;

#pragma mark - 聆听者相关
/** 获取聆听者接口*/
@property (nonatomic, copy) NSString *getListenerList;
/** 获取在线聆听者接口*/
@property (nonatomic, copy) NSString *getListenerListOnline;
/** 获取某个聆听者的资料*/
@property (nonatomic, copy) NSString *getListenerInfo;
/** 通过user_name获取某个聆听者的资料*/
@property (nonatomic, copy) NSString *getListenerInfoByUserName;
/** 通过user_name和自己的user_id获取某个聆听者的资料*/
@property (nonatomic, copy) NSString *getListenerInfoByUserNameWithUserId;
/** 评价聆听者*/
@property (nonatomic, copy) NSString *postEvaluations;
/** 获取聆听者所有评论*/
@property (nonatomic, copy) NSString *getEvaluations;
/** 收藏和点赞接口*/
@property (nonatomic, copy) NSString *putAttitudeAndAttention;
/** 申请成为聆听者*/
@property (nonatomic, copy) NSString *postApplys;
@property (nonatomic,copy) NSString* listenerSearch;
@property (nonatomic,copy) NSString* putListenerInfo;
@property (nonatomic,copy) NSString* listenerCondition;

#pragma mark - 群组相关
/** 获取圈子列表接口*/
@property (nonatomic, copy) NSString *getGroupsList;

#pragma mark - 发现相关
/** 获取发现列表接口*/
@property (nonatomic, copy) NSString *getInfosList;
/** 获取单个文章接口*/
@property (nonatomic, copy) NSString *getInfoOne;

-(NSString*)getArticleURLWithInfoID:(NSString*)info_id;

#pragma mark - 心墙相关
/** 发表心情*/
@property (nonatomic, copy) NSString *postFeeling;
/** 删除心情*/
@property (nonatomic, copy) NSString *deleteFeeling;
/** 获取心墙上的心情*/
@property (nonatomic, copy) NSString *getHeartWallFeeling;
/** 对心情点赞*/
@property (nonatomic, copy) NSString *putFeelingFavors;
/** 对心情进行评论*/
@property (nonatomic, copy) NSString *postFeelingComment;
/** 删除心情的某一条评论*/
@property (nonatomic, copy) NSString *deleteFeelingComment;
/** 查询心情的评论*/
@property (nonatomic, copy) NSString *getFeelingComment;

#pragma mark - 个人中心
/** 查询我的心情*/
@property (nonatomic, copy) NSString *getMyFeelings;
/** 查询我的关注*/
@property (nonatomic, copy) NSString *getMyAttention;
/** 查询赞过我的*/
@property (nonatomic ,copy) NSString *getAttitudeToMe;
/** 查询关注我的*/
@property (nonatomic ,copy) NSString *getAttentionMe;
/** 我的圈子*/
@property (nonatomic, copy) NSString *getMyGroups;
/** 反馈接口*/
@property (nonatomic, copy) NSString *feedback;

#pragma mark - 消息相关
/** 开始计时*/
@property (nonatomic, strong) NSString *startTime;
/** 结束计时*/
@property (nonatomic, strong) NSString *endTime;

/** 轮询查询消息*/
@property (nonatomic ,copy) NSString *getRunLoopUnreadMsg;
/** 查询我的心墙消息*/
@property (nonatomic ,copy) NSString *getFeelingMessages;
/** 查询我的文章消息*/
@property (nonatomic ,copy) NSString *getArticleMessages;
/** 查询系统公告*/
@property (nonatomic ,copy) NSString *getAnnoucementMessages;
/** 查询申请进度*/
@property (nonatomic ,copy) NSString *getApplyProccessMessages;
/** 查询预约进度*/
@property (nonatomic ,copy) NSString *getAppointmentMessages;

#pragma mark - 预约模块

/** 提交预约*/
@property (nonatomic, strong) NSString *postAppointment;
/** 更新预约状态*/
@property (nonatomic, strong) NSString *putAppointment;
/** 查询可预约时间*/
@property (nonatomic, strong) NSString *getAppointmentDate;

/** 查询预约的订单*/
@property (nonatomic, strong) NSString *getAppointments;
@end
