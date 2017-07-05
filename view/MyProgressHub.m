//
//  MyProgressHub.m
//  talk_cons
//
//  Created by iMac206 on 16/8/18.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import "MyProgressHub.h"
#import "login2Controller.h"
#import "ControllerStack.h"

#define HUB_W 160
#define HUB_H 100
#define HUB_DELEY 1
#define HUB_FONT 14
#define HUB_ICON_W 40
#define TOP_WINDOW [[UIApplication sharedApplication]keyWindow]

static MyProgressHub* standard;

@implementation MyProgressHub
{
    BOOL hasKeyBoard;
}

+(void)askToLogin
{
    //初始化一个对话框
    UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"未登录" message:@"部分功能将不可用" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"下次再说" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
    }]];
    
    //去登陆页面的操作
    [alert addAction:[UIAlertAction actionWithTitle:@"马上去登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [[ControllerStack sharedControllerStack] saveCurrentControllerStack];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window.rootViewController = [[login2Controller alloc] init];
    }]];
    
    //弹出对话框
    [[[[UIApplication sharedApplication]keyWindow]rootViewController] presentViewController:alert animated:YES completion:nil];
}

+(BOOL)isShowing
{
    MyProgressHub* hub=[MyProgressHub standardHub];
    return hub.superview!=nil;
}

+(void)showProgress:(NSString *)msg
{
    [MyProgressHub hide];
    MyProgressHub* hub=[MyProgressHub standardHub];
    
    UIView* bg=[MyProgressHub bgWithString:msg offSet:YES];
    [hub addSubview:bg];
    [TOP_WINDOW addSubview:hub];
    
    UIActivityIndicatorView* wh=[MyProgressHub wheel];
    [bg addSubview:wh];
    
    //    [hub performSelector:@selector(hideWithAnimation) withObject:nil afterDelay:10];
}

+(void)showMessage:(NSString*)msg
{
    [MyProgressHub hide];
    MyProgressHub* hub=[MyProgressHub standardHub];
    UIView* bg=[MyProgressHub bgWithString:msg offSet:NO];
    [hub addSubview:bg];
    [TOP_WINDOW addSubview:hub];
    
    [hub performSelector:@selector(hideWithAnimation) withObject:nil afterDelay:HUB_DELEY+5];
}

+(void)showSuccess:(NSString*)msg
{
    [MyProgressHub hide];
    MyProgressHub* hub=[MyProgressHub standardHub];
    UIView* bg=[MyProgressHub bgWithString:msg offSet:YES];
    [hub addSubview:bg];
    [TOP_WINDOW addSubview:hub];
    
    UILabel* lab=[MyProgressHub iconLabel:@"✔︎"];
    [bg addSubview:lab];
    
    [hub performSelector:@selector(hideWithAnimation) withObject:nil afterDelay:HUB_DELEY];
}

+(void)showError:(NSString*)msg
{
    [MyProgressHub hide];
    MyProgressHub* hub=[MyProgressHub standardHub];
    UIView* bg=[MyProgressHub bgWithString:msg offSet:YES];
    [hub addSubview:bg];
    [TOP_WINDOW addSubview:hub];
    
    UILabel* lab=[MyProgressHub iconLabel:@"✘"];
    [bg addSubview:lab];
    
    [hub performSelector:@selector(hideWithAnimation) withObject:nil afterDelay:HUB_DELEY];
}

+(void)hide
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hideWithAnimation) object:nil];
    MyProgressHub* hub=[MyProgressHub standardHub];
    [hub hideWithNoThing];
}

-(void)hideWithNoThing
{
    NSArray* subViews=self.subviews;
    for(UIView * view in subViews)
    {
        [view removeFromSuperview];
    }
    if(self.superview!=nil)
        [self removeFromSuperview];
}

-(void)hideWithAnimation
{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha=0;
    } completion:^(BOOL finished) {
        [self hideWithNoThing];
    }];
}

+(instancetype)standardHub
{
    if (standard==nil) {
        standard=[[MyProgressHub alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
        [[NSNotificationCenter defaultCenter]addObserver:standard selector:@selector(keyBoardShowed) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:standard selector:@selector(keyBoardHidden) name:UIKeyboardWillHideNotification object:nil];
    }
    standard.alpha=1;
    
    return standard;
}

-(void)keyBoardShowed
{
    hasKeyBoard=YES;
    self.y=-self.height/4;
}

-(void)keyBoardHidden
{
    hasKeyBoard=NO;
    self.y=0;
}

-(instancetype)init
{
    self=[super init];
    if (self) {
        self.frame=[UIScreen mainScreen].bounds;
    }
    return self;
}

+(UIActivityIndicatorView*)wheel
{
    UIActivityIndicatorView* wh=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    wh.center=CGPointMake(HUB_W/2, HUB_H/2);
    wh.y=wh.y-10;
    wh.hidesWhenStopped=NO;
    [wh startAnimating];
    return wh;
}

+(UILabel*)iconLabel:(NSString*)string
{
    UILabel* lab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, HUB_ICON_W, HUB_ICON_W)];
    lab.textAlignment=NSTextAlignmentCenter;
    lab.font=font(HUB_ICON_W);
    lab.textColor=[UIColor whiteColor];
    lab.text=string;
    lab.center=CGPointMake(HUB_W/2, HUB_H/2);
    lab.y=lab.y-10;
    return lab;
}

+(UIView*)bgWithString:(NSString*)string offSet:(BOOL)off
{
//    UIView* glass=[[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    glass.backgroundColor=[UIColor colorWithWhite:0 alpha:0.1];
    
    CGFloat w=HUB_W;
    if (string.length==0) {
        w=HUB_H;
    }
    UIView* bg=[[UIView alloc]initWithFrame:CGRectMake(0, 0, w, HUB_H)];
   
    CGRect screenBounds=[[UIScreen mainScreen]bounds];
    bg.center=CGPointMake(screenBounds.size.width/2, screenBounds.size.height/2);
    
//    if ([MyProgressHub standardHub]->hasKeyBoard) {
//        bg.y=74;
//    }
    
    UIBlurEffect* blur=[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView* eff=[[UIVisualEffectView alloc]initWithEffect:blur];
    eff.frame=bg.bounds;
    [bg addSubview:eff];
//    bg.backgroundColor=gray_a(0, 0.8);
    bg.layer.cornerRadius=8;
    bg.clipsToBounds=YES;
    bg.layer.masksToBounds=YES;
    //    bg.center=CGPointMake([MyProgressHub standardHub].width/2, [MyProgressHub standardHub].height/2);
    
    CGFloat lh=40;
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(10, HUB_H-lh, w-20, lh)];
    if (!off) {
        label.frame=CGRectMake(10, 10, bg.width-20,bg.height-20);
        label.numberOfLines=3;
    }
    label.text=string;
    label.textColor=[UIColor whiteColor];
    label.backgroundColor=[UIColor clearColor];
    label.textAlignment=NSTextAlignmentCenter;
    label.font=font(HUB_FONT);
    [bg addSubview:label];
//    [glass addSubview:bg];
    
    return bg;
}

@end
