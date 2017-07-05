//
//  WBSimpleProfileView.m
//  橙子
//
//  Created by iMac206 on 15/11/9.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import "WBSimpleProfileView.h"
#import "WBSimpleProfileViewFrame.h"
#import "YDaccount.h"
//#import "UIImageView+EMWebCache.h"

@interface WBSimpleProfileView()

/** 顶部容器*/
@property (nonatomic, weak) UIView *topView;

/** 头像*/
@property (nonatomic, weak) UIImageView *headIcon;

/** 昵称*/
@property (nonatomic, weak) UILabel *nickNameLab;

/** 身份*/
@property (nonatomic, weak) UIImageView *characterLab;

/** 底部容器*/
@property (nonatomic, weak) UIView *bottomView;

/** 个性签名*/
@property (nonatomic, weak) UILabel *signtureLab;

@end
@implementation WBSimpleProfileView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        // 设置容器
        UIView *topView = [[UIButton alloc] init];
        [self addSubview:topView];
        self.topView = topView;
        
        // 1.设置头像
        UIImageView *headIcon = [[UIImageView alloc] init];
        headIcon.clipsToBounds = YES;
        [self.topView addSubview:headIcon];
        self.headIcon = headIcon;
        
        // 2.设置昵称
        UILabel *nickNameLab = [[UILabel alloc] init];
        nickNameLab.font = [UIFont systemFontOfSize:17];
        nickNameLab.textColor = color_051;
        nickNameLab.numberOfLines = 2;
        nickNameLab.textAlignment = NSTextAlignmentLeft;
        [self.topView addSubview:nickNameLab];
        self.nickNameLab = nickNameLab;
        
        // 3.设置身份
//        UIImageView *characterLab = [[UIImageView alloc] init];
//        characterLab.image = [UIImage imageNamed:@"icon_lister"];
//        [self.topView addSubview:characterLab];
//        self.characterLab = characterLab;
        
        UIView *bottomView = [[UIView alloc] init];
        [self addSubview:bottomView];
        self.bottomView = bottomView;
        
        // 设置个性签名
        UILabel *signtureLab = [[UILabel alloc] init];
        signtureLab.font = [UIFont systemFontOfSize:12 ];
        signtureLab.textColor = color_051;
        signtureLab.textAlignment = NSTextAlignmentLeft;
        signtureLab.numberOfLines = 2;
        [self.bottomView addSubview:signtureLab];
        self.signtureLab = signtureLab;
    }
    return self;
}

- (void)setSimpleProfileViewFrame:(WBSimpleProfileViewFrame *)SimpleProfileViewFrame
{
    _SimpleProfileViewFrame = SimpleProfileViewFrame;
    self.frame = SimpleProfileViewFrame.frame;
    YDaccount *account = SimpleProfileViewFrame.account;
    
    self.topView.frame = SimpleProfileViewFrame.topViewFrame;
    self.headIcon.frame = SimpleProfileViewFrame.headIconFrame;
    self.headIcon.layer.cornerRadius = self.headIcon.width * rate_portrait_cornerRadius;
    [self.headIcon sd_setImageWithURL:[NSURL URLWithString:account.portrait_url] placeholderImage:[UIImage imageNamed:@"portrait_loading"]];
    
    self.nickNameLab.frame = SimpleProfileViewFrame.nickNameFrame;
    self.nickNameLab.text = account.nick_name;
    
    //    if ([account.character isEqualToString:@"Listener"]) {
//        self.characterLab.frame = SimpleProfileViewFrame.characterFrame;
//    }
    
    self.signtureLab.frame = SimpleProfileViewFrame.signtureFrame;
    self.signtureLab.text = account.signature;
    self.signtureLab = [UILabel setLabel:self.signtureLab lineSpace:4];
    
    self.bottomView.frame = SimpleProfileViewFrame.bottomViewFrame;
}

@end
