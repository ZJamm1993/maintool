//
//  HINothingTool.m
//  风聆
//
//  Created by iMac206 on 16/6/28.
//  Copyright © 2016年 Macbook Air. All rights reserved.
//

#import "HINothingTool.h"

@implementation HINothingTool
+ (UIView *)nothingWithImageName:(NSString *)imageName description:(NSString *)description toAction:(NSString *)action{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    
    UIImageView *image = [[UIImageView alloc] init];
    image.image = [UIImage imageNamed:imageName];
    image.width = 160 * rate_screen_width;
    image.height = 160 * rate_screen_width;
    image.x = (screenWidth - image.width) * 0.5;
    image.y = (screenHeight - image.height) * 0.5;
    [view addSubview:image];
    
    UILabel *descrip = [[UILabel alloc] init];
    descrip.text = description;
    descrip.frame = CGRectMake(image.x, image.maxY, image.width, 24);
    descrip.textColor = color_051;
    descrip.font = font_15;
    descrip.textAlignment = NSTextAlignmentCenter;
    [view addSubview:descrip];
    
    UILabel *actionLab = [[UILabel alloc] init];
    actionLab.text = action;
    actionLab.frame = CGRectMake(image.x, descrip.maxY, image.width, 24);
    actionLab.textColor = color_051;
    actionLab.font = font_13;
    actionLab.textAlignment = NSTextAlignmentCenter;
    [view addSubview:actionLab];
    return view;
}

+ (UIView *)nothingWithImageName:(NSString *)imageName description:(NSString *)description toAction:(NSString *)action frame:(CGRect)frame{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = gray_233;
    view.frame = frame;
    
    UIImageView *image = [[UIImageView alloc] init];
    image.image = [UIImage imageNamed:imageName];
    image.width = 160 * rate_screen_width;
    image.height = 160 * rate_screen_width;
    image.x = (frame.size.width - image.width) * 0.5;
    image.y = (frame.size.height - image.height) * 0.5 - tabbarHeight;
    image.contentMode=UIViewContentModeCenter;
    [view addSubview:image];
    
    UILabel *descrip = [[UILabel alloc] init];
    descrip.text = description;
    descrip.frame = CGRectMake(image.x, image.maxY+64, image.width, 24);
    descrip.textColor = color_051;
    descrip.font = font_15;
    descrip.textAlignment = NSTextAlignmentCenter;
    [view addSubview:descrip];
    
    UILabel *actionLab = [[UILabel alloc] init];
    actionLab.text = action;
    actionLab.frame = CGRectMake(image.x, descrip.maxY, image.width, 24);
    actionLab.textColor = color_051;
    actionLab.font = font_13;
    actionLab.textAlignment = NSTextAlignmentCenter;
    [view addSubview:actionLab];
    
    return view;
}

- (instancetype)initWithImageName:(NSString *)imageName description:(NSString *)description toAction:(NSString *)action frame:(CGRect)frame{
    self = [super init];
    if (self) {
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view.frame = frame;
        
        UIImageView *image = [[UIImageView alloc] init];
        image.image = [UIImage imageNamed:imageName];
        image.width = 160 * rate_screen_width;
        image.height = 160 * rate_screen_width;
        image.x = (frame.size.width - image.width) * 0.5;
        image.y = (frame.size.height - image.height) * 0.5 - tabbarHeight;
        [view addSubview:image];
        
        UILabel *descrip = [[UILabel alloc] init];
        descrip.text = description;
        descrip.frame = CGRectMake(image.x, image.maxY, image.width, 24);
        descrip.textColor = color_051;
        descrip.font = font_15;
        descrip.textAlignment = NSTextAlignmentCenter;
        [view addSubview:descrip];
        
        UILabel *actionLab = [[UILabel alloc] init];
        actionLab.text = action;
        actionLab.frame = CGRectMake(image.x, descrip.maxY, image.width, 24);
        actionLab.textColor = color_051;
        actionLab.font = font_13;
        actionLab.textAlignment = NSTextAlignmentCenter;
        [view addSubview:actionLab];
        
        // 创建activity
        // 创建加载按钮
        // 创建正在加载字样
        UIButton *button = [[UIButton alloc] init];
        button.titleLabel.font = font_13;
        button.width = 60;
        button.height = 28;
        button.x = (view.width - button.width) * 0.5;
        button.y = actionLab.maxY;
        [button setBackgroundImage:[UIImage createImageWithColor:color_main_app] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage createImageWithColor:color_Highlighted_app] forState:UIControlStateHighlighted];
        [button setTitle:@"重新加载" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.cornerRadius = 8;
        button.clipsToBounds = YES;
        [view addSubview:button];
        
        
        UIActivityIndicatorView *activity=[[UIActivityIndicatorView alloc]init];
        activity.size = CGSizeMake(36, 36);
        activity.center = button.center;
        activity.hidesWhenStopped=YES;
        self.activity = activity;
        
        //[activity startAnimating];
        activity.activityIndicatorViewStyle=UIActivityIndicatorViewStyleGray;
        [view addSubview:activity];
        
        self.nothingView = view;
    }
    return self;
}

- (void)refresh:(UIButton *)button{
    button.hidden = YES;
    if (self.refreshBlock) {
        self.refreshBlock(self.activity);
    }
}

@end
