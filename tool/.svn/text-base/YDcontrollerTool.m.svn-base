//
//  YDcontrollerTool.m
//  橙子
//
//  Created by Macbook Air on 15/8/29.
//  Copyright (c) 2015年 Macbook Air. All rights reserved.
//

#import "YDcontrollerTool.h"
#import "YDaccount.h"
#import "YDAccountTool.h"
#import "launchController.h"
#import "mainController.h"
#import "HNNavigationController.h"
#import "login2Controller.h"

typedef enum {
    loginResultFail = 0,
    loginResultSuccess,
}loginResult;

@implementation YDcontrollerTool
+ (void)chooseRootViewController
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
//    YDaccount* accou=[YDAccountTool account];
//    BOOL brandNew=accou.sessionID.length==0;
//    BOOL logedIn=accou.isLogIn.boolValue;
//    if (brandNew||logedIn)
//    {
        mainController *main = [[mainController alloc] init];
        main.alreadyLaunch = alreadyLaunch_YES;
        window.rootViewController = main;
//    }
//    else
//    {
//        login2Controller *VC = [[login2Controller alloc] init];
//        window.rootViewController = VC;
//    }
}

@end

