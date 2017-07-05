//
//  WBAlertAction.m
//  风聆
//
//  Created by Jamm on 16/4/6.
//  Copyright © 2016年 Macbook Air. All rights reserved.
//

#import "WBAlertAction.h"

@implementation WBAlertAction
+ (instancetype)actionWithTitle:( NSString *)title style:(UIAlertActionStyle)style handler:(void (^ )(UIAlertAction *action))handler
{
    WBAlertAction* action=[super actionWithTitle:title style:style handler:handler];
//    if(IOS_9){
//        [action setValue:color_main_app forKey:@"_titleTextColor"];
//        if (style == UIAlertActionStyleCancel) {
//            [action setValue:color_153 forKey:@"_titleTextColor"];
//        }
//    }
//    
    return action;
}
@end

