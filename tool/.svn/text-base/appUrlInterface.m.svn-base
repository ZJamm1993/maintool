//
//  appUrlInterface.m
//  橙子
//
//  Created by Macbook Air on 15/10/13.
//  Copyright (c) 2015年 Macbook Air. All rights reserved.
//

#import "appUrlInterface.h"
#import "YDAccountTool.h"
#import "YDaccount.h"

@interface appUrlInterface()
/** 接口的主要路径*/
@property (nonatomic, strong) NSString *mainUrl;
/** 个人资料*/
@property (nonatomic, strong) YDaccount *account;
/** 聆听者id*/
@property (nonatomic, strong) NSString *listenerId;
/** 心情id*/
@property (nonatomic, strong) NSString *feelingId;
/** 评论id*/
@property (nonatomic, strong) NSString *commentId;
/** 用户名*/
@property (nonatomic, strong) NSString *userName;
/** 用户名*/
@property (nonatomic, strong) NSString *userId;
@end

@implementation appUrlInterface


+ (instancetype)urlInterface
{
    return [[self alloc] init];
}

- (instancetype)initWithUserName:(NSString *)userName{
    self = [super init];
    if (self) {
        self.userName = userName;
    }
    return self;
}

- (instancetype)initWithListenerId:(NSString *)listenerId
{
    self = [super init];
    if (self) {
        self.listenerId = listenerId;
    }
    return self;
}

- (instancetype)initWithFeelingId:(NSString *)feelingId
{
    self = [super init];
    if (self) {
        self.feelingId = feelingId;
    }
    return self;
}

- (instancetype)initWithCommentId:(NSString *)commentId
{
    self = [super init];
    if (self) {
        self.commentId = commentId;
    }
    return self;
}

- (instancetype)initWithUserId:(NSString *)userId
{
    self = [super init];
    if (self) {
        self.userId = userId;
    }
    return self;
}

- (YDaccount *)account
{
    if (_account == nil) {
        _account = [YDAccountTool account];
    }
    return _account;
}

/** 获取接口主路径*/
- (NSString *)mainUrl
{
    if (_mainUrl == nil) {
        /** 自定义Log*/
//        #ifdef DEBUG
//        _mainUrl = @"ht tp://210.38.111.146:8080/WindBell";
//        #else
//        _mainUrl=@"ht tp://test2.eap.gzido.com/WindBell";
//        #endif
        
        _mainUrl = is_test_server?@"http://test2.eap.gzido.com/WindBell":@"http://www.gzido.com/WindBell";
    }
    return _mainUrl;
}

#pragma mark - 图片相关
/** 图片地址*/
- (NSString *)carImageUrl
{
    if (_carImageUrl == nil) {
        _carImageUrl = [NSString stringWithFormat:@"%@/upload/user/card/%@",[self mainUrl],self.account.user_id];
    }
    return _carImageUrl;
}

/** 上传头像地址*/
- (NSString *)portraitUrl
{
    if (_portraitUrl == nil) {
        _portraitUrl = [NSString stringWithFormat:@"%@/upload/user/portrait/%@",[self mainUrl],self.account.user_id];
    }
    return _portraitUrl;
}

/** 心情图片地址*/
- (NSString *)feelingPhotosUrl
{
    if (_feelingPhotosUrl == nil) {
        _feelingPhotosUrl = [NSString stringWithFormat:@"%@upload/wall/imgs",self.mainUrl];
    }
    return _feelingPhotosUrl;
}

#pragma mark - 用户相关
/** 登录接口*/
- (NSString *)lauchToServer
{
    if (_lauchToServer == nil) {
        _lauchToServer = [NSString stringWithFormat:@"%@/rest/login",self.mainUrl];
    }
    return _lauchToServer;
}

/** 修改密码*/
- (NSString *)modifyPassword
{
    if (_modifyPassword == nil) {
        _modifyPassword = [NSString stringWithFormat:@"%@/api/find_password",self.mainUrl];
    }
    return _modifyPassword;
}

/** 注册*/
- (NSString *)Register
{
    if (_Register == nil) {
        _Register = [NSString stringWithFormat:@"%@/rest/register",self.mainUrl];
    }
    return _Register;
}

