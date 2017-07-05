//
//  WBTextView.m
//  风聆
//
//  Created by iMac206 on 15/12/21.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import "WBTextView.h"
#import "Masonry.h"

@implementation WBTextView
{
    UITextView* placeholderTextView;
    UITextView* mainTextView;
}
-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        placeholderTextView=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        placeholderTextView.textColor=[UIColor colorWithWhite:205.0/255 alpha:1];
        placeholderTextView.backgroundColor=[UIColor clearColor];
        mainTextView=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        mainTextView.backgroundColor=[UIColor clearColor];
        mainTextView.delegate=self;
        [self addSubview:placeholderTextView];
        [self addSubview:mainTextView];
        
        [placeholderTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self);
        }];
        
        [mainTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self);
        }];
    }
    return self;
}
//
//-(void)setFrame:(CGRect)frame
//{
//    CGRect fra=frame;
//    fra.origin=CGPointMake(0, 0);
//    placeholderTextView.frame=fra;
//    mainTextView.frame=fra;
//    [super setFrame:frame];
//}

-(void)setPlaceholder:(NSString *)placeholder
{
    placeholderTextView.text=placeholder;
}

-(void)setText:(NSString *)text
{
    mainTextView.text=text;
}

-(NSString*)text
{
    return mainTextView.text;
}

-(void)setTextColor:(UIColor *)textColor
{
    mainTextView.textColor=textColor;
}

-(void)setFont:(UIFont *)font
{
    mainTextView.font=font;
    placeholderTextView.font=font;
}

-(BOOL)becomeFirstResponder
{
    return [mainTextView becomeFirstResponder];
}

-(BOOL)resignFirstResponder
{
    return [mainTextView resignFirstResponder];
}

#pragma mark textView delegate
-(void)textViewDidChange:(UITextView *)textView
{
    placeholderTextView.hidden=![textView.text isEqualToString:@""];
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(textViewWillBeginEditing:)]) {
        [self.delegate textViewWillBeginEditing:textView];
    }
    return YES;
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(textViewWillEndEditing:)])
    {
        [self.delegate textViewWillEndEditing:textView];
    }
    return YES;
}

@end
