//
//  HNMessageTextView.h
//  风聆
//
//  Created by Macbook Air on 16/1/10.
//  Copyright © 2016年 Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HNMessageTextView : UITextView

/** 提示文字*/
@property (nonatomic, strong) NSString *placeHolder;

/** 提示文字的颜色*/
@property (nonatomic, strong) UIColor *placeHolderTextColor;

@end
