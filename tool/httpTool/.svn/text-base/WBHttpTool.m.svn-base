//
//  WBHttpTool.m
//  橙子
//
//  Created by Macbook Air on 15/11/13.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import "WBHttpTool.h"

@implementation WBHttpTool

+ (AFHTTPRequestOperationManager*)manager
{
    YDaccount *account = [YDAccountTool account];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 18;
    [manager.requestSerializer setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    if (account) {// 如果用户存在，则必然登录过
        [manager.requestSerializer setValue:account.sessionID forHTTPHeaderField:@"Set-Cookie"];
        NSString* iosName=[[UIDevice currentDevice]systemName];
        NSString* iosVersion=[[UIDevice currentDevice]systemVersion];
        NSString* appVersion=[[[NSBundle mainBundle]infoDictionary]valueForKey:@"CFBundleShortVersionString"];
        NSString* versionHeader=[NSString stringWithFormat:@"device:%@ %@ app:%@",iosName,iosVersion,appVersion];
        [manager.requestSerializer setValue:versionHeader forHTTPHeaderField:@"Version"];
    }
    return manager;
}

+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager* manager=[WBHttpTool manager];
    
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager* manager=[WBHttpTool manager];
    
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)Delete:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager* manager=[WBHttpTool manager];
    
    [manager DELETE:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)put:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager* manager=[WBHttpTool manager];
    
    [manager PUT:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (instancetype)service{
    return [[self alloc] init];
}

- (void)setSuccessBlock:(successBlock)successBlock failureBlock:(failureBlock)failureBlock errorBlock:(errorBlock)errorBlock{
    self.successBlock = successBlock;
    self.failureBlock = failureBlock;
    self.errorBlock = errorBlock;
}
@end
