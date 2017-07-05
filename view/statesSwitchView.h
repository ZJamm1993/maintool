//
//  statesSwitchView.h
//  风聆
//
//  Created by Macbook Air on 16/3/30.
//  Copyright © 2016年 Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    userStateTypeOnline = 1001,
    userStateTypeOutline,
    userStateTypeBusy
}userStateType;

@interface statesSwitchView : UIView

/** 点击按钮的block回调*/
@property (nonatomic, strong) void(^switchButtonBlock)(UIButton *button);
@end
