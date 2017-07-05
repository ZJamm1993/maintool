//
//  HISegmentedControl.h
//  singleTest
//
//  Created by Macbook Air on 16/4/05.
//  Copyright © 2016年 iMac206. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HISegmentedControl : UIView

/** HISegmentedControl的颜色*/
@property (nonatomic, strong) UIColor *segmentedColor;

/** HISegmentedControl的高亮颜色*/
@property (nonatomic, strong) UIColor *segmentedHightedColor;

/** 被选中的segment*/
@property (nonatomic, assign) NSUInteger selectedSegmentIndex;

/** 是否显示右上角小红点*/
@property (nonatomic, assign) BOOL showTag;

/** 事件监听的block*/
@property (nonatomic, strong) void(^segmentedBlock)(id object);

/** 插入按钮*/
- (void)insertSegmentWithTitle:(NSString *)title atIndex:(NSUInteger)index;

/** 显示tagView*/
- (void)showTagView:(BOOL)isShow index:(NSUInteger)index;
@end
