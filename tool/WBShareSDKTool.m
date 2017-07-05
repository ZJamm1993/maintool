//
//  WBShareSDKTool.m
//  风聆
//
//  Created by Macbook Air on 15/12/5.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import "WBShareSDKTool.h"
#import "ShareActionView.h"
#import <SMS_SDK/SMSSDK.h>
#import <SMS_SDK/Extend/SMSSDK+AddressBookMethods.h>

@implementation WBShareSDKTool

+ (void)registerAppCodeIdentify
{
    // 注册mob的sdk
    [SMSSDK registerApp:MOB_Key withSecret:MOB_Secret];
    [SMSSDK enableAppContactFriends:NO];
}

+(void)shareWithTitle:(NSString *)title text:(NSString *)text image:(UIImage *)image url:(NSString *)url
{
    if (title.length==0) {
        title=@"分享";
    }
    if (text.length==0) {
        text=@"分享内容";
    }
    if (url.length>0) {
        ShareActionView* s=[ShareActionView shareAction];
        s.title=title;
        s.descri=text;
        s.url=url;
        s.image=image;
        [s show];
    }
}

@end
