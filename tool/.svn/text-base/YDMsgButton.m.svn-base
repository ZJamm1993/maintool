//
//  YDMsgButton.m
//  风聆
//
//  Created by iMac206 on 15/12/26.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import "YDMsgButton.h"

@interface YDMsgButton ()

/** badgeView*/
@property (nonatomic, weak) UIButton *badgeView;
@end
@implementation YDMsgButton

- (instancetype)initWithImageName:(NSString *)imageName hightlightedImageName:(NSString *)hightlightImageName
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, 44, 44);
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:hightlightImageName] forState:UIControlStateHighlighted];
        
        // 创建左上角的小标志
        UIButton *badgeView = [[UIButton alloc] init];
        badgeView.titleLabel.font = font_09;
        badgeView.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
        badgeView.userInteractionEnabled = NO;
//        btn.contentHorizontalAlignment = UIControlContentHorizonAlignmentLeft;
//        但是问题又出来，此时文字会紧贴到做边框，我们可以设置;
        badgeView.contentEdgeInsets = UIEdgeInsetsMake(1, 1, 0, 0);
        [badgeView setBackgroundImage:[UIImage createImageWithColor:RGBAColor(215, 119, 119, 1)] forState:UIControlStateNormal];
        [badgeView setBackgroundImage:[UIImage createImageWithColor:RGBAColor(235, 182, 185, 1)] forState:UIControlStateHighlighted];
        badgeView.layer.cornerRadius = 8.0;
        badgeView.clipsToBounds = YES;
        [self addSubview:badgeView];
        self.badgeView = badgeView;
    }
    return self;
}

- (void)setBadge:(int)badge
{
    // 显示在左上角
    if (badge == 0) {
        self.badgeView.hidden = YES;
        return;
    }
    
    self.badgeView.hidden = NO;
    NSString *badgeStr = [NSString stringWithFormat:@"%i",badge];
    [self.badgeView setTitle:badgeStr forState:UIControlStateNormal];
    
    CGFloat width = [UIFont sizeWithString:badgeStr withMaxSize:CGSizeMake(30, 16) withFont:9].width;
    CGFloat badgeW = MAX(width, 16);
    CGFloat badgeH = 16;
    CGFloat badgeX = self.width - badgeW - 4;
    CGFloat badgeY = 4;
    self.badgeView.frame = CGRectMake(badgeX, badgeY, badgeW, badgeH);
    
    
}
@end
