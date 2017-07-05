//
//  mainController.m
//  橙子
//
//  Created by Macbook Air on 15/8/26.
//  Copyright (c) 2015年 Macbook Air. All rights reserved.
//

#import "mainController.h"
#import "HNNavigationController.h"
//#import "EaseMob.h"
#import "EMSDK.h"
#import "EMCDDeviceManager.h"
#import "launchController.h"
#import "WBUserService.h"
#import "WBListenerService.h"
#import "HIChatManager.h"
#import "Zhuge.h"
#import "login2Controller.h"
#import "ControllerStack.h"

@interface mainController ()
@end

@implementation mainController
//{
////    BOOL serverSuccessed;
////    BOOL clientSuccessed;
////    UIAlertController *failureAlert;
////    UIAlertController *successAlert;
//}

//- (instancetype)init{
//    if (self = [super init]) {
//        // 注册为SDK的ChatManager的delegate
//    }
//    return self;
//}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    serverSuccessed = NO;
//    clientSuccessed = YES;
    
//    [MBProgressHUD showProgress:@"正在登录"];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor whiteColor];
//    
//    UIImageView* logo=[[UIImageView alloc]init];
//    logo.width=logo.height=160*rate_screen_width;
//    logo.image=[UIImage imageNamed:@"logo2"];
//    logo.y=75*rate_screen_height;
//    logo.centerX=screenWidth/2;
//    [self.view addSubview:logo];
    
    
    if (![SessionTimeCheckOut isSessionAvailable]) {
        [self jumpToLaunchController];
        [MBProgressHUD showError:@"登陆信息已过期"];
        return;
    }
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(jumpToLaunchController) name:@"logout" object:nil];
    
    NSUserDefaults* ud=[NSUserDefaults standardUserDefaults];
    if([ud valueForKey:SETTING_SOUND_ENABLED]==nil)
    {
        [ud setBool:YES forKey:SETTING_SOUND_ENABLED];
    }
    if([ud valueForKey:SETTING_VIBRATE_ENABLED]==nil)
    {
        [ud setBool:YES forKey:SETTING_VIBRATE_ENABLED];
    }
    
    self.tabVc = [[HNTabbarController alloc] init];
    //    self.tabVc.tabDelegate = self;
    //    self.tabVc.delegate = self;
    //    [self.view addSubview:_tabVc.view];
    //    [self addChildViewController:_tabVc];
    
//    if (self.alreadyLaunch == alreadyLaunch_YES) {
//        /** 登录到应用服务器*/
//        //        [self launchToAppServer];
//        [self launchToEASEMob];
//        [UIApplication sharedApplication].keyWindow.rootViewController=self.tabVc;
//        
//        [MyProgressHub showSuccess:@"登陆成功"];
//    }
//    else
    if(self.alreadyLaunch == alreadyLaunch_NO){
        [self jumpToLaunchController];
        
        [MyProgressHub hide];
    }
    else{
        
        [UIApplication sharedApplication].keyWindow.rootViewController=self.tabVc;
        
        [[ControllerStack sharedControllerStack]restoreHistoryControllerStack];
        
        YDaccount* accou=[YDAccountTool account];
        
        if (accou.guest) {
            
//            [MyProgressHub askToLogin];
        }
        else
        {
            [MyProgressHub showProgress:@"正在登陆..."];
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                
                EMError *error = [[EMClient sharedClient] loginWithUsername:[[God manager] user_name] password:[[God manager] password]];
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (error) {
                        [MBProgressHUD showError:@"用户名或密码错误"];
//                        [YDAccountTool deleteAccount];
                        [self jumpToLaunchController];
                    }else{
                        [MyProgressHub showSuccess:@"登录成功"];
                        [self.tabVc.conversationController refreshConversationList];
                        [self getDetailInfo];
                    }
                });
            });
        }
    }

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}


//- (void)dealloc
//{
//    YDLog(@"销毁了");
//    [[EMClient sharedClient] removeDelegate:self];
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
//}

