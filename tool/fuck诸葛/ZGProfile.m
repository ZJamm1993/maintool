//
//  ZGProfile.m
//  风聆
//
//  Created by HIChen on 16/7/7.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import "ZGProfile.h"

@implementation ZGProfile
/** 聆听者尝试切换在线状态*/
- (void)tryChangeOnlineState{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"聆听者尝试切换在线状态" properties:params];
}

/** 聆听者成功切换在线状态*/
- (void)successedChangeOnlineState{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"聆听者成功切换在线状态" properties:params];
}


#pragma mark - 个人信息
/** 进入个人详细信息*/
- (void)enterProfile{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"进入个人详细信息" properties:params];
}

/** 退出个人信息页面*/
- (void)outProfile{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"退出个人信息页面" properties:params];
}

/** 尝试更换头像*/
- (void)tryChangeAvatar{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试更换头像" properties:params];
}

/** 成功更换头像*/
- (void)successedChangeAvatar{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功更换头像" properties:params];
}

/** 尝试更换卡片*/
- (void)tryChangeCard{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试更换卡片" properties:params];
}

/** 成功更换卡片*/
- (void)successedChangeCard{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功更换卡片" properties:params];
}

/** 查看关注我的*/
- (void)checkAttentionME{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"查看关注我的" properties:params];
}

/** 查看赞过我的*/
- (void)checkAttituteME{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"查看赞过我的" properties:params];
}

/** 查看我的简介*/
- (void)checkMINE{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"查看我的简介" properties:params];
}

/** 查看评价我的*/
- (void)checkEvaluationME{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"查看评价我的" properties:params];
}

/** 进入编辑我的信息*/
- (void)enterEditProfile{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"进入编辑我的信息" properties:params];
}

/** 成功编辑我的信息*/
- (void)successedEditProfile{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功编辑我的信息" properties:params];
}

/** 退出编辑我的信息*/
- (void)outEditProfile{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"退出编辑我的信息" properties:params];
}
/** 尝试刷新我的信息*/
- (void)tryRefreshProfile{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试刷新我的信息" properties:params];
}

#pragma mark - 申请为聆听者
/** 进入查看如何申请成为聆听者*/
- (void)enterApply{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"进入查看如何申请成为聆听者" properties:params];
}

/** 尝试提交申请成为聆听者*/
- (void)tryApply{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试提交申请成为聆听者" properties:params];
}

/** 放弃提交申请*/
- (void)cancelApply{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"放弃提交申请" properties:params];
}

/** 成功提交申请*/
- (void)successedApply{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功提交申请" properties:params];
}

#pragma mark - 风聆账户

/** 企业进入风聆账户*/
- (void)enterComCharityAccount{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"企业进入风聆账户" properties:params];
}

/** 查看捐赠说明*/
- (void)checkDonationDescription{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"查看捐赠说明" properties:params];
}

/** 企业查看分享界面*/
- (void)checkComShare{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"企业查看分享界面" properties:params];
}

/** 企业尝试分享总数据*/
- (void)tryComShare{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"企业尝试分享总数据" properties:params];
}
/** 企业查看捐赠明细*/
- (void)checkComDonateDetail{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"企业查看捐赠明细" properties:params];
}

/** 企业查看支出明细*/
- (void)checkComPayDetail{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"企业查看支出明细" properties:params];
}

/** 企业查看机构列表*/
- (void)checkComOrgs{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"企业查看机构列表" properties:params];
}

/** 企业查看服务明细*/
- (void)checkComServerDetail{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"企业查看服务明细" properties:params];
}

/** 聆听者进入风聆账户*/
- (void)enterLisCharityAccount{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"聆听者进入风聆账户" properties:params];
}

/** 聆听者查看补贴发放说明*/
- (void)checkLisGrantDescription{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"聆听者查看补贴发放说明" properties:params];
}

/** 聆听者尝试分享服务总数据*/
- (void)tryLisShareTotal{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"聆听者尝试分享服务总数据" properties:params];
}

/** 聆听者尝试分析某次聆听服务*/
- (void)tryLisShareSigle{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"聆听者尝试分析某次聆听服务" properties:params];
}

/** 聆听者查看补贴明细*/
- (void)checkLisSubsidyDescription{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"聆听者查看补贴明细" properties:params];
}

/** 聆听者查看服务明细*/
- (void)checkLisServerDetail{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"聆听者查看服务明细" properties:params];
}

/** 聆听者查看发放记录*/
- (void)checkLisGrant{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"聆听者查看发放记录" properties:params];
}

/** 聆听者查看发放记录明细*/
- (void)checkLisGrantDetail{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"聆听者查看发放记录明细" properties:params];
}


#pragma mark - 关注的聆听者
/** 查看关注的聆听者*/
- (void)enterMyAttention{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"查看关注的聆听者" properties:params];
}
/** 取消关注聆听者*/
- (void)tryDisAttention{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"取消关注聆听者" properties:params];
}

/** 尝试关注的聆听者会话*/
- (void)tryChatWithListener{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试关注的聆听者会话" properties:params];
}
/** 尝试刷新我的关注*/
- (void)tryRefreshMyAttention{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试刷新我的关注" properties:params];
}
/** 尝试加载更多我的关注*/
- (void)tryLoadMoreMyAttention{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试加载更多我的关注" properties:params];
}



