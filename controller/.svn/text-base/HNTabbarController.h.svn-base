//
//  HNTabbarController.h
//  橙子
//
//  Created by Macbook Air on 15/8/18.
//  Copyright (c) 2015年 Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mainController.h"
#import "communityController.h"
#import "listenerController.h"
#import "conversationController.h"
#import "heartWallController.h"
#import "discoverController.h"
#import "MyController.h"

@interface HNTabbarController : UITabBarController

@property (nonatomic, strong) listenerController        *listener;
@property (nonatomic, strong) communityController       *community;
@property (nonatomic, strong) heartWallController       *heartWall;
@property (nonatomic, strong) discoverController        *discover;
@property (nonatomic,strong) MyController *meController;
@property (nonatomic, strong) conversationController    *conversationController;

/** 首页聊聊控制器*/
@property (nonatomic, strong) UINavigationController *navHome;
/** 消息模块控制器*/
@property (nonatomic, strong) UINavigationController *navConversation;
/** 心墙模块控制器*/
//@property (nonatomic, strong) UINavigationController *navFeelings;
/** 发现模块控制器*/
@property (nonatomic, strong) UINavigationController *navDiscover;

@property (nonatomic,strong) UINavigationController *navMe;

-(void)discorverSwitchController;
@end
