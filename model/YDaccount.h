//
//  YDaccount.h
//  橙子
//
//  Created by Macbook Air on 15/8/29.
//  Copyright (c) 2015年 Macbook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YDaccount : NSObject<NSCoding>


/** 真实姓名*/
@property (nonatomic ,copy) NSString *true_name;

/** 地址*/
@property (nonatomic ,copy) NSString *address;

/** 手机*/
@property (nonatomic ,copy) NSString *tel_phone;

/** 学校*/
@property (nonatomic ,copy) NSString *school;

/** 年级*/
@property (nonatomic ,copy) NSString *grade;

/** 性别*/
@property (nonatomic ,copy) NSString *sex;

/** 邮箱*/
@property (nonatomic ,copy) NSString *email;

/** 专业*/ // 以前一开始是表示机构的。。
@property (nonatomic ,copy) NSString *faculty;


/** 在线状态*/
@property (nonatomic, strong) NSNumber *user_state;

/** string 用户帐号*/
@property (nonatomic,copy)NSString *user_name;

/** string 用户ID*/
@property (nonatomic,copy)NSString *user_id;

/** string 用户密码*/
@property (nonatomic,copy)NSString *password;

/** string 用户昵称*/
@property (nonatomic,copy)NSString *nick_name;

/** string 用户头像url*/
@property (nonatomic,copy)NSString *portrait_url;

/** string 用户卡片url*/
@property (nonatomic,copy)NSString *card_url;

/** string 用户个人简介*/
@property (nonatomic,copy)NSString *introduce;

/** string 用户个性签名*/
@property (nonatomic,copy)NSString *signature;

/** string 用户sessionid*/
@property (nonatomic,copy)NSString *sessionID;

/** 身份*/
@property (nonatomic, strong) NSString *character;

@property (nonatomic, strong) NSNumber* isLogIn;

// 判断是否为访客
@property (nonatomic,readonly,assign) BOOL guest;

///** 注释*/
//@property (nonatomic)NSNumber* soundEnabled;
//@property (nonatomic)NSNumber* vibrateEnabled;


+ (instancetype)accountWithDict:(NSDictionary *)dict;
@end
