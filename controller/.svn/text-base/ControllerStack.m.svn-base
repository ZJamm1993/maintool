//
//  ControllerStack.m
//  风聆
//
//  Created by iMac206 on 17/3/7.
//  Copyright © 2017年 风聆小镇工作室. All rights reserved.
//

#import "ControllerStack.h"
#import "HNTabbarController.h"
#import "HNNavigationController.h"
#import "listenerController.h"
#import "conversationController.h"
#import "heartWallController.h"
#import "discoverController.h"
#import "MyController.h"

static ControllerStack* controStack;

@interface ControllerStack()

@property (nonatomic,assign) NSInteger selectedTabbarItem;
@property (nonatomic,strong) Class bottomControllerClass;
@property (nonatomic,strong) UIViewController* topController;

@end

@implementation ControllerStack

+(instancetype)sharedControllerStack
{
    if (controStack==nil) {
        controStack=[[ControllerStack alloc]init];
    }
    return controStack;
}

-(void)saveCurrentControllerStack
{
//    return;
    self.selectedTabbarItem=0;
    self.bottomControllerClass=nil;
    self.topController=nil;
    HNTabbarController* tab=(HNTabbarController*)[UIApplication sharedApplication].keyWindow.rootViewController;
    if ([tab isKindOfClass:[HNTabbarController class]]) {
        self.selectedTabbarItem=tab.selectedIndex;
        HNNavigationController* nav=(HNNavigationController*)tab.selectedViewController;
        if ([nav isKindOfClass:[HNNavigationController class]]) {
            NSArray* controllers=nav.viewControllers;
            NSInteger count=controllers.count;
            if (count>=1) {
                self.bottomControllerClass=[controllers.firstObject class];
            }
            if (count>=2) {
                self.topController=controllers.lastObject;
            }
            [nav popToRootViewControllerAnimated:NO];
            
        }
    }
}

-(void)restoreHistoryControllerStack
{
//    return;
    HNTabbarController* tab=(HNTabbarController*)[UIApplication sharedApplication].keyWindow.rootViewController;
    if ([tab isKindOfClass:[HNTabbarController class]]) {
        tab.selectedIndex=self.selectedTabbarItem;
        HNNavigationController* nav=(HNNavigationController*)tab.selectedViewController;
        if ([nav isKindOfClass:[HNNavigationController class]]) {
            NSArray* controllers=nav.viewControllers;
            if (self.bottomControllerClass!=nil) {
                if (![controllers.firstObject isKindOfClass:self.bottomControllerClass]) {
                    [tab discorverSwitchController];
                }
            }
        }
        nav=(HNNavigationController*)tab.selectedViewController;
        if ([nav isKindOfClass:[HNNavigationController class]]) {
            if (self.topController!=nil) {
                [nav pushViewController:self.topController animated:NO];
            }
        }
    }
    self.selectedTabbarItem=0;
    self.topController=nil;
    self.bottomControllerClass=nil;
}

@end
