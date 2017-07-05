//
//  leftViewController.m
//  橙子
//
//  Created by Macbook Air on 15/10/15.
//  Copyright (c) 2015年 Macbook Air. All rights reserved.
//

#import "leftViewController.h"
#import "launchController.h"
#import "HNNavigationController.h"
#import "YDaccount.h"
#import "EaseMob.h"

typedef enum {
    leftMenuButtonTypeMyListener ,
    leftMenuButtonTypeCommunity,
    leftMenuButtonTypeHeartWall,
    leftMenuButtonTypeCollection,
    leftMenuButtonTypeMoreService,
    leftMenuButtonTypeSetting
}
leftMenuButtonType;

@interface leftViewController ()

/** 用户简单资料的容器*/
@property (nonatomic, strong) UIView *simpleContent;


@end

@implementation leftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.frame = CGRectMake(-50*rate_screen_width, screenHeight*0.15, menuW*rate_screen_width, menuH*rate_screen_height);
    
    // 清除背景色
    self.view.backgroundColor = [UIColor clearColor];
    
    // 设置菜单的frame
    self.view.frame = CGRectMake(0, 0, 220*rate_screen_width, screenHeight);
    
    // 个人简单资料view
    [self setUserSimpleInfo];
    
    // 按钮列表
    [self setBtnList];

}

/** 设置个人简单资料view*/
- (void)setUserSimpleInfo
{
    // 设置容器
    UIView *contentView = [[UIView alloc] init];
    contentView.x = 0;
    contentView.y = 0;
    contentView.width = 220 * rate_screen_width;
    contentView.height = 180;
    [self.view addSubview:contentView];
    self.simpleContent = contentView;
    
    // 1.设置头像
    UIButton *headBtn = [[UIButton alloc] init];
    headBtn.backgroundColor = [UIColor redColor];
    headBtn.x = 10 * rate_screen_width;
    headBtn.y = 54;
    headBtn.width = 54;
    headBtn.height = headBtn.width;
    headBtn.layer.cornerRadius = headBtn.width / 2.0;
    headBtn.clipsToBounds = YES;
    headBtn.adjustsImageWhenHighlighted = NO;
    [headBtn setImage:[UIImage imageNamed:@"pho_headpicture_n"] forState:UIControlStateNormal];
    [self.simpleContent addSubview:headBtn];
    
    // 2.设置昵称
    UILabel *nickName = [[UILabel alloc] init];
    nickName.x = headBtn.maxX + 12;
    nickName.y = 58;
    nickName.width = 120;
    nickName.height = 28;
    nickName.font = [UIFont systemFontOfSize:19 ];
    YDaccount *account = usersss;
    nickName.text = account.nick_name;
    nickName.textColor = [UIColor whiteColor];
    nickName.textAlignment = NSTextAlignmentLeft;
    [self.simpleContent addSubview:nickName];
    
    // 3.设置风值
    UILabel *cloudValue = [[UILabel alloc] init];
    cloudValue.x = nickName.x;
    cloudValue.y = nickName.maxY;
    cloudValue.width = 120;
    cloudValue.height = 20;
    cloudValue.font = [UIFont systemFontOfSize:15 ];
    cloudValue.text = @"风值:234";
    cloudValue.textColor = [UIColor whiteColor];
    cloudValue.textAlignment = NSTextAlignmentLeft;
    [self.simpleContent addSubview:cloudValue];
    
    // 设置分割线 1
    UIView *separateLineFir = [[UIView alloc] init];
    separateLineFir.x = headBtn.x;
    separateLineFir.y = 130;
    separateLineFir.width = self.simpleContent.width - headBtn.x * 2;
    separateLineFir.height = 1;
    separateLineFir.backgroundColor = [UIColor lightGrayColor];
    [self.simpleContent addSubview:separateLineFir];
    
    
    // 设置分割线 2
    UIView *separateLineSec = [[UIView alloc] init];
    separateLineSec.x = headBtn.x;
    separateLineSec.y = self.simpleContent.height - 1;
    separateLineSec.width = separateLineFir.width;
    separateLineSec.height = 1;
    separateLineSec.backgroundColor = [UIColor lightGrayColor];
    [self.simpleContent addSubview:separateLineSec];
    
    // 设置个人介绍
    UILabel *introduction = [[UILabel alloc] init];
    introduction.x = separateLineFir.x;
    introduction.y = 138;
    introduction.width = separateLineFir.width;
    introduction.height = 35;
    introduction.font = [UIFont systemFontOfSize:12 ];
    introduction.text = @"山东繁花似锦快递发货就是看东方航空是绝代风华科技示范户";
    introduction.textColor = [UIColor whiteColor];
    introduction.textAlignment = NSTextAlignmentLeft;
    introduction.numberOfLines = 0;
    [self.simpleContent addSubview:introduction];
    
}