/** 获取用户详细资料*/
- (NSString *)getUserDetailInfo
{
    if (_getUserDetailInfo == nil) {
        _getUserDetailInfo = [NSString stringWithFormat:@"%@/rest/users/id/%@",self.mainUrl,self.account.user_id];
    }
    return _getUserDetailInfo;
}

/** 通过user_name获取用户详细资料*/
- (NSString *)getUserDetailInfoByUserName
{
    if (_getUserDetailInfoByUserName == nil) {
        _getUserDetailInfoByUserName = [NSString stringWithFormat:@"%@/rest/users/",self.mainUrl];
    }
    return _getUserDetailInfoByUserName;
}

/** 修改个人资料*/
- (NSString *)putModifyProfile
{
    if (_putModifyProfile == nil) {
        _putModifyProfile = [NSString stringWithFormat:@"%@/rest/users",self.mainUrl];
    }
    return _putModifyProfile;
}

- (NSString *)putListenerInfo
{
    if (_putListenerInfo == nil) {
        _putListenerInfo = [NSString stringWithFormat:@"%@/api/listeners",self.mainUrl];
    }
    return _putListenerInfo;
}

#pragma mark - 聆听者相关
/** 获取聆听者列表的接口*/
- (NSString *)getListenerList
{
    if (_getListenerList == nil) {
        _getListenerList = [NSString stringWithFormat:@"%@/rest/listeners/%@",self.mainUrl,self.account.user_id];
    }
    return _getListenerList;
}

/** 获取在线聆听者列表的接口*/
- (NSString *)getListenerListOnline
{
    if (_getListenerListOnline == nil) {
        _getListenerListOnline = [NSString stringWithFormat:@"%@/rest/listeners/online/%@",self.mainUrl,self.account.user_id];
    }
    return _getListenerListOnline;
}

/** 获取某个聆听者的资料*/
- (NSString *)getListenerInfo
{
    if (_getListenerInfo == nil) {
        _getListenerInfo = [NSString stringWithFormat:@"%@/rest/listeners?user_id=%@",self.mainUrl,self.account.user_id];
    }
    return _getListenerInfo;
}

/** 通过user_name获取某个聆听者的资料*/
- (NSString *)getListenerInfoByUserName
{
    if (_getListenerInfoByUserName == nil) {
        _getListenerInfoByUserName = [NSString stringWithFormat:@"%@/rest/listeners/%@",self.mainUrl,self.userName];
    }
    return _getListenerInfoByUserName;
}

/** 通过user_name和自己的user_id获取某个聆听者的资料*/
- (NSString *)getListenerInfoByUserNameWithUserId
{
    if (_getListenerInfoByUserNameWithUserId == nil) {
        _getListenerInfoByUserNameWithUserId = [NSString stringWithFormat:@"%@/rest/listeners/%@",self.mainUrl,self.account.user_id];
    }
    return _getListenerInfoByUserNameWithUserId;
}



-(NSString*)listenerSearch
{
    if(_listenerSearch==nil)
    {
        _listenerSearch=[NSString stringWithFormat:@"%@/api/listeners/query",self.mainUrl];
    }
    return _listenerSearch;
}

-(NSString*)listenerCondition
{
    if(_listenerCondition==nil)
    {
        _listenerCondition=[NSString stringWithFormat:@"%@/api/listeners/condition",self.mainUrl];
    }
    return _listenerCondition;
}

/** 评价聆听者的接口*/
- (NSString *)postEvaluations
{
    if (_postEvaluations == nil) {
        _postEvaluations = [NSString stringWithFormat:@"%@/api/evaluations",self.mainUrl];
    }
    return _postEvaluations;
}

/** 获取聆听者所有评论*/
- (NSString *)getEvaluations
{
    if (_getEvaluations == nil) {
        _getEvaluations = [NSString stringWithFormat:@"%@/api/evaluations?listener_id=%@",self.mainUrl,self.listenerId];
    }
    return _getEvaluations;
}

/** 关注和点赞的接口*/
- (NSString *)putAttitudeAndAttention
{
    if (_putAttitudeAndAttention == nil) {
        _putAttitudeAndAttention = [NSString stringWithFormat:@"%@/rest/favors",self.mainUrl];
    }
    return _putAttitudeAndAttention;
}

