//
//  WBTipsView.m
//  风聆
//
//  Created by jam on 17/2/15.
//  Copyright (c) 2017年 风聆小镇工作室. All rights reserved.
//

#import "WBTipsView.h"

@interface WBTipsView()
@property (nonatomic,strong) UIImageView* bgImageView;
@property (nonatomic,strong) UIButton* okButton;
@end

@implementation WBTipsView

+(instancetype)baseTipsView
{
    WBTipsView* ti=[[WBTipsView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [ti configureSubViews];
    return ti;
}

+(void)showTipsWithImageName:(NSString*)imgN
{
    [WBTipsView showTipsWithImageName:imgN andKey:imgN];
}

+(void)showTipsWithImageName:(NSString *)imgN andKey:(NSString *)key
{
    key=[NSString stringWithFormat:@"WBTipsKey_%@",key];
    NSUserDefaults* userdef=[NSUserDefaults standardUserDefaults];
    if ([[userdef valueForKey:key]boolValue]) {
        return;
    }
    else
    {
        [userdef setValue:[NSNumber numberWithBool:YES] forKey:key];
        WBTipsView* ti=[WBTipsView baseTipsView];
        ti.bgImageView.image=[UIImage imageNamed:imgN];
        [ti showTipsOnWindow];
        NSLog(@"showing tips:%@",key);
    }
}

-(void)configureSubViews
{
    self.backgroundColor=gray_a(0, 0.5);
    
    self.bgImageView=[[UIImageView alloc]initWithFrame:self.bounds];
    [self addSubview:self.bgImageView];
    
    self.okButton=[[UIButton alloc]initWithFrame:self.bounds];
    [self.okButton addTarget:self action:@selector(removeFromSuperview) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.okButton];
}

-(void)showTipsOnWindow
{
    UIWindow* keyWindow=[[UIApplication sharedApplication]keyWindow];
    [keyWindow addSubview:self];
}

@end
