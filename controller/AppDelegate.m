//
//  AppDelegate.m
//  橙子
//
//  Created by Macbook Air on 15/8/18.
//  Copyright (c) 2015年 Macbook Air. All rights reserved.
//

#import "AppDelegate.h"
#import "mainController.h"
#import "newFeatureController.h"
#import "YDcontrollerTool.h"
#import "HNTabbarController.h"
#import "EMSDK.h"
#import "HIChatManager.h"
#import "WBShareSDKTool.h"
#import "Zhuge.h"
#import <AVFoundation/AVFoundation.h>
#import "login2Controller.h"
//****111
@interface AppDelegate ()<EMClientDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    self.window = [[UIWindow alloc] init];
//    // 1.设置window的背景色
//    self.window.backgroundColor = [UIColor whiteColor];
//    // 2.设置住窗口frame
//    self.window.frame = [UIScreen mainScreen].bounds;
//    // 3.设置住窗口可见
//    [self.window makeKeyAndVisible];
//    
//    self.window.rootViewController=[[UINavigationController alloc]initWithRootViewController:[[HelpController alloc]init]];
////    return YES;
////
//    [[HIFuckZG manager] startZhugeWithOptions:launchOptions];
//    // 记录启动次数
//    [[HIFuckZG manager] launchApp];
//    
//    return YES;
    
    
    NSString* key=is_test_server?@"ipbase#eap-demo":@"ipbase#windbell";
    EMOptions *options = [EMOptions optionsWithAppkey:key];
    options.apnsCertName = is_test_server?@"WindBell_deve":@"WindBell_production";
    options.enableConsoleLog = NO;
    options.isAutoLogin = NO;

    
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    
    
    [[EMClient sharedClient] removeDelegate:self];
    [[EMClient sharedClient] addDelegate:self delegateQueue:nil];

    
    // 0.创建住窗口
    self.window = [[UIWindow alloc] init];
    // 1.设置window的背景色
    self.window.backgroundColor = [UIColor whiteColor];
    // 2.设置住窗口frame
    self.window.frame = [UIScreen mainScreen].bounds;
    // 3.设置住窗口可见
    [self.window makeKeyAndVisible];
//    self.window.rootViewController=[[WBMyHeartWallController alloc]init];
//    return YES;
//    // 取出沙盒里应用的信息
//    //如何知道第一次使用的版本，比较上次使用情况
    NSString *versionKey = @"CFBundleShortVersionString";
    //从沙盒中取出上次存储的版本纪录
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [defaults objectForKey:versionKey];
    //打开当前软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[versionKey];
    
    //string有小数点，转为int类型则只有整数，只有大版本才需要跳转到新特性控制器
    int currentNumber = [currentVersion intValue];
    int lastNumber = [lastVersion intValue];
    // 4.判断窗口的根控制器
    if (currentNumber != lastNumber) {
        //存储这次使用的版本号
        [defaults setValue:currentVersion forKey:versionKey];
        [defaults synchronize];
        self.window.rootViewController = [[newFeatureController alloc] init];
    }
    else{
        // 选择控制器
        [YDcontrollerTool chooseRootViewController];
    }
    
    [WBShareSDKTool registerAppCodeIdentify];
    
    [WXApi registerApp:@"wx675a455c04691ed2"];
    
#if !TARGET_IPHONE_SIMULATOR
    [[TencentOAuth alloc] initWithAppId:@"1105304810" andDelegate:nil];
#endif
    // 启动诸葛io
    [[HIFuckZG manager] startZhugeWithOptions:launchOptions];
    // 记录启动次数
    [[HIFuckZG manager] launchApp];
    
    // 应用启动，清除badge
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    if ([application respondsToSelector:@selector(registerForRemoteNotifications)]) {
        [application registerForRemoteNotifications];
        UIUserNotificationType notificationTypes = UIUserNotificationTypeBadge |
        UIUserNotificationTypeSound |
        UIUserNotificationTypeAlert;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:notificationTypes categories:nil];
        [application registerUserNotificationSettings:settings];
    }
    return YES;
}

/** 从环信下线*/
- (void)logoutFromEaseMob
{
    [[EMClient sharedClient] logout:YES];
    // 退出登录，标记为isLogIn=NO
    [[God manager] setIsLogIn:NO];
    [[God manager] setPassword:@""];
}

- (void)didLoginFromOtherDevice
{
//    UILocalNotification* loc=[[UILocalNotification alloc]init];
//    loc.soundName=@"msg.wav";
//    //    loc.alertTitle=@"呼叫!";
//    loc.alertBody=@"帐号在其他设备登录";
//    loc.fireDate=[NSDate dateWithTimeIntervalSinceNow:1];
//    [[UIApplication sharedApplication]scheduleLocalNotification:loc];
//    
//    [self logoutFromEaseMob];
//    UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"帐号在其他设备登录" message:@"帐号在其他设备登录，如非本人操作，请找回密码" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *action=[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction *   action) {
//        [self jumpToLaunchController];
//    }];
//    [alert addAction:action];
//    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    
}

- (void)jumpToLaunchController
{
    [[EMClient sharedClient] logout:YES];
    [[God manager] setIsLogIn:NO];
//    [YDAccountTool deleteAccount];
    //    HNNavigationController *nav = [[HNNavigationController alloc] initWithRootViewController:[[login2Controller alloc] init]];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[login2Controller alloc] init];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.//
    
    // 注册让后台可以播放铃声
//    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
//    [[AVAudioSession sharedInstance] setActive:YES error:nil];
//    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[EMClient sharedClient] applicationDidEnterBackground:application];
    // 停止计时器
    [[HIChatManager manager] stopTimerWithKey:nil];
    
    // 记录app进入后台
    [[HIFuckZG manager] enterBackground];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [[EMClient sharedClient] applicationWillEnterForeground:application];
    // 应用启动，清除badge
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    // 重启计时器
    [[HIChatManager manager] startTimerWithKey:nil];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    // 到这步。状态栏消失//
    // 记录app回到前台
    //check session
    if(![SessionTimeCheckOut isSessionAvailable] && [[God manager] isLogIn])
    {
        [MBProgressHUD showError:@"登陆信息已过期"];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"logout" object:nil];
    }
    [[HIFuckZG manager] enterForeground];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

// 将得到的deviceToken传给SDK
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    YDLog(@"获取deviceToken成功:%@",deviceToken);
    [[EMClient sharedClient] bindDeviceToken:deviceToken];
}

// 注册deviceToken失败
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    YDLog(@"error -- %@",error);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    YDLog(@"%@",userInfo);
//    {
//        "aps":{
//            "alert":"ApnsName:xxxx",
//            "badge":1,
//            "sound":"default"
//        },
//        "f":"6001",
//        "t":"6006",					 
//        "m":"14aec1e00ef"			 
//    }
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    YDLog(@"内存警告了");
    
    // 赶紧清除所有的内存缓存
    [[EMSDImageCache sharedImageCache] clearMemory];
    
    // 赶紧停止正在进行的图片下载操作
    [[EMSDWebImageManager sharedManager] cancelAll];
}

@end
