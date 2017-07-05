//
//  WBUserService.m
//  风聆
//
//  Created by Macbook Air on 16/3/18.
//  Copyright © 2016年 Macbook Air. All rights reserved.
//

#import "WBUserService.h"

@interface WBUserService ()

/** manager*/
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

/** url*/
@property (nonatomic, strong) appUrlInterface *url;
@end

@implementation WBUserService

/** 注册用户*/
- (void)registerUserWithUserInfoDict:(NSDictionary *)userInfoDict{
    appUrlInterface *url = [appUrlInterface urlInterface];
    [WBHttpTool post:url.Register params:userInfoDict success:^(id responseObject) {
        int registerResult = [responseObject[@"success"] intValue];
        if (registerResult == resultSuccess) {
            if(self.successBlock){
                self.successBlock(responseObject);
            }
        }
        else{
            if (self.failureBlock) {
                self.failureBlock(responseObject[@"msg"]);
            }
        }
    } failure:^(NSError *error) {
        YDLog(@"%@",error);
        if (self.errorBlock) {
            self.errorBlock(nil);
        }
    }];
}

/** 登录到app服务器*/
- (void)lauchAppServerWithUserName:(NSString *)userName password:(NSString *)password{
    //NSString *password_MD5 = [password md5];
    NSDictionary *param = @{@"user_name":userName,
                            @"password":password
                          };
    
    appUrlInterface *url = [appUrlInterface urlInterface];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer.timeoutInterval = 10;
    
    [manager GET:url.lauchToServer
      parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        YDLog(@"%@",responseObject);
        int loginResult = [responseObject[@"success"] intValue];
        if (loginResult == resultSuccess) {
            /** 处理用户资料*/
            [self setUserInfoWith:operation userDict:responseObject password:password];
            if (self.successBlock) {
                self.successBlock(nil);
            }
        }
        else{
            YDaccount *account = [YDAccountTool account];
            if (account) {
                account.isLogIn = [NSNumber numberWithBool:NO];
                [YDAccountTool save:account];
            }
            if (self.failureBlock) {
                self.failureBlock([responseObject valueForKey:@"msg"]);
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        YDLog(@"%@",error);
        YDaccount *account = [YDAccountTool account];
        if (account) {
            account.isLogIn = [NSNumber numberWithBool:NO];
            [YDAccountTool save:account];
        }
        if(self.errorBlock){
            self.errorBlock(error);
        }
    }];
}

/** 修改用户密码*/
- (void)modifyUserPasswordUserName:(NSString *)userName password:(NSString *)password{
    //NSString *password_MD5 = [password md5];
    NSDictionary *param = @{@"user_name":userName ,
                            @"password":password};
    appUrlInterface *url = [appUrlInterface urlInterface];
    [WBHttpTool get:url.modifyPassword params:param success:^(id responseObject) {
        
        int registerResult = [responseObject[@"success"] intValue];
        if (registerResult == resultSuccess) { // 判断是否登录成功
            if (self.successBlock) {
                self.successBlock(nil);
            }
        }
        else{
            if (self.failureBlock) {
                self.failureBlock([responseObject valueForKey:@"msg"]);
            }
        }
    } failure:^(NSError *error) {
        YDLog(@"%@",error);
        if(self.errorBlock){
            self.errorBlock(error);
        }
    }];
}


/** 获取自己的详细资料*/
- (void)getLoginUserInfoFromServer{
    appUrlInterface *url = [appUrlInterface urlInterface];
    [WBHttpTool get:url.getUserDetailInfo params:nil success:^(id responseObject) {
        int loginResult = [responseObject[@"success"] intValue];
        if (loginResult == resultSuccess) {
            YDaccount *user = [YDaccount accountWithDict:responseObject[@"user"]];
            [[God manager] setThisGuy:user];
            [[God manager] setIsLogIn:YES];
            if (self.successBlock) {
                self.successBlock(nil);
            }
        }
        else{
            if (self.failureBlock) {
                self.failureBlock([responseObject valueForKey:@"msg"]);
            }
        }
    } failure:^(NSError *error) {
        if(self.errorBlock){
            self.errorBlock(error);
        }
    }];
}

/** 通过user_id查询用户详细资料*/
- (void)getUserDetailInfoByUserId{
    appUrlInterface *url = [appUrlInterface urlInterface];
    [WBHttpTool get:url.getUserDetailInfo params:nil success:^(id responseObject) {
        int loginResult = [responseObject[@"success"] intValue];
        if (loginResult == resultSuccess) {
            NSDictionary *userDict = [responseObject valueForKey:@"user"];
            YDaccount *user     = [YDaccount accountWithDict:userDict];
            YDaccount *account  = [YDAccountTool account];
            account.introduce   = user.introduce;
            account.card_url    = user.card_url;
            account.sex         = user.sex;
            account.school      = user.school;
            [YDAccountTool save:account];
            if (self.successBlock) {
                self.successBlock(nil);
            }
        }else{
            if (self.failureBlock) {
                self.failureBlock(nil);
            }
        }
    } failure:^(NSError *error) {
        if(self.errorBlock){
            self.errorBlock(error);
        }
        YDLog(@"%@",error);
    }];

}

/** 通过user_name查询用户详细资料*/
- (void)getUserDetailInfoByUserName:(NSString *)userName{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:userName forKey:@"user_name"];
    appUrlInterface *url = [appUrlInterface urlInterface];
    [WBHttpTool get:url.getUserDetailInfoByUserName params:dict success:^(id responseObject) {
        YDLog(@"%@",responseObject);
        int success = [[responseObject valueForKey:@"success"] intValue];
        if (success == resultSuccess) {
            NSDictionary *userDict = [responseObject valueForKey:@"user"];
            YDaccount *account = [YDaccount accountWithDict:userDict];
            if(self.successBlock){
                self.successBlock(account);
            }
        }
        else{
            if (self.failureBlock) {
                self.failureBlock([responseObject valueForKey:@"msg"]);
            }
        }
    } failure:^(NSError *error) {
        if(self.errorBlock){
            self.errorBlock(error);
        }
        YDLog(@"%@",error);
    }];

}
/** 修改用户资料*/
- (void)modifyUserInfoWithUserName:(NSString *)userName userInfoDict:(NSDictionary *)infoDict{
    appUrlInterface *url = [appUrlInterface urlInterface];
    [WBHttpTool put:url.putModifyProfile params:infoDict success:^(id responseObject) {
        YDLog(@"%@",responseObject);
        int success = [[responseObject valueForKey:@"success"] intValue];
        // 更新服务器用户资料成功
        if (success == resultSuccess) {
            if (self.successBlock) {
                self.successBlock(nil);
            }
        }
        else{
            if (self.failureBlock) {
                self.failureBlock(nil);
            }
        }
    } failure:^(NSError *error) {
        if(self.errorBlock){
            self.errorBlock(error);
        }
        YDLog(@"%@",error);
    }];

}


