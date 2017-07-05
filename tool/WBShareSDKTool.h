//
//  WBShareSDKTool.h
//  风聆
//
//  Created by Macbook Air on 15/12/5.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"
#import <TencentOpenApi/QQApiInterface.h>
#import <TencentOpenApi/TencentOAuth.h>

@interface WBShareSDKTool : NSObject

+(void)shareWithTitle:(NSString*)title text:(NSString*)text image:(UIImage*)image url:(NSString*)url;

/** 注册app验证码*/
+ (void)registerAppCodeIdentify;
@end
