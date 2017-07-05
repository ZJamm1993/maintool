//
//  MySearchBar.m
//  风聆
//
//  Created by iMac206 on 16/11/23.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import "MySearchBar.h"

@interface MySearchBar()<UITextFieldDelegate>

@end

@implementation MySearchBar
{
    UITextField* searchField;
    UIButton* cancelButton;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    frame.size.height=28;
    self=[super initWithFrame:frame];
    if (self) {
        searchField=[[UITextField alloc]initWithFrame:self.bounds];
        searchField.textAlignment=_textAlignment;
        searchField.placeholder=_placeholder;
        UIImageView* sea=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 28, 32)];
        sea.image=[UIImage imageNamed:@"search"];
        sea.contentMode=UIViewContentModeCenter;
        searchField.leftView=sea;
        searchField.leftViewMode=UITextFieldViewModeAlways;
        
        UIImageView* sea2=[[UIImageView alloc]initWithFrame:sea.bounds];
        searchField.rightView=sea2;
        searchField.rightViewMode=UITextFieldViewModeUnlessEditing;
        
        searchField.clearButtonMode=UITextFieldViewModeAlways;
        searchField.layer.cornerRadius=14;
        searchField.layer.borderWidth=0.5;
        searchField.layer.borderColor=gray(200).CGColor;
        searchField.delegate=self;
        searchField.returnKeyType=UIReturnKeySearch;
        searchField.font=font(13);
        searchField.textAlignment=NSTextAlignmentCenter;
        [self addSubview:searchField];
//        UISearchBar
        
        cancelButton=[[UIButton alloc]initWithFrame:CGRectMake(frame.size.width-60, 0, 60, 28)];
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButton setTitleColor:green_color forState:UIControlStateNormal];
        [cancelButton setTitleColor:green_high_color forState:UIControlStateHighlighted];
        [cancelButton setTitleColor:gray_153 forState:UIControlStateDisabled];
        [cancelButton addTarget:self action:@selector(cancelSearch) forControlEvents:UIControlEventTouchUpInside];
        cancelButton.alpha=0;
        [self addSubview:cancelButton];
    }
    return self;
}

-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder=placeholder;
    searchField.placeholder=placeholder;
}

-(void)setTextAlignment:(NSTextAlignment)textAlignment
{
    _textAlignment=textAlignment;
    searchField.textAlignment=textAlignment;
}

-(NSString*)text
{
    return searchField.text;
}

-(BOOL)becomeFirstResponder
{
    return [searchField becomeFirstResponder];
}

-(void)cancelSearch
{
    [searchField resignFirstResponder];
    if ([self.delegate respondsToSelector:@selector(searchBarCancelButtonClicked:)]) {
        [self.delegate searchBarCancelButtonClicked:self];
    }
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    BOOL isDe=[self.delegate respondsToSelector:@selector(searchBarShouldBeginEditing:)];
    if (isDe) {
        return [self.delegate searchBarShouldBeginEditing:self];
    }
    else
    {
        return YES;
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
//    cancelButton.enabled=YES;
    [UIView animateWithDuration:0.25 animations:^{
        textField.rightView=nil;
        textField.rightViewMode=UITextFieldViewModeNever;
        textField.textAlignment=NSTextAlignmentLeft;
        textField.width=self.frame.size.width-60;
        cancelButton.alpha=1;
    }];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
//    cancelButton.enabled=NO;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([self.delegate respondsToSelector:@selector(searchBarSearchButtonClicked:)]) {
        [self.delegate searchBarSearchButtonClicked:self];
    }
    [textField resignFirstResponder];
    return YES;
}

@end
