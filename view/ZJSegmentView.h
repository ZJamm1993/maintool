//
//  ZJSegmentView.h
//  风聆
//
//  Created by Jamm on 16/11/13.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJSegmentView : UIControl

@property (nonatomic,strong) NSArray* titles;
@property (nonatomic,assign) NSInteger selectedItem;
@property (nonatomic) UIFont* font;
@property (nonatomic) UIColor* textColor;

@end
