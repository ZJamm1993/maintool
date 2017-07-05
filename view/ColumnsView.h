//
//  ColumnsView.h
//  风聆
//
//  Created by iMac206 on 16/12/5.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColumnsView : UIView

@property (nonatomic,strong) NSArray* titles;

@property (nonatomic,strong) NSArray* values;

@property (nonatomic,assign) BOOL enabled;

@property (nonatomic,strong) void(^selectedBlock)(NSInteger selectedItem);

@end

@interface SingleColumns : UIControl

@property (nonatomic,assign) CGFloat value;
@property (nonatomic,strong) NSString* title;

@end
