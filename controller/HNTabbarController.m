//
//  HNTabbarController.m
//  橙子
//
//  Created by Macbook Air on 15/8/18.
//  Copyright (c) 2015年 Macbook Air. All rights reserved.
//

#import "HNTabbarController.h"
#import "HNNavigationController.h"
#import "HNNavigationBar.h"
#import "HIBadgeView.h"
#import "FeedbackController.h"

#define kAnimationDuration .3
@interface HNTabbarController ()<listenerControllerDelegate, communityControllerDelegate, heartWallControllerDelegate, discoverControllerDelegate, conversationControllerDelegate>

@property (assign, nonatomic) CGPoint           beginpoint;
@property (nonatomic, assign) CGFloat           distance ;
@property (nonatomic, strong) mainController    *main;

@end

@implementation HNTabbarController{
    NSMutableArray *badgeViews;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBar.tintColor=color_main_app;
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 49)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque = YES;
    
    self.listener = [[listenerController alloc] init];
    self.navHome = [self addChildVC:self.listener title:@"聊聊" image:@"tab_talk" selectedImage:@"tab_talk_s"];
    self.listener.delegate = self;
    
//    self.community = [[communityController alloc] init];
//    [self addChildVC:self.community title:@"圈子" image:@"icon_people_n" selectedImage:@"icon_people_s"];
//    self.community.delegate = self;
    
    self.conversationController = [[conversationController alloc] init];
    self.conversationController.delegate = self;
//    [self.conversationController refreshConversationList];
    self.navConversation = [self addChildVC:self.conversationController title:@"消息" image:@"tab_msg" selectedImage:@"tab_msg_s"];
    
    self.heartWall = [[heartWallController alloc] init];
    self.navDiscover = [self addChildVC:self.heartWall title:@"发现" image:@"tab_dis" selectedImage:@"tab_dis_s"];
    self.heartWall.delegate = self;
    self.discover=[[discoverController alloc]init];
    
    self.meController = [[MyController alloc] init];
    self.navMe = [self addChildVC:self.meController title:@"我的" image:@"tab_me" selectedImage:@"tab_me_s"];
//    self.discover.delegate = self;
    
    // 添加拖动手势
//    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
//    panGestureRecognizer.maximumNumberOfTouches = 1;
    
//    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    //  让此控制器成为第一响应者
    [self becomeFirstResponder];
    
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    // 摇一摇
    if (motion==UIEventSubtypeMotionShake) {
        [self goToFeedback];
    }
}

/** 去反馈*/
- (void)goToFeedback{
    if ([[YDAccountTool account]guest]) {
        return;
    }
    // 弹出反馈页面
    FeedbackController *vc = [[FeedbackController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)dealloc
{
//    YDLog(@"销毁了");
}

-(void)discorverSwitchController
{
    [self.navDiscover popToRootViewControllerAnimated:NO];
    UIViewController* vc=[self.navDiscover.viewControllers firstObject];
    if ([vc isMemberOfClass:[discoverController class]]) {
        vc=self.heartWall;
    }
    else
    {
        vc=self.discover;
    }
    [self.navDiscover setViewControllers:[NSArray arrayWithObject:vc] animated:NO];
}


#pragma mark - 私有方法
/** 创建控制器*/
- (HNNavigationController *)addChildVC:(UIViewController *)childVC title:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName
{
    // 设置导航控制器
    HNNavigationController *nav = [[HNNavigationController alloc] initWithRootViewController:childVC];
    nav.fullScreenPopGestureEnable = NO;
    // 设置标题
    [nav setTitle:title];
    [childVC setTitle:title];
    
//    NSMutableDictionary *tabBarTextColor = [NSMutableDictionary dictionary];
//    tabBarTextColor[NSForegroundColorAttributeName] = [UIColor grayColor];
//    tabBarTextColor[NSFontAttributeName] = [UIFont systemFontOfSize:12];
//    [nav.tabBarItem setTitleTextAttributes:tabBarTextColor forState:UIControlStateNormal];
//    
//    // 设置被选中时的label样式
//    NSMutableDictionary *selectedTabBarTextColor = [NSMutableDictionary dictionary];
//    selectedTabBarTextColor[NSForegroundColorAttributeName] = color_main_app;
//    selectedTabBarTextColor[NSFontAttributeName] = [UIFont systemFontOfSize:12];
//    [childVC.tabBarItem setTitleTextAttributes:selectedTabBarTextColor forState:UIControlStateSelected];
    
    // 设置未被选中时的图片
    UIImage *image =[[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [[nav tabBarItem] setImage:image];
    
    // 设置被选中时的图片
    UIImage *selectedImage = [[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [[nav tabBarItem] setSelectedImage:selectedImage];
    
    [self addChildViewController:nav];
    return nav;
}

@end
