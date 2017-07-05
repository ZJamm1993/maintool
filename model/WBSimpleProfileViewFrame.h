//
//  WBSimpleProfileViewFrame.h
//  橙子
//
//  Created by iMac206 on 15/11/9.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

#define WIDTH_LEFT 258*rate_screen_width
@class YDaccount;

@interface WBSimpleProfileViewFrame : NSObject

/** 用户资料*/
@property (nonatomic, strong) YDaccount *account;

/** 自己的frame*/
@property (nonatomic, assign) CGRect frame;

/** 顶部容器的frame*/
@property (nonatomic, assign) CGRect topViewFrame;

/** 头像的frame*/
@property (nonatomic, assign) CGRect headIconFrame;

/** 名字的frame*/
@property (nonatomic, assign) CGRect nickNameFrame;

/** state*/
@property (nonatomic, assign) CGRect stateFrame;

/** 身份的frame*/
@property (nonatomic, assign) CGRect characterFrame;

/** 签名的frame*/
@property (nonatomic, assign) CGRect signtureFrame;

/** 底部容器的frame*/
@property (nonatomic, assign) CGRect bottomViewFrame;
@end
