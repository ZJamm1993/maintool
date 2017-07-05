//
//  WBHttpTool.h
//  橙子
//
//  Created by Macbook Air on 15/11/13.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "appUrlInterface.h"
#import "AFNetworking.h"

typedef void(^successBlock)(id returnValue);
typedef void(^failureBlock)(id object);
typedef void(^errorBlock)(NSError *error);

@class AFHTTPRequestOperation;
@interface WBHttpTool : NSObject

+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (void)put:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (void)Delete:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (instancetype)service;
/** 获取数据成功的回调block*/
@property (nonatomic, strong) successBlock successBlock;
/** 获取数据失败的回调block*/
@property (nonatomic, strong) failureBlock failureBlock;
/** 访问网络失败的回调block*/
@property (nonatomic, strong) errorBlock errorBlock;

- (void)setSuccessBlock:(successBlock)successBlock failureBlock:(failureBlock)failureBlock errorBlock:(errorBlock)errorBlock;
@end
