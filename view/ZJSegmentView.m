//
//  ZJSegmentView.m
//  风聆
//
//  Created by Jamm on 16/11/13.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import "ZJSegmentView.h"

@implementation ZJSegmentView

{
    UIView* line;
}

-(void)setSelectedItem:(NSInteger)selectedItem
{
    _selectedItem=selectedItem;
    if (selectedItem<0||selectedItem>=_titles.count) {
        _selectedItem=0;
    }
    if (_titles.count==0) {
        line.x=0;
    }
    else
    {
        CGFloat ww=self.width/_titles.count;
        line.centerX=_selectedItem*ww+ww/2;
        for (UIView* vi in self.subviews) {
            if ([vi isKindOfClass:[UIButton class]]) {
                UIButton* b=(UIButton*)vi;
                if (b.tag==_selectedItem) {
                    b.selected=YES;
                }
                else
                {
                    b.selected=NO;
                }
            }
        }
    }
}

-(void)setTitles:(NSArray *)titles
{
    [self removeAllSubviews];
    
    _titles=[NSArray arrayWithArray:titles];
    if (_titles.count<=0) {
        return;
    }
    if (line==nil) {
        line=[[UIView alloc]init];
        line.backgroundColor=color_main_app;
        line.layer.cornerRadius=1.5;
        line.height=3;
    }
    line.x=0;
    line.y=self.height-line.height;
    line.width=self.width/_titles.count;
    if (line.width>100) {
        line.width=100;
    }
    [self addSubview:line];
    
    CGFloat ww=self.width/titles.count;
    
    for (int i=0; i<_titles.count; i++) {
        NSString* ti=[_titles objectAtIndex:i];
        UIButton* btn=[[UIButton alloc]initWithFrame:CGRectMake(i*ww, 0, ww, self.height)];
        [btn setTitle:ti forState:UIControlStateNormal];
        if (_font==nil) {
            _font=font(18);
        }
        if (_textColor==nil) {
            _textColor=gray_51;
        }
        [btn setTitleColor:_textColor forState:UIControlStateNormal];
        [btn setTitleColor:color_main_app forState:UIControlStateSelected];
        [btn.titleLabel setFont:self.font];
        [btn addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=i;
        [self addSubview:btn];
    }
    
    self.selectedItem=0;
}

-(void)buttonSelected:(UIButton*)btn
{
    if ([btn isKindOfClass:[UIButton class]]) {
        self.selectedItem=btn.tag;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

-(void)setFont:(UIFont *)font
{
    _font=font;
    for (UIView* vi in self.subviews) {
        if ([vi isKindOfClass:[UIButton class]]) {
            UIButton* b=(UIButton*)vi;
            b.titleLabel.font=font;
        }
    }
}

-(void)setTextColor:(UIColor *)textColor
{
    _textColor=textColor;
    for (UIView* vi in self.subviews) {
        if ([vi isKindOfClass:[UIButton class]]) {
            UIButton* b=(UIButton*)vi;
            [b setTitleColor:textColor forState:UIControlStateNormal];
        }
    }
}

@end