- (void)modifyUserImage:(UIImage *)image imageType:(uploadImageType)imageType{
    
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    
    BOOL isPortrait = imageType == uploadImageTypePortrait ? YES :NO;
    NSString *url = isPortrait ? self.url.portraitUrl : self.url.carImageUrl;
    NSString *imageName = isPortrait ? @"orginal_portrait" : @"card_pic";
    
    
    [self.manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileData:data name:imageName fileName:@".jpg" mimeType:@"image/jpeg"];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        int success = [[responseObject valueForKey:@"success"] intValue];
        // 上传图片成功,提交表单
//        if (success == resultSuccess) {
        
            // 更新用户资料
            NSString *keyName = isPortrait ? @"orginal_portrait" : @"card_pic";
            NSString *imageUrl = [responseObject valueForKey:keyName];
            [self updateImageToSever:imageUrl imageType:imageType];
//        }
//        else{
//            if (self.failureBlock) {
//                self.failureBlock(nil);
//            }
//        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(self.errorBlock){
            self.errorBlock(error);
        }
    }];
}

/** 更新内容到服务器*/
- (void)updateImageToSever:(NSString *)imageUrl imageType:(uploadImageType)imageType
{
    if (imageUrl.length==0) {
        return;
    }
    YDaccount *account = [YDAccountTool account];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setValue:account.user_id forKey:@"user_id"];
    // 更新头像
    if (imageType == uploadImageTypePortrait) {
        [param setValue:imageUrl forKey:@"portrait"];
    }
    // 更新名片
    else if (imageType == uploadImageTypeCard) {
        [param setValue:imageUrl forKey:@"card_pic"];
    }
    
    [WBHttpTool put:self.url.putModifyProfile params:param success:^(id responseObject) {
        int success = [[responseObject valueForKey:@"success"] intValue];
        // 更新服务器用户资料成功
        if (success == resultSuccess) {
            if (self.successBlock) {
                self.successBlock(imageUrl);
            }
        }
        else{
            if (self.failureBlock) {
                self.failureBlock(nil);
            }
        }
    } failure:^(NSError *error) {
        if(self.errorBlock){
            self.errorBlock(error);
        }
    }];
}

#pragma private
/** 处理用户信息*/
- (void)setUserInfoWith:(AFHTTPRequestOperation *)operation userDict:(id)responseObject password:(NSString *)password
{
    // 取出header的set－cookie
    NSString * setCookie = [[operation.response allHeaderFields] valueForKey:@"Set-Cookie"];
    // 保存用户信息
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithDictionary:responseObject[@"userInfo"]];
    [userInfo setValue:setCookie forKey:@"sessionID"];
    [userInfo setValue:password forKey:@"password"];
    
    //字典转成模型
    YDaccount *user = [YDaccount accountWithDict:userInfo];
    [[God manager] setThisGuy:user];
    [[God manager] setPassword:password];
    [[God manager] setIsLogIn:YES];
}
    
- (AFHTTPRequestOperationManager *)manager
{
    if (_manager == nil) {
        YDaccount *account = [YDAccountTool account];
        _manager = [AFHTTPRequestOperationManager manager];
        _manager.requestSerializer.timeoutInterval = 10;
        [_manager.requestSerializer setValue:@"multipart/form-data" forHTTPHeaderField:@"Content-Type"];
        [_manager.requestSerializer setValue:account.sessionID forHTTPHeaderField:@"Set-Cookie"];
    }
    return _manager;
}

- (appUrlInterface *)url{
    if (_url == nil) {
        _url = [appUrlInterface urlInterface];
    }
    return _url;
}
@end
