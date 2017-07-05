//
//  UIButton+UIButton_Block.h
//  ZJDropMenu
//
//  Created by Jamm on 16/4/20.
//  Copyright © 2016年 Jamm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
typedef void (^ActionBlock)();
@interface UIButton (Block)
@property (readonly) NSMutableDictionary *event;
- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;
-(void)addAction:(ActionBlock)action forControlEvents:(UIControlEvents)controlEvents;
@end