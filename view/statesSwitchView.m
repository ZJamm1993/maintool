//
//  statesSwitchView.m
//  风聆
//
//  Created by Macbook Air on 16/3/30.
//  Copyright © 2016年 Macbook Air. All rights reserved.
//

#import "statesSwitchView.h"

@implementation statesSwitchView{
    NSMutableArray *buttonArray;
    
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = color_204.CGColor; 
        buttonArray = [NSMutableArray arrayWithCapacity:3];
        // 创建按钮
        [self creatButtonWtihTitle:STRING_ONLINE toState:userStateTypeOnline];
        [self creatButtonWtihTitle:STRING_OFFLINE toState:userStateTypeOutline];
        [self creatButtonWtihTitle:STRING_BUSY toState:userStateTypeBusy];
//        YDaccount *user = [YDAccountTool account];
//        UIButton *button;
//        if ([user.user_state isEqualToString:STRING_ONLINE]) {
//            button = [buttonArray objectAtIndex:0];
//            button.selected = YES;
//        }
//        if ([user.user_state isEqualToString:STRING_OFFLINE]) {
//            button = [buttonArray objectAtIndex:1];
//            button.selected = YES;
//        }
//        if ([user.user_state isEqualToString:STRING_BUSY]) {
//            button = [buttonArray objectAtIndex:2];
//            button.selected = YES;
//        }
    }
    return self;
}

- (UIButton *)creatButtonWtihTitle:(NSString *)title toState:(userStateType)state{
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
//    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.tag = state;
    UIImageView* imageview=[[UIImageView alloc]initWithFrame:CGRectMake(10, 4, 16, 16)];
    if (state==userStateTypeOnline) {
        [imageview setImage:[UIImage imageNamed:@"icon-online.png"]];
    }
    else if(state==userStateTypeBusy){
        [imageview setImage:[UIImage imageNamed:@"icon-busy.png"]];
    }
    else if(state==userStateTypeOutline){
        [imageview setImage:[UIImage imageNamed:@"icon-offline.png"]];
    }
    [button addSubview:imageview];
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(imageview.x+imageview.width+8, 0, 50, 24)];
    label.text=title;
    label.textColor=color_102;
    label.font=[UIFont systemFontOfSize:14];
    [button addSubview:label];
//    [button setBackgroundImage:[UIImage createImageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage createImageWithColor:color_204] forState:UIControlStateHighlighted];
//    [button setBackgroundImage:[UIImage createImageWithColor:color_204] forState:UIControlStateSelected];
//    [button setTitleColor:color_102 forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(clickedSwitchButton:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:button];
    [self addSubview:button];
    return nil;
}

- (void)clickedSwitchButton:(UIButton *)button{
    // 同一个按钮则不需要触发事件
    
    if (self.switchButtonBlock) {
        self.switchButtonBlock(button);
    }
    // 状态切换
    for (UIButton *btn in buttonArray) {
        btn.selected = NO;
    }
    button.selected = YES;
    self.hidden = YES;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    int count = (int)buttonArray.count;
    CGFloat width = 90;
    CGFloat height = 24;
    UIButton *btn;
    for (int i = 0; i < count; i++) {
        btn = [buttonArray objectAtIndex:i];
        btn.x = 0;
        btn.y = height * i;
        btn.width = width;
        btn.height = height;
    }
    CGRect rect = self.frame;
    rect.size = CGSizeMake(width, height * count);
    self.frame = rect;
}



@end
