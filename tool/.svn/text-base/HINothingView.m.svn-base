//
//  HINothingView.m
//  风聆
//
//  Created by HIChen on 16/7/8.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import "HINothingView.h"

@implementation HINothingView

- (instancetype)initWithImageName:(NSString *)imageName description:(NSString *)description toAction:(NSString *)action frame:(CGRect)frame{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.frame = frame;
        
        UIImageView *image = [[UIImageView alloc] init];
        image.image = [UIImage imageNamed:imageName];
        image.width = 160 * rate_screen_width;
        image.height = 160 * rate_screen_width;
        image.x = (frame.size.width - image.width) * 0.5;
        image.y = (frame.size.height - image.height) * 0.5 - tabbarHeight;
        [self addSubview:image];
        
        UILabel *descrip = [[UILabel alloc] init];
        descrip.text = description;
        descrip.frame = CGRectMake(image.x, image.maxY, image.width, 24);
        descrip.textColor = color_051;
        descrip.font = font_15;
        descrip.textAlignment = NSTextAlignmentCenter;
        [self addSubview:descrip];
        
        UILabel *actionLab = [[UILabel alloc] init];
        actionLab.text = action;
        actionLab.frame = CGRectMake(image.x, descrip.maxY, image.width, 24);
        actionLab.textColor = color_051;
        actionLab.font = font_13;
        actionLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:actionLab];
        
        // 创建activity
        // 创建加载按钮
        // 创建正在加载字样
        UIButton *button = [[UIButton alloc] init];
        button.titleLabel.font = font_13;
        button.width = 64;
        button.height = 28;
        button.x = (self.width - button.width) * 0.5;
        button.y = actionLab.maxY;
        [button setBackgroundImage:[UIImage createImageWithColor:color_main_app] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage createImageWithColor:color_Highlighted_app] forState:UIControlStateHighlighted];
        [button setTitle:@"重新加载" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.cornerRadius = 8;
        button.clipsToBounds = YES;
        [self addSubview:button];
        
        
        UIActivityIndicatorView *activity=[[UIActivityIndicatorView alloc]init];
        activity.size = CGSizeMake(28, 28);
        activity.center = button.center;
        activity.hidesWhenStopped=YES;
        self.activity = activity;
        
        //[activity startAnimating];
        activity.activityIndicatorViewStyle=UIActivityIndicatorViewStyleGray;
        [self addSubview:activity];
    }
    return self;
}

- (void)refresh:(UIButton *)button{
    if (self.refreshBlock) {
        button.hidden = YES;
        self.refreshBlock(button, self.activity);
    }
}
@end
