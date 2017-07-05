//
//  ZGProfile.h
//  风聆
//
//  Created by HIChen on 16/7/7.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

/** 负责记录个人中心模块事件的工具类*/
#import <Foundation/Foundation.h>
#import "Zhuge.h"

#define ID_PROFILE @"个人中心模块"
@interface ZGProfile : NSObject

/** 聆听者尝试切换在线状态*/
- (void)tryChangeOnlineState;
/** 聆听者成功切换在线状态*/
- (void)successedChangeOnlineState;

#pragma mark - 个人信息
/** 进入个人详细信息*/
- (void)enterProfile;
/** 退出个人信息页面*/
- (void)outProfile;
/** 尝试更换头像*/
- (void)tryChangeAvatar;
/** 成功更换头像*/
- (void)successedChangeAvatar;
/** 尝试更换卡片*/
- (void)tryChangeCard;
/** 成功更换卡片*/
- (void)successedChangeCard;
/** 查看关注我的*/
- (void)checkAttentionME;
/** 查看赞过我的*/
- (void)checkAttituteME;
/** 查看我的简介*/
- (void)checkMINE;
/** 查看评价我的*/
- (void)checkEvaluationME;
/** 进入编辑我的信息*/
- (void)enterEditProfile;
/** 成功编辑我的信息*/
- (void)successedEditProfile;
/** 退出编辑我的信息*/
- (void)outEditProfile;
/** 尝试刷新我的信息*/
- (void)tryRefreshProfile;

#pragma mark - 申请为聆听者
/** 进入查看如何申请成为聆听者*/
- (void)enterApply;
/** 尝试提交申请成为聆听者*/
- (void)tryApply;
/** 放弃提交申请*/
- (void)cancelApply;
/** 成功提交申请*/
- (void)successedApply;
#pragma mark - 风聆账户

/** 企业进入风聆账户*/
- (void)enterComCharityAccount;
/** 查看捐赠说明*/
- (void)checkDonationDescription;
/** 企业查看分享界面*/
- (void)checkComShare;
/** 企业尝试分享总数据*/
- (void)tryComShare;
/** 企业查看捐赠明细*/
- (void)checkComDonateDetail;
/** 企业查看支出明细*/
- (void)checkComPayDetail;
/** 企业查看机构列表*/
- (void)checkComOrgs;
/** 企业查看服务明细*/
- (void)checkComServerDetail;

/** 聆听者进入风聆账户*/
- (void)enterLisCharityAccount;
/** 聆听者查看补贴发放说明*/
- (void)checkLisGrantDescription;
/** 聆听者尝试分享服务总数据*/
- (void)tryLisShareTotal;
/** 聆听者尝试分析某次聆听服务*/
- (void)tryLisShareSigle;
/** 查看补贴明细*/
- (void)checkLisSubsidyDescription;
/** 聆听者查看服务明细*/
- (void)checkLisServerDetail;
/** 聆听者查看发放记录*/
- (void)checkLisGrant;
/** 聆听者查看发放记录明细*/
- (void)checkLisGrantDetail;

#pragma mark - 关注的聆听者
/** 查看关注的聆听者*/
- (void)enterMyAttention;
/** 取消关注聆听者*/
- (void)tryDisAttention;
/** 尝试关注的聆听者会话*/
- (void)tryChatWithListener;
/** 尝试刷新我的关注*/
- (void)tryRefreshMyAttention;
/** 尝试加载更多我的关注*/
- (void)tryLoadMoreMyAttention;

#pragma mark - 收藏的文章
/** 进入我收藏的文章或活动*/
- (void)enterMyCollection;
/** 查看我收藏的文章或活动*/
- (void)checkMyCollection;
/** 尝试取消收藏的文章或活动*/
- (void)tryUnCollection;
/** 成功取消收藏的文章或活动*/
- (void)successedUnCollection;
/** 尝试刷新我的收藏*/
- (void)tryRefreshMyCollection;
/** 尝试加载更多我的收藏*/
- (void)tryLoadMoreMyCollection;

#pragma mark - 发表的心情
/** 进入我发表的心情*/
- (void)enterMyFeelings;
/** 查看我的心情*/
- (void)checkMyFeeling;
/** 尝试刷新我的心墙*/
- (void)tryRefreshMyFeelings;
/** 尝试加载更多我的心墙*/
- (void)tryLoadMoreMyFeeling;


#pragma mark - 预约相关
/** 查看预约*/
- (void)enterMyAppointment;
/** 查看预约我的*/
- (void)checkMyAppointment;
/** 查看我预约的*/
- (void)checkAppointmentMe;
/** 聆听者尝试设置可被预约时间*/
- (void)trySetEnableAppointmentDate;
/** 聆听者成功设置可被预约时间*/
- (void)successedSetEnableAppointmentDate;
/** 查看预约详情*/
- (void)checkAppointmentDetail;
/** 退出预约详情*/
- (void)outAppointmentDetail;
/** 聆听者拒绝预约*/
- (void)rejectAppointment;
/** 聆听者接受预约*/
- (void)acceptAppiontment;
/** 用户取消预约*/
- (void)cancelAppointment;
/** 尝试刷新预约订单*/
- (void)tryRefreshAppointments;

#pragma mark - 设置中心
/** 查看设置中心*/
- (void)enterSetting;
/** 尝试修改密码*/
- (void)tryChangePassword;
/** 成功修改密码*/
- (void)successedChangePassword;
/** 修改密码失败*/
- (void)failureChangePassword;
/** 放弃修改密码*/
- (void)cancelChangePassword;
/** 尝试修改消息提醒方式*/
- (void)tryChangeTips;
/** 成功修改消息提醒方式*/
- (void)successedChangeTips;
/** 放弃修改消息提醒方式*/
- (void)cancelChangeTips;
/** 尝试清除缓存*/
- (void)tryCleanCache;
/** 成功清除缓存*/
- (void)successedCleanCache;
/** 去AppStore评分*/
- (void)goAppStoreForEvaluate;
/** 尝试分享风聆App*/
- (void)tryShareApp;
/** 成功分享风聆App*/
- (void)successedShareApp;
/** 放弃分享风聆App*/
- (void)cancelShareApp;
/** 尝试提交App意见反馈*/
- (void)tryFeedback;
/** 成功提交App意见反馈*/
- (void)successedFeedback;
/** 查看关于风聆*/
- (void)checkAboutApp;
/** 查看功能介绍*/
- (void)checkAppFuntion;
/** 查看用户协议*/
- (void)checkUserProtocol;
/** 尝试退出App*/
- (void)tryLogoutApp;
/** 放弃退出App*/
- (void)cancelLogoutApp;
/** 成功退出App*/
- (void)successedLogoutApp;
@end
