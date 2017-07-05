//
//  UIBarButtonItem+Extension.m
//  微博
//
//  Created by Ch_n on 15/4/17.
//  Copyright (c) 2015年 ch_n. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *) itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action
{
    UIBarButtonItem* item=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStylePlain target:target action:action];
    return item;
//    UIButton *button = [[UIButton alloc] init];
//    
//    //设置button背景图片
//    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
//    
//    //定义button的尺寸为背景图片的尺寸
//    button.size = CGSizeMake(30, 30);
//    //监听按钮点击
//    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    return [[UIBarButto nItem alloc] initWithCustomView:button];
}

/** 个人中心*/
+ (UIBarButtonItem *) userCenterItemWitnImageUrl:(NSURL *)imageUrl target:(id)target action:(SEL)action
{
    // 个人中心按钮
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(10, 6, 32, 32);
    button.layer.cornerRadius = button.width * rate_portrait_cornerRadius;
    button.clipsToBounds = YES;
    [button sd_setImageWithURL:imageUrl forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"portrait_loading"]];
    [button setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithWhite:0.95 alpha:0.2]] forState:UIControlStateHighlighted];
    
    UIButton *btnView = [[UIButton alloc] init];
    btnView.bounds = CGRectMake(0, 0, 44, 44);
    btnView.enabled = NO;
    [btnView addSubview:button];
    
    //监听按钮点击
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btnView];
}


@end
