//
//  WBLeftView.m
//  橙子
//
//  Created by iMac206 on 15/11/10.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import "WBLeftView.h"

#define PADDING_CELL 15

@interface WBLeftView ()

/** 用户简单资料的容器*/
@property (nonatomic, weak) WBSimpleProfileView *simpleProfileView;

/** state*/
@property (nonatomic, strong) statesSwitchView *stateView;

/** stateButton*/
@property (nonatomic, strong) UIButton *stateButton;
@end

@implementation WBLeftView{
    CGFloat maxHeight;
    UIImageView* stateImgView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 清除背景色
        self.backgroundColor = color_240;
        self.layer.shadowColor = [UIColor blackColor].CGColor;//阴影颜色
        self.layer.shadowOffset = CGSizeMake(4, 0);//偏移距离
        self.layer.shadowOpacity = 0.5;//不透明度
        
        // 设置菜单的frame
        self.frame = CGRectMake(0, 0, WIDTH_LEFT, screenHeight);
        
        // 个人简单资料view
        [self setUserSimpleInfo];
        
        // 按钮列表
        [self setBtnList];
    }
    return self;
}

- (void)dealloc
{
    YDLog(@"销毁了");
}

/** 设置个人简单资料view*/
- (void)setUserSimpleInfo
{
    WBSimpleProfileViewFrame *simpleProfileViewFrame = [[WBSimpleProfileViewFrame alloc] init];
    simpleProfileViewFrame.account = [[God manager] thisGuy];
    
    WBSimpleProfileView *simpleProfileView = [[WBSimpleProfileView alloc] init];
    simpleProfileView.SimpleProfileViewFrame = simpleProfileViewFrame;
    [self addSubview:simpleProfileView];
    self.simpleProfileView = simpleProfileView;
    maxHeight = self.simpleProfileView.maxY;
    
    UIButton *cover = [[UIButton alloc] init];
    cover.frame = simpleProfileViewFrame.topViewFrame;
    [cover addTarget:self action:@selector(chooseBtn:) forControlEvents:UIControlEventTouchUpInside];
    [cover setBackgroundImage:[UIImage createImageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
    [cover setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithWhite:0.7 alpha:0.2]] forState:UIControlStateHighlighted];
    cover.tag = leftMenuButtonTypeUserInfo;
    [self addSubview:cover];
    
    // 这里添加状态切换按钮
    if ([[[God manager] character] isEqualToString:@"Listener"]) {
        NSString* state=[[God manager] user_state].description;
        _stateButton = [[UIButton alloc] init];
        _stateButton.frame = simpleProfileViewFrame.stateFrame;
        _stateButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_stateButton setTitle:state forState:UIControlStateNormal];
        [_stateButton setTitleColor:color_051 forState:UIControlStateNormal];
        UIImage* img=nil;
        if ([state isEqualToString:STRING_ONLINE]) {
            img=[UIImage imageNamed:@"icon-online.png"];
        }
        else if([state isEqualToString:STRING_BUSY])
        {
            img=[UIImage imageNamed:@"icon-busy.png"];
        }
        else
        {
            img=[UIImage imageNamed:@"icon-offline.png"];
        }
        stateImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _stateButton.height, _stateButton.height)];
        stateImgView.contentMode=UIViewContentModeLeft;
        stateImgView.image=img;
        [_stateButton addSubview:stateImgView];
//        [_stateButton setImage:img forState:UIControlStateNormal];
//        [_stateButton setImage:[UIImage imageNamed:@"state_right_1"] forState:UIControlStateNormal];
//        [_stateButton setImage:[UIImage imageNamed:@"state_right_1"] forState:UIControlStateHighlighted];
//        [_stateButton setImage:[UIImage imageNamed:@"state_down_1"] forState:UIControlStateSelected];
        [_stateButton addTarget:self action:@selector(clickedStateButton:) forControlEvents:UIControlEventTouchUpInside];
//        _stateButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 8);
        _stateButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [self addSubview:_stateButton];
        UIImageView* arrow=[[UIImageView alloc]initWithFrame:CGRectMake(_stateButton.x+65, _stateButton.y, _stateButton.height, _stateButton.height)];
        arrow.contentMode=UIViewContentModeCenter;
        arrow.image=[UIImage imageNamed:@"state_down_1.png"];
        [self addSubview:arrow];
    }
}

/** 在线状态切换*/
- (void)clickedStateButton:(UIButton *)button{
    button.selected = !button.selected;
    // 叫出切换状态的菜单
    self.stateView.hidden = !button.selected;
    if (!self.stateView.hidden) {
        [[[HIFuckZG manager] profile] tryChangeOnlineState];
    }
}

