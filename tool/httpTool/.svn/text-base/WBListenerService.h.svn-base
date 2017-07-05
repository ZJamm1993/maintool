//
//  WBListenerService.h
//  风聆
//
//  Created by Macbook Air on 16/3/21.
//  Copyright © 2016年 Macbook Air. All rights reserved.
//

#import "WBHttpTool.h"

@interface WBListenerService : WBHttpTool
/** 获取所有聆听者列表*/
- (void)getAllListenerList;
/** 获取在线聆听者列表*/
- (void)getOnlineListenr;
/** 通过user_name获取某个聆听者的资料*/
- (void)getListenerInfoWithUserName:(NSString *)userName;
/** 评价聆听者*/
- (void)evaluateListenerWithEvaluateParam:(NSDictionary *)evaluateParam;
/** 获取聆听者所有评论*/
- (void)getAllCommentOfListenerWithListenerId:(NSString *)listenerID;
/** 收藏和点赞接口*/
- (void)attenteOrAttitudeToListenerWithParam:(NSDictionary *)param;
/** 申请成为聆听者*/
- (void)applyBecomeListenerWithApplyParam:(NSDictionary *)ApplyParam;
@end

#pragma mark - 聆听者相关
