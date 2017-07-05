//
//  WBLeftView.h
//  橙子
//
//  Created by iMac206 on 15/11/10.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBPfofileController.h"
#import "WBMyDetailController.h"
#import "WBMyListenController.h"
#import "WBMyAttentionController.h"
#import "WBMyCollectionController.h"
#import "WBMyCommunityController.h"
#import "WBMyHeartWallController.h"
#import "WBSettingController.h"
#import "listenerAgreement.h"
#import "myOppointmentController.h"
#import "WBComAccountController.h"
#import "WBLisAccountController.h"

#import "WBSimpleProfileView.h"
#import "WBSimpleProfileViewFrame.h"
#import "statesSwitchView.h"
#import "WBUserService.h"

#define rate 0.9
#define menuW 256*rate
#define menuH 568*rate

typedef enum {
    leftMenuButtonTypeUserInfo,
    leftMenuButtonTypeMyListener,
    leftMenuButtonTypeLisCharity,
    leftMenuButtonTypeComCharity,
    leftMenuButtonTypeApply,
    leftMenuButtonTypeCommunity,
    leftMenuButtonTypeHeartWall,
    leftMenuButtonTypeCollection,
    leftMenuButtonTypeAttention,
    leftMenuButtonTypeSetting,
    leftMenuButtonTypeAppointment
}
leftMenuButtonType;

@class WBLeftView;

@protocol WBLeftViewDelegate <NSObject>

@required

/** 点击菜单按钮的回调*/
- (void)WBLeftView:(WBLeftView *)leftMenu clickedButton:(leftMenuButtonType)buttonTye;

@end
@interface WBLeftView : UIView

+ (instancetype)menu;

/** 代理*/
@property (nonatomic, weak) id<WBLeftViewDelegate> delegate;

@end