#pragma mark - 私有的 action
/** 登录到应用服务器*/
- (void)launchToAppServer
{
    __weak typeof(self) weakSelf = self;
    
    [MBProgressHUD showMessage:@"正在登录..." toView:weakSelf.navigationController.view];
    WBUserService *userService = [[WBUserService alloc] init];
    [userService lauchAppServerWithUserName:[[God manager] user_name] password:[[God manager] password]];
    userService.successBlock = ^(id value){
        [weakSelf getDetailInfo];
        [MBProgressHUD hideHUDForView:weakSelf.navigationController.view];
    };
    userService.failureBlock = ^(id value){
        [MBProgressHUD hideHUDForView:weakSelf.navigationController.view];
        [MBProgressHUD showError:value];
        [weakSelf jumpToLaunchController];
    };
    userService.errorBlock = ^(id value){
        [MBProgressHUD hideHUDForView:weakSelf.navigationController.view];
        [MBProgressHUD showError:@"未能连接到服务器"];
        [weakSelf jumpToLaunchController];
    };
}

- (void)launchToEASEMob{
//    [MBProgressHUD showMessage:@"正在登录..." toView:self.navigationController.view];
    EMError *error = [[EMClient sharedClient] loginWithUsername:[[God manager] user_name] password:[[God manager] password]];
    if (error) {
        [MBProgressHUD hideHUDForView:self.navigationController.view];
        [MBProgressHUD showError:@"用户名或密码错误"];
    }else{
        //        [MBProgressHUD hideHUDForView:self.navigationController.view];
        ////        [MBProgressHUD showSuccess:@"登录成功"];
        //        [self.tabVc.conversationController refreshConversationList];
        //        [self getDetailInfo];
    }
}

/** 跳转到登录控制器*/
- (void)jumpToLaunchController
{
    [[EMClient sharedClient] logout:YES];
    [[God manager] setIsLogIn:NO];
    
//    HNNavigationController *nav = [[HNNavigationController alloc] initWithRootViewController:[[login2Controller alloc] init]];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[login2Controller alloc] init];
}


/** 获取个人详细资料*/
- (void)getDetailInfo
{
    WBUserService *userService = [[WBUserService alloc] init];
    [userService getLoginUserInfoFromServer];
    __weak typeof(userService) weakUser = userService;
    userService.successBlock = ^(id value){
        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"replacePortrait" object:nil]];
        [[HIFuckZG manager] registerLaunchUser];
    };
    userService.failureBlock = ^(id object){
        [weakUser getLoginUserInfoFromServer];
    };
    
    if ([[[God manager] character] isEqualToString:@"Listener"]) {
        WBListenerService *listenerSe = [[WBListenerService alloc] init];
        [listenerSe getListenerInfoWithUserName:[[God manager] user_name]];
        __weak typeof(listenerSe) weakListenerSe = listenerSe;
        listenerSe.successBlock = ^(id object){
            [[God manager] setListener:object];
        };
        listenerSe.failureBlock = ^(id object){
            [weakListenerSe getListenerInfoWithUserName:[[God manager] user_name]];
        };
    }
}

/** 从环信下线*/
- (void)logoutFromEaseMob
{
    [[EMClient sharedClient] logout:YES];
    // 退出登录，标记为isLogIn=NO
    [[God manager] setIsLogIn:NO];
    [[God manager] setPassword:@""];
}