/** 设置按钮列表*/
- (void)setBtnList
{
    UIButton *listener;
    if ([[[God manager] character] isEqualToString:@"User"]) {
        listener = [self addButtonWithTitle:@"申请成为聆听者" iconName:@"icon_apply" tag:leftMenuButtonTypeApply];
        maxHeight += 15;
        listener.y = maxHeight;
        maxHeight = listener.maxY;
    }
    else{
        // 没有数据，暂时关闭
        // listener = [self addButtonWithTitle:@"我的聆听" tag:leftMenuButtonTypeMyListener];
        leftMenuButtonType type;
        if ([[[God manager] character] isEqualToString:@"Listener"]) {
            type = leftMenuButtonTypeLisCharity;
        }else{
            type = leftMenuButtonTypeComCharity;
        }
        UIButton *myCharity = [self addButtonWithTitle:@"我的账户" iconName:@"icon_money" tag:type];
        maxHeight += 15;
        myCharity.y = maxHeight;
        maxHeight = myCharity.maxY;
    }
    
    
    // 分割线
//    maxHeight += 4;
//    UIView *line = [[UIView alloc] init];
//    line.backgroundColor = color_204;
//    CGFloat lineX = 10 * rate_screen_width;
//    CGFloat lineY = maxHeight;
//    CGFloat lineW = 200 * rate_screen_width;
//    CGFloat lineH = 0.5;
//    line.frame = CGRectMake(lineX, lineY, lineW, lineH);
//    [self addSubview:line];
//    maxHeight += 12.5;
    
    UIButton *attention =  [self addButtonWithTitle:@"关注的聆听者" iconName:@"icon_attention" tag:leftMenuButtonTypeAttention];
    attention.y = maxHeight + PADDING_CELL;
    maxHeight = attention.maxY;
    
    UIButton *collection =  [self addButtonWithTitle:@"我的收藏" iconName:@"icon_folder" tag:leftMenuButtonTypeCollection];
    collection.y = maxHeight ;
    maxHeight = collection.maxY;
    
//    UIButton *community = [self addButtonWithTitle:@"我的圈子" tag:leftMenuButtonTypeCommunity];
//    community.y = maxHeight;
//    maxHeight = community.maxY;
    
    UIButton *heartWall = [self addButtonWithTitle:@"我的心墙" iconName:@"icon_send" tag:leftMenuButtonTypeHeartWall];
    heartWall.y = maxHeight;
    maxHeight = heartWall.maxY;
    
    UIButton *oppointment = [self addButtonWithTitle:@"预约" iconName:@"icon_alarm" tag:leftMenuButtonTypeAppointment];
    oppointment.y = maxHeight + PADDING_CELL;
    maxHeight = oppointment.maxY;
    
    UIButton *setting = [self addButtonWithTitle:@"设置" iconName:@"icon_setting" tag:leftMenuButtonTypeSetting];
//    setting.y = screenHeight - 80 * rate_screen_width;
    setting.y = maxHeight+PADDING_CELL;
    
}

/** 设置按钮列表*/
- (UIButton *)addButtonWithTitle:(NSString *)title iconName:(NSString *)iconName tag:(leftMenuButtonType )leftMenuButtonType;
{
    UIButton *button = [[UIButton alloc] init];
    button.x = 0;
    button.y = 190;
    button.width = self.width;
    button.height = 48 * rate_screen_height;
    [button setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithWhite:0.7 alpha:0.2]] forState:UIControlStateHighlighted];
    button.tag = leftMenuButtonType;
    [button addTarget:self action:@selector(chooseBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    UIImageView *icon = [[UIImageView alloc] init];
    icon.x = 20 * rate_screen_width;
    icon.y = 0;
    icon.height = button.height;
    icon.width = icon.height;
    icon.contentMode = UIViewContentModeLeft;
    icon.image = [UIImage imageNamed:iconName];
    
    UILabel *label = [[UILabel alloc] init];
    label.x = icon.maxX;;
    label.y = 0;
    label.width = 128;
    label.height = button.height;
    label.font = [UIFont systemFontOfSize:16];
    label.textColor = color_051;
    label.text = title;
    
    UIImageView *arrow = [[UIImageView alloc] init];
    arrow.width = 30;
    arrow.height = button.height;
    arrow.x = self.simpleProfileView.width - arrow.width;
    arrow.y = 0;
    arrow.contentMode = UIViewContentModeCenter;
    arrow.image = [UIImage imageNamed:@"icon_arrow_n"];
    
    
    [button addSubview:icon];
    [button addSubview:arrow];
    [button addSubview:label];
    
    return button;
}

- (void)chooseBtn:(UIButton *)button
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(WBLeftView: clickedButton:)]) {
        [self.delegate WBLeftView:self clickedButton:(int)button.tag];
    }
}

+ (instancetype)menu
{
    return [[self alloc]init];
}

- (statesSwitchView *)stateView{
    if (_stateView == nil) {
        _stateView = [[statesSwitchView alloc] init];
        CGRect rect = self.simpleProfileView.SimpleProfileViewFrame.stateFrame;
        rect.origin.x = rect.origin.x ;//+ 20;
        _stateView.frame = rect;
        __weak typeof(self) weakSelf = self;
        __weak typeof(UIImageView*) weakImg=stateImgView;
        _stateView.switchButtonBlock = ^(UIButton *button){
            weakSelf.stateButton.selected = NO;
            [weakSelf.stateButton setTitle:button.titleLabel.text forState:UIControlStateNormal];
            NSString* state=button.titleLabel.text;
            UIImage* img=nil;
            if ([state isEqualToString:STRING_ONLINE]) {
                img=[UIImage imageNamed:@"icon-online.png"];
            }
            else if([state isEqualToString:STRING_BUSY])
            {
                img=[UIImage imageNamed:@"icon-busy.png"];
            }
            else
            {
                img=[UIImage imageNamed:@"icon-offline.png"];
            }
            [weakImg setImage:img];
            if(button.selected == YES) return ;
            // 修改状态
            NSDictionary *param = @{@"user_id":[[God manager] user_id],
                                    @"user_state": @(button.tag - 1000)};
            WBUserService *service = [[WBUserService alloc] init];
            [service modifyUserInfoWithUserName:[[God manager] user_name] userInfoDict:param];
            service.successBlock = ^(id value){
                [[[HIFuckZG manager] profile] successedChangeOnlineState];
                [[God manager] setUser_state:[NSNumber numberWithInteger:button.titleLabel.text.integerValue]];
            };
        };
        [self addSubview:_stateView];
    }
    return _stateView;
}

@end
