//
//  HNNavigationController.m
//  橙子
//
//  Created by Macbook Air on 15/8/18.
//  Copyright (c) 2015年 Macbook Air. All rights reserved.
//

#import "HNNavigationController.h"
#import "HNNavigationBar.h"
@interface HNNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

/** 全屏返回手势*/
@property (nonatomic, strong) UIPanGestureRecognizer *popPanGesture;
@end

@implementation HNNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    HNNavigationBar *navBar = [[HNNavigationBar alloc] init];
//    [self setValue:navBar forKeyPath:@"navigationBar"];
    
//    [self.navigationBar setBarStyle:UIBarStyleDefault];
//    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:gray_51,NSFontAttributeName:[UIFont systemFontOfSize:18]};
    self.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationBar.tintColor=green_color;
    // 去掉高斯模糊
//    self.navigationBar.translucent = NO;
//    [self.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor redColor]] forBarMetrics:UIBarMetricsLandscapePhone];
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    
    self.delegate = self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (self.fullScreenPopGestureEnable) {
        id target = self.interactivePopGestureRecognizer.delegate;
        SEL action = NSSelectorFromString(@"handleNavigationTransition:");
        self.popPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:action];
        [self.view addGestureRecognizer:self.popPanGesture];
        self.popPanGesture.maximumNumberOfTouches = 1;
        self.interactivePopGestureRecognizer.enabled = NO;
    } else {
        self.interactivePopGestureRecognizer.delegate = self;
    }

}
////
////

- (void)dealloc
{
//    YDLog(@"销毁了");
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}
//

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(viewController==nil)
    {
        [MyProgressHub askToLogin];
        return;
    }
    //当push这个控制器的时候，就自动隐藏底部的tabbar
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed = YES;
        // 设置导航栏按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"nav_return_n" highImageName:@"nav_return_h" target:self action:@selector(back)];
    }
    
    UIBarButtonItem* backButton=[[UIBarButtonItem alloc]init];
    backButton.title=@" ";
    
    //因为主界面rootController是navigationController，如果先调用这句话，则bottomBar会消失
    [super pushViewController:viewController animated:animated];
    viewController.navigationItem.backBarButtonItem=backButton;
}
//
//// 解决某些情况下push会卡死的情况
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isRootVC = viewController == navigationController.childViewControllers.firstObject;
    id target = self.interactivePopGestureRecognizer.delegate;
    SEL action = NSSelectorFromString(@"handleNavigationTransition:");
    if (self.fullScreenPopGestureEnable) {
        if (isRootVC) {
            [self.popPanGesture removeTarget:target action:action];
        } else {
            [self.popPanGesture addTarget:target action:action];
        }
    } else {
        [self.popPanGesture removeTarget:target action:action];
    }
    self.interactivePopGestureRecognizer.enabled = !isRootVC;
}
////
////// 修复有水平方向滚动的scrollView手势在边缘区域返回失效的问题
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}
//
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

@end