/** 申请成为聆听者*/
- (NSString *)postApplys
{
    if (_postApplys == nil) {
        _postApplys = [NSString stringWithFormat:@"%@/rest/applys",self.mainUrl];
    }
    return _postApplys;
}
#pragma mark - 群组相关
/** 获取群列表的口*/
- (NSString*)getGroupsList
{
    if(_getGroupsList == nil)
    {
        _getGroupsList = [NSString stringWithFormat:@"%@/rest/groups",self.mainUrl];
    }
    return _getGroupsList;
}

#pragma mark - 发现相关
/** 获取发现列表接口*/
-(NSString*)getInfosList
{
    if(_getInfosList == nil)
    {
        _getInfosList = [NSString stringWithFormat:@"%@/api/infos",self.mainUrl];
    }
    return _getInfosList;
}
/** 获取单个文章接口*/
-(NSString*)getInfoOne
{
    if(_getInfoOne==nil)
    {
        _getInfoOne= [NSString stringWithFormat:@"%@/api/infos",self.mainUrl];
    }
    return _getInfoOne;
}

-(NSString*)getArticleURLWithInfoID:(NSString *)info_id
{
    NSString* string=[NSString stringWithFormat:@"%@/infos/info?info_id=%@",self.mainUrl,info_id];
    return string;
}

#pragma mark - 心墙相关
/** 发表心情*/
- (NSString *)postFeeling
{
    if (_postFeeling == nil) {
        _postFeeling = [NSString stringWithFormat:@"%@/api/walls",self.mainUrl];
    }
    return _postFeeling;
}

/** 删除心情*/
- (NSString *)deleteFeeling
{
    if (_deleteFeeling == nil) {
        _deleteFeeling = [NSString stringWithFormat:@"%@/rest/walls/%@",self.mainUrl,self.feelingId];
    }
    return _deleteFeeling;
}

/** 获取心墙上的心情*/
- (NSString *)getHeartWallFeeling
{
    if (_getHeartWallFeeling == nil) {
        _getHeartWallFeeling = [NSString stringWithFormat:@"%@/api/walls/%@",self.mainUrl,self.account.user_id];
    }
    return _getHeartWallFeeling;
}

/** 对心情点赞*/
- (NSString *)putFeelingFavors
{
    if (_putFeelingFavors == nil) {
        _putFeelingFavors = [NSString stringWithFormat:@"%@/rest/walls/favors",self.mainUrl];
    }
    return _putFeelingFavors;
}

/** 对心情进行评论*/
- (NSString *)postFeelingComment
{
    if (_postFeelingComment == nil) {
        _postFeelingComment = [NSString stringWithFormat:@"%@/rest/walls/comments",self.mainUrl];
    }
    return _postFeelingComment;
}

/** 删除心情的某一条评论*/
- (NSString *)deleteFeelingComment
{
    if (_deleteFeelingComment == nil) {
        _deleteFeelingComment = [NSString stringWithFormat:@"%@/rest/walls/comments/%@",self.mainUrl,self.commentId];
    }
    return _deleteFeelingComment;
}

/** 查询心情的评论*/
- (NSString *)getFeelingComment
{
    if (_getFeelingComment == nil) {
        _getFeelingComment = [NSString stringWithFormat:@"%@/rest/walls/comments/%@",self.mainUrl,self.feelingId];
    }
    return _getFeelingComment;
}

#pragma mark - 个人中心

/** 查询我的心墙*/
- (NSString *)getMyFeelings
{
    if (_getMyFeelings == nil) {
        _getMyFeelings = [NSString stringWithFormat:@"%@/rest/walls",self.mainUrl];
    }
    return _getMyFeelings;
}

/** 查询我的关注*/
- (NSString *)getMyAttention
{
    if (_getMyAttention == nil) {
        _getMyAttention = [NSString stringWithFormat:@"%@/api/listenerDetails/attention/%@"
                           //api/listeners/attention/%@"
                           ,
                           self.mainUrl,self.account.user_id];
    }
    return _getMyAttention;
}

/** 查询赞过我的*/
- (NSString *)getAttitudeToMe
{
    if (_getAttitudeToMe == nil) {
        _getAttitudeToMe = [NSString stringWithFormat:@"%@/rest/personal/listeners/attitudes_users/%@",self.mainUrl,self.listenerId];
    }
    return _getAttitudeToMe;
}