#pragma mark - EMClientDelegate 登录状态变化
/** 检测网络情况*/
//- (void)didConnectionStateChanged:(EMConnectionState)aConnectionState{
//    if (clientSuccessed) {
//        clientSuccessed = NO;
//        return;
//    }
//    NSString *title = aConnectionState == EMConnectionDisconnected ? @"连接失败": @"重连成功";
//    NSString *message = aConnectionState == EMConnectionDisconnected ?  @"请检查当前的网络状况" : @"重新连接服务器成功";
//    
//    if (!failureAlert && aConnectionState == EMConnectionDisconnected) {
//        failureAlert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *OK = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction *   action) {
//            failureAlert = nil;
//        }];
//        [failureAlert addAction:OK];
//    }
//    if (!successAlert && aConnectionState == EMConnectionConnected) {
//        successAlert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *OK = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction *   action) {
//            successAlert = nil;
//        }];
//        [successAlert addAction:OK];
//    }
//    
//    if (aConnectionState == EMConnectionDisconnected) {
//        if (successAlert) {
//            [successAlert dismissViewControllerAnimated:NO completion:^{
//                successAlert = nil;
//                [self presentViewController:failureAlert animated:YES completion:nil];
//            }];
//        }else{
//            [self presentViewController:failureAlert animated:YES completion:nil];
//        }
//    }else{
//        if (failureAlert) {
//            [failureAlert dismissViewControllerAnimated:NO completion:^{
//                failureAlert = nil;
//                [self presentViewController:successAlert animated:YES completion:nil];
//            }];
//        }else{
//            [self presentViewController:successAlert animated:YES completion:nil];
//        }
//    }
//}

/** 自动登录失败的回调*/
- (void)didAutoLoginWithError:(EMError *)aError;{
    YDLog(@"didAutoLoginWithError:");
    if (![EMClient sharedClient].isConnected) {
        // 重新登陆聊天服务器
        EMError *error = [[EMClient sharedClient] loginWithUsername:[[God manager] user_name] password:[[God manager] password]];
        if (!error) {
            [MBProgressHUD hideHUDForView:self.navigationController.view];
            [MBProgressHUD showSuccess:@"登录成功"];
        }
        else {
            [MBProgressHUD hideHUDForView:self.navigationController.view];
            [MBProgressHUD showError:@"连接聊天服务器失败"];
            [self jumpToLaunchController];
        }
    }
}

/** 当前登录账号在其它设备登录时的通知回调*/
- (void)didLoginFromOtherDevice
{
    [self logoutFromEaseMob];
    UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"帐号在其他设备登录" message:@"帐号在其他设备登录，如非本人操作，请找回密码" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction *   action) {
        [self jumpToLaunchController];
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];

}


#pragma mark - public action
//- (void)appear
//{
//    [self leftMenu];
//    [UIView animateWithDuration:0.25 animations:^{
//        self.leftMenu.transform = CGAffineTransformIdentity;
//        self.tabVc.view.frame = CGRectMake(screenWidth*0.8, 0, screenWidth*1, screenHeight*1);
//    }completion:^(BOOL finished) {
//    }];
//    
//    // 记录进入个人中心
//    [[[HIFuckZG manager] main] enterProfile];
//}

//- (void)hidden
//{
//    [UIView animateWithDuration:0.25 animations:^{
//        // 缩放
//        CGAffineTransform scaleForm = CGAffineTransformMakeScale(1, 1);
//        // 平移
//        CGAffineTransform translateForm = CGAffineTransformTranslate(scaleForm,  -WIDTH_LEFT,0);
//        
//        self.leftMenu.transform = translateForm;
//        self.tabVc.view.frame = CGRectMake(0, 0, screenWidth, screenHeight);
//        
//    }completion:^(BOOL finished) {
//        [self.leftMenu removeFromSuperview];
//        self.leftMenu = nil;
//        [self.tabVc.cover removeFromSuperview];
//    }];
//    // 记录退出个人中心
//    [[[HIFuckZG manager] main] outProfile];
//}
//
//#pragma mark - 懒加载
//- (WBLeftView *)leftMenu
//{
//    if (_leftMenu == nil) {
//        _leftMenu = [[WBLeftView alloc] init];
//        _leftMenu.delegate = self;
//        [self.view insertSubview:_leftMenu atIndex:2];
//        // 缩放
//        CGAffineTransform scaleForm = CGAffineTransformMakeScale(1, 1);
//        // 平移
//        CGAffineTransform translateForm = CGAffineTransformTranslate(scaleForm,  -WIDTH_LEFT,0);
//        
//        self.leftMenu.transform = translateForm;
//    }
//    return _leftMenu;
//}
@end
