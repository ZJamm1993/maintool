//
//  WBSimpleProfileViewFrame.m
//  橙子
//
//  Created by iMac206 on 15/11/9.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import "WBSimpleProfileViewFrame.h"
#import "YDaccount.h"

@implementation WBSimpleProfileViewFrame
- (void)setAccount:(YDaccount *)account
{
    _account = account;
    // 设置容器
    CGFloat topViewX = 0;
    CGFloat topViewY = 48;
    CGFloat topViewW = WIDTH_LEFT;
    CGFloat topViewH = 70;
    self.topViewFrame = CGRectMake(topViewX, topViewY, topViewW, topViewH);
    
    // 1.设置头像
    CGFloat headIconX = 10 * rate_screen_width;
    CGFloat headIconY = 6;
    CGFloat headIconW = 54;
    CGFloat headIconH = headIconW;
    self.headIconFrame = CGRectMake(headIconX, headIconY, headIconW, headIconH);
    
    // 2.设置昵称
    CGFloat nickNameX = CGRectGetMaxX(self.headIconFrame) + 16;
    if ([[[God manager] character] isEqualToString:@"Listener"]) {
        CGFloat nickNameW = [UIFont sizeWithString:account.nick_name withMaxSize:CGSizeMake(WIDTH_LEFT-headIconW-2*headIconX, 28) withFont:17].width;
        CGFloat nickNameH = 30;
        CGFloat nickNameY = headIconY;
        self.nickNameFrame = CGRectMake(nickNameX, nickNameY, nickNameW, nickNameH);
    }
    else{
        CGFloat nickNameW = [UIFont sizeWithString:account.nick_name withMaxSize:CGSizeMake(WIDTH_LEFT-headIconW-3*headIconX, 70) withFont:17].width;
        CGFloat nickNameH = 70;
        //        CGFloat nickNameX = CGRectGetMaxX(self.headIconFrame) + 10;
        CGFloat nickNameY = headIconY + (headIconH - nickNameH) / 2.0;
        self.nickNameFrame = CGRectMake(nickNameX, nickNameY, nickNameW, nickNameH);
    }
    
    // 3.设置身份
//    CGFloat characterW = 20;
//    CGFloat characterH = characterW;
//    CGFloat characterX = CGRectGetMaxX(self.nickNameFrame) + 4;
//    CGFloat characterY = headIconY + (headIconH - characterH) * 0.5;
//    self.characterFrame = CGRectMake(characterX, characterY, characterW, characterH);
    CGFloat stateX = nickNameX;
    CGFloat stateY = CGRectGetMaxY(self.nickNameFrame) + topViewY;
    CGFloat stateW = 80;
    CGFloat stateH = 30;
    self.stateFrame = CGRectMake(stateX, stateY, stateW, stateH);
    
    // 底部容器
    CGFloat bottomViewX = 0;
    CGFloat bottomViewY = CGRectGetMaxY(self.topViewFrame)+10;
    CGFloat bottomViewW = topViewW;
    CGFloat bottomViewH = 50;
    self.bottomViewFrame = CGRectMake(bottomViewX, bottomViewY, bottomViewW, bottomViewH);
    
    // 设置个人介绍
    CGFloat signtureX = headIconX;
    CGFloat signtureY = 0;
    CGFloat signtureW = bottomViewW - 2 * headIconX;
    CGFloat signtureH = bottomViewH;
    self.signtureFrame = CGRectMake(signtureX, signtureY, signtureW, signtureH);
    
    self.frame = CGRectMake(0, 0, topViewW, CGRectGetMaxY(self.bottomViewFrame));
    
}
@end
