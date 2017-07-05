//
//  WBUserService.h
//  风聆
//
//  Created by Macbook Air on 16/3/18.
//  Copyright © 2016年 Macbook Air. All rights reserved.
//

#import "WBHttpTool.h"

typedef enum {
    uploadImageTypePortrait,
    uploadImageTypeCard
}uploadImageType;

@interface WBUserService : WBHttpTool
/** 注册用户*/
- (void)registerUserWithUserInfoDict:(NSDictionary *)userInfoDict;
/** 登录到app服务器*/
- (void)lauchAppServerWithUserName:(NSString *)userName password:(NSString *)password;
/** 修改用户密码*/
- (void)modifyUserPasswordUserName:(NSString *)userName password:(NSString *)password;
/** 获取自己的详细资料*/
- (void)getLoginUserInfoFromServer;
/** 通过user_id查询用户详细资料*/
- (void)getUserDetailInfoByUserId;
/** 通过user_name查询用户详细资料*/
- (void)getUserDetailInfoByUserName:(NSString *)userName;
/** 修改用户资料*/
- (void)modifyUserInfoWithUserName:(NSString *)userName userInfoDict:(NSDictionary *)infoDict;

/** 修改头像*/
- (void)modifyUserImage:(UIImage *)image imageType:(uploadImageType)imageType;
@end
