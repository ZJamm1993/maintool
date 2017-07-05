//
//  HIFuckZG.m
//  风聆
//
//  Created by HIChen on 16/7/7.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import "HIFuckZG.h"

static id _instance;

@implementation HIFuckZG
+ (instancetype)manager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.launch = [[ZGLaunch alloc] init];
        self.main = [[ZGMain alloc] init];
        self.home = [[ZGHome alloc] init];
        self.conversation = [[ZGConversation alloc] init];
        self.feeling = [[ZGFeelingWall alloc] init];
        self.discover = [[ZGDiscover alloc] init];
        self.profile = [[ZGProfile alloc] init];
        self.chat = [[ZGChat alloc] init];
    }
    return self;
}

- (void)startZhugeWithOptions:(NSDictionary *)launchOptions{
    Zhuge *zhuge = [Zhuge sharedInstance];
    // 打开SDK日志打印
    //    [zhuge.config setLogEnabled:YES]; // 默认关闭
    
    [zhuge.config setDebug:YES]; // 默认关闭
    
    // 自定义版本和渠道
    NSString *versionKey = @"CFBundleShortVersionString";
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[versionKey];
    [zhuge.config setAppVersion:currentVersion]; // 默认是info.plist中CFBundleShortVersionString值
    [zhuge.config setChannel:@"App Store"]; // 默认是@"App Store"
    
    // 推送指定deviceToken上传到开发环境或生产环境，默认NO，上传到开发环境
    [zhuge.config setApsProduction:YES];
    // 可视化事件布点手势监听开关
    // 打开此开关的设备，可以使用可视化方式定义事件
    // 此开关会增加设备的耗电，建议仅为需要的人员（如产品、运营经理）打开
    // [zhuge openGestureBindingUI];
    // 启动诸葛
    [zhuge startWithAppKey:@"4de6478067354dd2bd8843de6cbe9209" launchOptions:launchOptions];
    
    NSString *systemVersion=[[UIDevice currentDevice]systemVersion];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_APP forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:systemVersion properties:params];
}
#pragma mark - app活动相关
- (void)launchApp{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_APP forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"启动app" properties:params];
}
- (void)enterBackground{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_APP forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"app退到后台" properties:params];
    
}
- (void)enterForeground{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:ID_APP forKey:@"事件模块分类"];
    [[Zhuge sharedInstance] track:@"app回到前台" properties:params];
}

- (void)registerLaunchUser{
    NSMutableDictionary *user = [NSMutableDictionary dictionary];
    user[@"name"] = [[God manager] nick_name];
    user[@"gender"] = [[God manager] sex];
    user[@"avatar"] = [[God manager] portrait_url];
    user[@"email"] = [[God manager] email];
    user[@"mobile"] = [[God manager] user_name];
    user[@"学校/组织"] = [[God manager] school];
    user[@"身份"] = [[God manager] character];
    [[Zhuge sharedInstance] identify:[[God manager] user_id] properties:user];
}
@end