/** 查询关注我的*/
- (NSString *)getAttentionMe
{
    if (_getAttentionMe == nil) {
        _getAttentionMe = [NSString stringWithFormat:@"%@/rest/personal/listeners/attention_users/%@",self.mainUrl,self.listenerId];
    }
    return _getAttentionMe;
}

/** 我的圈子*/
- (NSString *)getMyGroups
{
    if (_getMyGroups == nil) {
        _getMyGroups = [NSString stringWithFormat:@"%@/rest/personal/groups",self.mainUrl];
    }
    return _getMyGroups;
}
- (NSString *)feedback{
    if (_feedback == nil) {
        _feedback = [NSString stringWithFormat:@"%@/api/feedback",self.mainUrl];
    }
    return _feedback;
}
#pragma mark - 消息相关
- (NSString *)startTime{
    if (_startTime == nil) {
        _startTime = [NSString stringWithFormat:@"%@/web/listener/listener_session/start",self.mainUrl];
    }
    return _startTime;
}

- (NSString *)endTime{
    if (_endTime == nil) {
        _endTime = [NSString stringWithFormat:@"%@/web/listener/listener_session/end",self.mainUrl];
    }
    return _endTime;
}

/** 轮询查询未读消息*/
- (NSString *)getRunLoopUnreadMsg
{
    if (_getRunLoopUnreadMsg == nil) {
        _getRunLoopUnreadMsg = [NSString stringWithFormat:@"%@/api/notices/%@",self.mainUrl,self.account.user_id];
    }
    return _getRunLoopUnreadMsg;
}

/** 查询我的心墙消息*/
- (NSString *)getFeelingMessages
{
    if (_getFeelingMessages == nil) {
        _getFeelingMessages = [NSString stringWithFormat:@"%@/api/walls/comments/notices/%@",self.mainUrl,self.account.user_id];
    }
    return _getFeelingMessages;
}

/** 查询我的文章消息*/
- (NSString *)getArticleMessages
{
    if (_getArticleMessages == nil) {
        _getArticleMessages = [NSString stringWithFormat:@"%@/api/notices/info/replycomment/%@",self.mainUrl,self.account.user_id];
    }
    return _getArticleMessages;
}

/** 查询新的官方公告*/
- (NSString *)getAnnoucementMessages
{
    if (_getAnnoucementMessages == nil) {
        _getAnnoucementMessages = [NSString stringWithFormat:@"%@/api/notices/announcements/%@",self.mainUrl,self.account.user_id];
    }
    return _getAnnoucementMessages;
}

/** 查询申请进度通知*/
- (NSString *)getApplyProccessMessages
{
    if (_getApplyProccessMessages == nil) {
        _getApplyProccessMessages = [NSString stringWithFormat:@"%@/api/notices/listener_apply/%@",self.mainUrl,self.account.user_id];
    }
    return _getApplyProccessMessages;
}
/** 查询预约通知*/
- (NSString *)getAppointmentMessages
{
    if (_getAppointmentMessages == nil) {
        _getAppointmentMessages = [NSString stringWithFormat:@"%@/api/notices/15/%@",self.mainUrl,self.account.user_id];
    }
    return _getAppointmentMessages;
}

#pragma mark - 预约模块

/** 提交预约*/
- (NSString *)postAppointment{
    if (_postAppointment == nil) {
        _postAppointment = [NSString stringWithFormat:@"%@/api/appointment",self.mainUrl];
    }
    return _postAppointment;
}

/** 更新预约状态*/
- (NSString *)putAppointment{
    if (_putAppointment == nil) {
        _putAppointment =[NSString stringWithFormat:@"%@/api/appointment",self.mainUrl];
    }
    return _putAppointment;
}

/** 查询预约时间*/
- (NSString *)getAppointmentDate{
    if (_getAppointmentDate == nil) {
        _getAppointmentDate = [NSString stringWithFormat:@"%@/api/service_periods?listener_id=%@",self.mainUrl,self.userId];
    }
    return _getAppointmentDate;
}

/** 查询预约的订单*/
- (NSString *)getAppointments{
    if (_getAppointments == nil) {
        _getAppointments = [NSString stringWithFormat:@"%@/api/appointments/page",self.mainUrl];
    }
    return _getAppointments;
}
@end
