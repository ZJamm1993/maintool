//
//  ColumnsView.m
//  风聆
//
//  Created by iMac206 on 16/12/5.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import "ColumnsView.h"

#define btn_w 36
#define col_w 22

#define normal_color gray(230)
#define normal_textColor gray_153
#define seleted_color color_main_app
#define high_color color_Highlighted_app

@interface ColumnsView()
@property (nonatomic,strong) UIScrollView* scrollView;
@end

@implementation ColumnsView

-(void)setTitles:(NSArray*)titles
{
    _titles=[NSArray arrayWithArray:titles];
//    [self showColumns];
}

-(void)setValues:(NSArray*)values
{
    _values=[NSArray arrayWithArray:values];
    [self showColumns];
}

-(void)showColumns
{
//    if (_titles.count!=_values.count) {
//        return;
//    }
//    if(_titles.count<_values.count)
//    {
//        return;
//    }
//    if (!(_titles.count>0&&_values.count>0&&_values.count<=_titles.count)) {
//        return;
//    }
    NSInteger minCount=_values.count<_titles.count?_values.count:_titles.count;
    
    self.scrollView.frame=self.bounds;
    [self.scrollView removeAllSubviews];
    double maxValue=0;
    NSMutableArray* newValues=[NSMutableArray array];
    for (int i=0; i<minCount; i++) {
        NSNumber* number=[_values objectAtIndex:i];
        double curreValue=(double)number.integerValue;
        if (curreValue>0) {
            curreValue=sqrt(curreValue);
        }
        [newValues addObject:[NSNumber numberWithDouble:curreValue]];
        if (curreValue>maxValue) {
            maxValue=curreValue;
        }
    }
    for (int i=0; i<_values.count; i++) {
        NSString* title=[_titles objectAtIndex:i];
        NSNumber* value=[newValues objectAtIndex:i];
        CGFloat percent=maxValue>0?value.doubleValue/maxValue:(maxValue==0?0:-1);
        SingleColumns* clm=[[SingleColumns alloc]initWithFrame:CGRectMake(btn_w*i, 0, btn_w, self.height)];
        clm.title=title;
        clm.value=percent;
        clm.enabled=self.enabled;
        clm.tag=i;
        [clm addTarget:self action:@selector(columnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:clm];
        self.scrollView.contentSize=CGSizeMake(clm.maxX<=self.scrollView.width?self.scrollView.width+1:clm.maxX+1, self.height);
    }
}

-(void)columnClick:(SingleColumns*)colm
{
    BOOL selected=colm.selected;
    if (_enabled==NO) {
        return;
    }
    if (colm.value<0||isnan(colm.value)) {
        return;
    }
    for (SingleColumns* coo in self.scrollView.subviews) {
        coo.selected=NO;
    }
    NSInteger tag=colm.tag;
    if (selected) {
        tag=-1;
    }
    colm.selected=!selected;
    if (self.selectedBlock) {
        self.selectedBlock(tag);
    }
}

-(void)setEnabled:(BOOL)enabled
{
    _enabled=enabled;
    for (SingleColumns* coo in self.scrollView.subviews) {
        coo.enabled=enabled;
    }
}

-(UIScrollView*)scrollView
{
    if (_scrollView==nil) {
        _scrollView=[[UIScrollView alloc]initWithFrame:self.bounds];
        _scrollView.showsHorizontalScrollIndicator=NO;
        _scrollView.showsVerticalScrollIndicator=NO;
        _scrollView.scrollsToTop=NO;
        [self addSubview:_scrollView];
    }
    return _scrollView;
}

@end

@interface SingleColumns()
@property (nonatomic,strong) UIView* column;
@property (nonatomic,strong) UILabel* titleLab;
@property (nonatomic,strong) UIImageView* nothing;
@end

@implementation SingleColumns

-(void)setSelected:(BOOL)selected
{
    if (self.value<0||isnan(self.value)) {
        return;
    }
    [super setSelected:selected];
    if (selected) {
        self.titleLab.textColor=seleted_color;
        self.column.backgroundColor=seleted_color;
    }
    else
    {
        self.titleLab.textColor=normal_textColor;
        self.column.backgroundColor=normal_color;
    }
}

-(void)setHighlighted:(BOOL)highlighted
{
    if (self.value<0||isnan(self.value)) {
        return;
    }
    [super setHighlighted:highlighted];
    if (highlighted) {
        self.titleLab.textColor=high_color;
        self.column.backgroundColor=high_color;
    }
    else
    {
        self.selected=self.selected;
    }
}

-(UILabel*)titleLab
{
    if (_titleLab==nil) {
        _titleLab=[[UILabel alloc]init];
        _titleLab.textColor=normal_textColor;
        _titleLab.font=font(11);
        _titleLab.textAlignment=NSTextAlignmentCenter;
        _titleLab.userInteractionEnabled=NO;
        [self addSubview:_titleLab];
    }
    return _titleLab;
}

-(void)setTitle:(NSString *)title
{
    _title=title;
    self.titleLab.text=title;
    self.titleLab.frame=CGRectMake(0, self.height-col_w, btn_w, col_w);
    self.selected=NO;
}

-(UIView*)column
{
    if (_column==nil) {
        _column=[[UIView alloc]init];
        _column.layer.cornerRadius=4;
        _column.clipsToBounds=YES;
        _column.backgroundColor=normal_color;
        _column.userInteractionEnabled=NO;
        [self addSubview:_column];
    }
    return _column;
}

-(UIImageView*)nothing
{
    if (_nothing==nil) {
        _nothing=[[UIImageView alloc]init];
        _nothing.userInteractionEnabled=NO;
        _nothing.image=[UIImage imageNamed:@"no_record"];
        _nothing.alpha=0.3;
        [self addSubview:_nothing];
    }
    return _nothing;
}

-(void)setValue:(CGFloat)value
{
    if (value>1) {
        value=1;
    }
    else if(isnan(value))
    {
        value=-1;
    }
    _value=value;
    
    self.column.hidden=value<0||isnan(value);
    self.nothing.hidden=!self.column.hidden;
    
    CGFloat y=8;
    CGFloat x=(btn_w-col_w)/2;
    CGFloat hee=self.titleLab.y-y-y;
    CGFloat finial_h=(hee-y)*value;

    self.column.frame=CGRectMake(x, self.titleLab.y-y, col_w, y);
    self.nothing.frame=self.column.frame;
    [UIView animateWithDuration:0.25 animations:^{
        if (!isnan(finial_h)) {
            self.column.frame=CGRectMake(x, self.titleLab.y-y-finial_h, col_w, finial_h+y);
        }
        self.nothing.frame=CGRectMake(x,y+y,col_w,hee);
    }];
    self.selected=NO;
    
//    self.enabled=value>=0;
}

@end
