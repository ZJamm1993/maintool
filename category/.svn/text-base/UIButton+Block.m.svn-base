//
//  UIButton+UIButton_Block.m
//  ZJDropMenu
//
//  Created by Jamm on 16/4/20.
//  Copyright © 2016年 Jamm. All rights reserved.
//

#import "UIButton+Block.h"

@implementation UIButton(Block)

static char overviewKey;

@dynamic event;

-(void)addAction:(ActionBlock)action forControlEvents:(UIControlEvents)controlEvents
{
    [self handleControlEvent:controlEvents withBlock:action];
}

- (void)handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)block {
    objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}


- (void)callActionBlock:(id)sender {
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(self, &overviewKey);
    if (block) {
        block();
    }
}


@end
