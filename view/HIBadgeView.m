//
//  HIBadgeView.m
//  风聆
//
//  Created by Macbook Air on 16/3/31.
//  Copyright © 2016年 Macbook Air. All rights reserved.
//

#import "HIBadgeView.h"

@implementation HIBadgeView{
    UILabel *badgeLabel;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        
        // 创建底色view
//        self.backgroundColor = RGBAColor(255, 104, 114, 1);
        self.backgroundColor = [UIColor redColor];
        self.hidden = YES;
        self.layer.cornerRadius = 8.0;
        
        // 创建count
        badgeLabel = [[UILabel alloc] init];
        badgeLabel.textColor = [UIColor whiteColor];
        badgeLabel.font = font_10;
        badgeLabel.textAlignment = NSTextAlignmentCenter;
        badgeLabel.x = 0;
        badgeLabel.y = 0;
        [self addSubview:badgeLabel];
    }
    return self;
}

- (void)setBadgeNumber:(int)badgeNumber{
    if (badgeNumber == 0) {
        self.hidden = YES;
        return;
    }
    if (badgeNumber > 0 && badgeNumber <10) {
        self.hidden = NO;
        self.width = 16;
        self.height = 16;
        badgeLabel.width = self.width;
        badgeLabel.height = self.height;
        badgeLabel.text = [NSString stringWithFormat:@"%i",badgeNumber];
    }
    if (badgeNumber >= 10 && badgeNumber <100) {
        self.hidden = NO;
        self.width = 20;
        self.height = 16;
        badgeLabel.width = self.width;
        badgeLabel.height = self.height;
        badgeLabel.text = [NSString stringWithFormat:@"%i",badgeNumber];
    }
    if (badgeNumber > 100) {
        self.hidden = NO;
        self.width = 28;
        self.height = 16;
        badgeLabel.width = self.width;
        badgeLabel.height = self.height;
        badgeLabel.text = @"99+";
    }
}
@end
