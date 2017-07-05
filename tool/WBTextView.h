//
//  WBTextView.h
//  风聆
//
//  Created by iMac206 on 15/12/21.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBTextView;
@protocol WBTextViewDelegete <NSObject>
@optional
-(void)textViewWillBeginEditing:(UITextView*)tv;
-(void)textViewWillEndEditing:(UITextView *)tv;
@end

@interface WBTextView : UIView<UITextViewDelegate>

@property (nonatomic)NSString* text;
@property (nonatomic)UIColor* textColor;
@property (nonatomic)NSString* placeholder;
@property (nonatomic)UIFont* font;
@property (nonatomic,weak)id<WBTextViewDelegete>delegate;

@end
