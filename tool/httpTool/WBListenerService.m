//
//  WBListenerService.m
//  风聆
//
//  Created by Macbook Air on 16/3/21.
//  Copyright © 2016年 Macbook Air. All rights reserved.
//

#import "WBListenerService.h"
#import "dictionaryCache.h"
#import "WBListenerViewFrame.h"
#import "WBGeneralCommentModel.h"
#import "WBMyCommentViewFrame.h"
#import "CacheTool.h"

@implementation WBListenerService{
    dispatch_queue_t listenerQueue;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        listenerQueue = dispatch_queue_create("listenerQueue", DISPATCH_QUEUE_PRIORITY_DEFAULT);
    }
    return self;
}

/** 获取所有聆听者列表*/
- (void)getAllListenerList{
}


/** 获取在线聆听者列表*/
- (void)getOnlineListenr{
    YDLog(@"getOnlineListener");
    NSString* cacheKey=@"onlineListener";
    NSDictionary* onlineListener=[CacheTool dictionaryWithCacheForKey:cacheKey];
    if (onlineListener.count>0) {
        NSMutableArray *array = [NSMutableArray array];
        NSArray *listenerDictArr = onlineListener[@"listenerDetails"];
        for (NSDictionary *dict in listenerDictArr) {
            WBListenerViewFrame *frame = [[WBListenerViewFrame alloc] init];
            frame.listener = [[WBListenerModel alloc] initWithListenerDict:dict];
            [array addObject:frame];
        }
        // 刷新UI
        [UIView animateWithDuration:0.01 animations:^{
            
        } completion:^(BOOL finished) {
            if(self.successBlock){
                self.successBlock(array);
            }
        }];
        
    }
    appUrlInterface *url = [appUrlInterface urlInterface];
    [WBHttpTool get:url.getListenerListOnline params:nil success:^(id responseObject) {
//        YDLog(@"%@",responseObject);
        int success = [[responseObject valueForKey:@"success"] intValue];
        if (success == resultSuccess) {
                // 数据操作
                // 1.将获得的数据保存到listInfo中
                NSMutableArray *array = [NSMutableArray array];
                NSArray *listenerDictArr = responseObject[@"listenerDetails"];
                for (NSDictionary *dict in listenerDictArr) {
                    
                    WBListenerViewFrame *frame = [[WBListenerViewFrame alloc] init];
                    frame.listener = [[WBListenerModel alloc] initWithListenerDict:dict];
                    [array addObject:frame];
                }
                    // 刷新UI
                    if(self.successBlock){
                    self.successBlock(array);
                    }
            if (array.count!=0) {
                [CacheTool saveCacheWithDictionary:responseObject forKey:cacheKey];
            }
        }
        else{
            if (self.failureBlock) {
                if (!onlineListener.count>0) {
                    self.failureBlock([responseObject valueForKey:@"msg"]);
                }
            }
        }
    } failure:^(NSError *error) {
        YDLog(@"%@",error);
        if (self.errorBlock) {
            if (!onlineListener.count>0) {
                self.errorBlock(error);
            }
        }
    }];
}

/** 通过user_name获取某个聆听者的资料*/
- (void)getListenerInfoWithUserName:(NSString *)userName{
    NSDictionary *param = @{@"user_name" : userName};
    appUrlInterface *url = [[appUrlInterface alloc] init];
    [WBHttpTool get:url.getListenerInfoByUserNameWithUserId params:param success:^(id responseObject) {
//        YDLog(@"%@",responseObject);
        int success = [[responseObject valueForKey:@"success"] intValue];
        if (success == resultSuccess) {
            NSDictionary *listenerDict = [responseObject valueForKey:@"listenerDetail"];
           WBListenerModel *listener = [[WBListenerModel alloc] initWithListenerDict:listenerDict];
            if (self.successBlock) {
                self.successBlock(listener);
            }
        }
        else{
            if (self.failureBlock) {
                self.failureBlock([responseObject valueForKey:@"msg"]);
            }
        }
    } failure:^(NSError *error) {
        YDLog(@"%@",error);
        if (self.errorBlock) {
            self.errorBlock(error);
        }
    }];
}

/** 评价聆听者*/
- (void)evaluateListenerWithEvaluateParam:(NSDictionary *)evaluateParam{
    appUrlInterface *url = [appUrlInterface urlInterface];
    [WBHttpTool post:url.postEvaluations params:evaluateParam success:^(id responseObject) {
        YDLog(@"%@",responseObject);
        int success = [[responseObject valueForKey:@"success"] intValue];
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
        YDLog(@"%@",error);
        if (self.errorBlock) {
            self.errorBlock(error);
        }
    }];
}

/** 获取聆听者所有评论*/
- (void)getAllCommentOfListenerWithListenerId:(NSString *)listenerID{
    appUrlInterface *url = [[appUrlInterface alloc] initWithListenerId:listenerID];
    [WBHttpTool get:url.getEvaluations params:nil success:^(id responseObject) {
        YDLog(@"%@",responseObject);
        int loginResult = [responseObject[@"success"] intValue];
        if (loginResult == resultSuccess) {
                // 计算顶部
                WBGeneralCommentModel *generalComment = [[WBGeneralCommentModel alloc] initWithCommentDict:responseObject];
            
                // 取出群评论的字典数组
                NSMutableArray *array = [NSMutableArray array];
                NSArray *commentDictArray = [responseObject valueForKey:@"dataList"];
                for (NSDictionary *commentDic in commentDictArray) {
                    WBCommentModel *comment = [[WBCommentModel alloc] initWithCommentDitcionary:commentDic];
                    WBMyCommentViewFrame *frame = [[WBMyCommentViewFrame alloc] init];
                    frame.commentModel = comment;
                    [array addObject:frame];
                }
                NSDictionary *dict = @{@"generalCommentModel" : generalComment,
                                       @"commentModelFrameArray" : array};
                    // 更新UI
                    if (self.successBlock) {
                        self.successBlock(dict);
                    }
                }
        else{
            if (self.failureBlock) {
                self.failureBlock([responseObject valueForKey:@"msg"]);
            }
        }
    } failure:^(NSError *error) {
        YDLog(@"%@",error);
        if (self.errorBlock) {
            self.errorBlock(error);
        }
    }];
}

/** 收藏和点赞接口*/
- (void)attenteOrAttitudeToListenerWithParam:(NSDictionary *)param{
    appUrlInterface *url = [appUrlInterface urlInterface];
    [WBHttpTool put:url.putAttitudeAndAttention params:param success:^(id responseObject){
        int success = [[responseObject valueForKey:@"success"] intValue];
        if (success == resultSuccess) {
            if (self.successBlock) {
                self.successBlock(nil);
            }
        }else{
            if (self.failureBlock) {
                self.failureBlock(nil);
            }
        }
    } failure:^(NSError *error) {
        YDLog(@"%@",error);
        if (self.errorBlock) {
            self.errorBlock(nil);
        }
    }];
}
/** 申请成为聆听者*/
- (void)applyBecomeListenerWithApplyParam:(NSDictionary *)ApplyParam{
    appUrlInterface *url = [appUrlInterface urlInterface];
    [WBHttpTool post:url.postApplys params:ApplyParam success:^(id responseObject) {
        YDLog(@"%@",responseObject);int success = [[responseObject valueForKey:@"success"] intValue];
        if (success == resultSuccess) {
            if (self.successBlock) {
                self.successBlock(nil);
            }
        }else{
            if (self.failureBlock) {
                self.failureBlock(nil);
            }
        }
    } failure:^(NSError *error) {
        if (self.errorBlock) {
            self.errorBlock(error);
        }
    }];
}
@end
