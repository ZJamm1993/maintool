//
//  God.h
//  singleTest
//
//  Created by Macbook Air on 16/2/24.
//  Copyright © 2016年 iMac206. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YDaccount.h"
#import "YDAccountTool.h"
#import "WBListenerModel.h"

@interface God : NSObject

/** the single God initialized method*/
/** God 单例*/
+ (instancetype)manager;
/** 当前登录用户的信息*/
@property(nonatomic, strong) YDaccount *thisGuy;
/** 聆听者资料，如果是聆听者则有值*/
@property(nonatomic, strong) WBListenerModel *listener;
/** 在线状态*/
@property (nonatomic, strong) NSNumber *user_state;
/** 用户帐号*/
@property (nonatomic, strong) NSString *user_name;
/** 用户ID*/
@property (nonatomic, strong) NSString *user_id;
/** 密码*/
@property (nonatomic, strong) NSString *password;
/** 昵称*/
@property (nonatomic, strong) NSString *nick_name;
/** 头像url*/
@property (nonatomic, strong) NSString *portrait_url;
/** 卡片url*/
@property (nonatomic, strong) NSString *card_url;
/** 个人简介*/
@property (nonatomic, strong) NSString *introduce;
/** 个性签名*/
@property (nonatomic, strong) NSString *signature;
/** sessionid*/
@property (nonatomic, strong) NSString *sessionID;
/** 身份*/
@property (nonatomic, strong) NSString *character;
/** 真实姓名*/
@property (nonatomic, strong) NSString *true_name;
/** 地址*/
@property (nonatomic, strong) NSString *address;
/** 手机*/
@property (nonatomic, strong) NSString *tel_phone;
/** 学校*/
@property (nonatomic, strong) NSString *school;
/** 年级*/
@property (nonatomic, strong) NSString *grade;
/** 性别*/
@property (nonatomic, strong) NSString *sex;
/** 邮箱*/
@property (nonatomic, strong) NSString *email;
/** 专业*/
@property (nonatomic, strong) NSString *faculty;

/** 是否登录*/
@property (nonatomic, assign) BOOL isLogIn;

/** 从服务器获取thisGuy的最新信息，并更新到数据库*/
- (void)updateThisGuyToDatabase;

@end