/** 设置按钮列表*/
- (void)setBtnList
{
    UIButton *listener = [self addButtonWith:@"icon_coffee_n" andTitle:@"我的聆听者" tag:leftMenuButtonTypeMyListener arrowHidden:NO];
    listener.y = self.simpleContent.maxY;
    
    UIButton *community = [self addButtonWith:@"icon_team_n" andTitle:@"我的圈子" tag:leftMenuButtonTypeCommunity arrowHidden:NO];
    community.y = listener.maxY;
    
    UIButton *heartWall =  [self addButtonWith:@"icon_airplane_n" andTitle:@"我的心墙" tag:leftMenuButtonTypeHeartWall arrowHidden:NO];
    heartWall.y = community.maxY;
    
    UIButton *collection =  [self addButtonWith:@"leftMenu_icon_star_n" andTitle:@"我的收藏" tag:leftMenuButtonTypeCollection arrowHidden:NO];
    collection.y = heartWall.maxY;
    
    UIButton *more = [self addButtonWith:@"leftMenu_icon_star_n" andTitle:@"获取更多服务" tag:leftMenuButtonTypeMoreService arrowHidden:NO];
    more.y = collection.maxY;
    
    UIButton *setting = [self addButtonWith:@"icon_setting_n" andTitle:@"设置" tag:leftMenuButtonTypeSetting arrowHidden:YES];
    setting.y = self.view.height - 70;
}

/** 设置按钮列表*/
- (UIButton *)addButtonWith:(NSString *)imageName andTitle:(NSString *)title tag:(leftMenuButtonType )leftMenuButtonType arrowHidden:(BOOL)arrowHidden;
{
    UIButton *button = [[UIButton alloc] init];
    button.x = 0;
    button.y = 190;
    button.width = self.view.width;
    button.height = 36 * rate_screen_height;
    [button setBackgroundImage:[UIImage createImageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage createImageWithColor:[UIColor lightGrayColor]] forState:UIControlStateHighlighted];
    button.tag = leftMenuButtonType;
    [button addTarget:self action:@selector(chooseBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIImageView *icon = [[UIImageView alloc] init];
    icon.x = 4 * rate_screen_width;
    icon.y = 0;
    icon.width = button.height;
    icon.height = icon.width;
    icon.contentMode = UIViewContentModeCenter;
    icon.image = [UIImage imageNamed:imageName];
    
    UILabel *label = [[UILabel alloc] init];
    label.x = 50 * rate_screen_width;
    label.y = 0;
    label.width = 128;
    label.height = button.height;
    label.font = [UIFont systemFontOfSize:16];
    label.textColor = [UIColor whiteColor];
    label.text = title;
    
    UIImageView *arrow = [[UIImageView alloc] init];
    arrow.width = icon.height;
    arrow.height = arrow.width;
    arrow.x = self.simpleContent.width - arrow.width;
    arrow.y = 0;
    arrow.contentMode = UIViewContentModeCenter;
    arrow.image = [UIImage imageNamed:@"icon_arrow_n"];
    arrow.hidden = arrowHidden;
    
    [button addSubview:icon];
    [button addSubview:arrow];
    [button addSubview:label];
    
    return button;
}

- (void)chooseBtn:(UIButton *)button
{
    // 删除account.Data
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSString *accountFilepath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.Data"];
    [manager removeItemAtPath:accountFilepath error:nil];
    
    EMError *error = nil;
    NSDictionary *info = [[EaseMob sharedInstance].chatManager logoffWithUnbindDeviceToken:YES error:error];
    if (info && !error) {
        NSLog(@"退出成功");
    }
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    launchController *VC = [[launchController alloc] init];
    HNNavigationController *nav = [[HNNavigationController alloc] initWithRootViewController:VC];
    
    NSLog(@"chooseBtn---");
    switch (button.tag) {
        case leftMenuButtonTypeSetting:
            window.rootViewController = nav;
            break;
            
        default:
            break;
    }
}

+ (instancetype)menu
{
    return [[self alloc]init];
}


@end