#pragma mark - 收藏的文章
/** 进入我收藏的文章或活动*/
- (void)enterMyCollection{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"进入我收藏的文章或活动" properties:params];
}

/** 查看我收藏的文章或活动*/
- (void)checkMyCollection{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"查看我收藏的文章或活动" properties:params];
}

/** 尝试取消收藏的文章或活动*/
- (void)tryUnCollection{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试取消收藏的文章或活动" properties:params];
}

/** 成功取消收藏的文章或活动*/
- (void)successedUnCollection{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功取消收藏的文章或活动" properties:params];
}
/** 尝试刷新我的收藏*/
- (void)tryRefreshMyCollection{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试刷新我的收藏" properties:params];
}
/** 尝试加载更多我的收藏*/
- (void)tryLoadMoreMyCollection{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试加载更多我的收藏" properties:params];
}

#pragma mark - 发表的心情
/** 进入我发表的心情*/
- (void)enterMyFeelings{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"进入我发表的心情" properties:params];
}

/** 查看我的心情*/
- (void)checkMyFeeling{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"查看我的心情" properties:params];
}
/** 尝试刷新我的心墙*/
- (void)tryRefreshMyFeelings{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试刷新我的心墙" properties:params];
}
/** 尝试加载更多我的心墙*/
- (void)tryLoadMoreMyFeeling{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试加载更多我的心墙" properties:params];
}



#pragma mark - 预约相关
/** 查看预约*/
- (void)enterMyAppointment{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"查看预约" properties:params];
}

/** 查看预约我的*/
- (void)checkMyAppointment{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"查看预约我的" properties:params];
}

/** 查看我预约的*/
- (void)checkAppointmentMe{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"查看我预约的" properties:params];
}

/** 聆听者尝试设置可被预约时间*/
- (void)trySetEnableAppointmentDate{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"聆听者尝试设置可被预约时间" properties:params];
}

/** 聆听者成功设置可被预约时间*/
- (void)successedSetEnableAppointmentDate{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"聆听者成功设置可被预约时间" properties:params];
}

/** 查看预约详情*/
- (void)checkAppointmentDetail{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"查看预约详情" properties:params];
}

/** 退出预约详情*/
- (void)outAppointmentDetail{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"退出预约详情" properties:params];
}

/** 聆听者拒绝预约*/
- (void)rejectAppointment{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"聆听者拒绝预约" properties:params];
}

/** 聆听者接受预约*/
- (void)acceptAppiontment{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"聆听者接受预约" properties:params];
}

/** 用户取消预约*/
- (void)cancelAppointment{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"用户取消预约" properties:params];
}
/** 尝试刷新预约订单*/
- (void)tryRefreshAppointments{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试刷新预约订单" properties:params];
}


#pragma mark - 设置中心
/** 查看设置中心*/
- (void)enterSetting{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"查看设置中心" properties:params];
}

/** 尝试修改密码*/
- (void)tryChangePassword{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试修改密码" properties:params];
}

/** 成功修改密码*/
- (void)successedChangePassword{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功修改密码" properties:params];
}

/** 修改密码失败*/
- (void)failureChangePassword{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"修改密码失败" properties:params];
}

/** 放弃修改密码*/
- (void)cancelChangePassword{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"放弃修改密码" properties:params];
}

/** 尝试修改消息提醒方式*/
- (void)tryChangeTips{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试修改消息提醒方式" properties:params];
}

/** 成功修改消息提醒方式*/
- (void)successedChangeTips{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功修改消息提醒方式" properties:params];
}

/** 放弃修改消息提醒方式*/
- (void)cancelChangeTips{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"放弃修改消息提醒方式" properties:params];
}

/** 尝试清除缓存*/
- (void)tryCleanCache{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试清除缓存" properties:params];
}

/** 成功清除缓存*/
- (void)successedCleanCache{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功清除缓存" properties:params];
}

/** 去AppStore评分*/
- (void)goAppStoreForEvaluate{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"去AppStore评分" properties:params];
}

/** 尝试分享风聆App*/
- (void)tryShareApp{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试分享风聆App" properties:params];
}

/** 成功分享风聆App*/
- (void)successedShareApp{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功分享风聆App" properties:params];
}

/** 放弃分享风聆App*/
- (void)cancelShareApp{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"放弃分享风聆App" properties:params];
}

/** 尝试提交App意见反馈*/
- (void)tryFeedback{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试提交App意见反馈" properties:params];
}

/** 成功提交App意见反馈*/
- (void)successedFeedback{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功提交App意见反馈" properties:params];
}

/** 查看关于风聆*/
- (void)checkAboutApp{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"查看关于风聆" properties:params];
}
/** 查看功能介绍*/
- (void)checkAppFuntion{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"查看功能介绍" properties:params];
}

/** 查看用户协议*/
- (void)checkUserProtocol{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"查看用户协议" properties:params];
}

/** 尝试退出App*/
- (void)tryLogoutApp{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"尝试退出App" properties:params];
}
/** 放弃退出App*/
- (void)cancelLogoutApp{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"放弃退出App" properties:params];
}

/** 成功退出App*/
- (void)successedLogoutApp{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_PROFILE forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"成功退出App" properties:params];
}

@end
