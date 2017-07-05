//
//  UIView+Extension.m
//  01-黑酷
//
//  Created by apple on 14-6-27.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "UIView+Extension.h"

#define CORNER_IMG_TAG -987987

@implementation UIView (Extension)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setMaxX:(CGFloat)maxX
{
    CGRect rect = self.frame;
    rect.origin.x = maxX;
    self.frame = rect;
}

-(CGFloat)maxX
{
    return CGRectGetMaxX(self.frame);
}

- (void)setMaxY:(CGFloat)maxY
{
    CGRect rect = self.frame;
    rect.origin.x = maxY;
    self.frame = rect;
}

-(CGFloat)maxY
{
    return CGRectGetMaxY(self.frame);
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setPoint:(CGPoint)point
{
    CGRect frame = self.frame;
    frame.origin = point;
    self.frame = frame;
}

- (CGPoint)point
{
    return self.frame.origin;
}

-(void)addBelowOfView:(UIView *)view distance:(CGFloat)dis
{
    if(view)
    {
        UIView* superview=view.superview;
        if(superview)
        {
            self.x=view.x;
            self.y=view.y+view.height+dis;
            [superview addSubview:self];
        }
    }
}

-(void)addAboveOfView:(UIView *)view distance:(CGFloat)dis
{
    if(view)
    {
        UIView* superview=view.superview;
        if(superview)
        {
            self.x=view.x;
            self.y=view.y-self.height-dis;
            [superview addSubview:self];
        }
    }
}

-(void)addLeftOfView:(UIView *)view distance:(CGFloat)dis
{
    if(view)
    {
        UIView* superview=view.superview;
        if(superview)
        {
            self.x=view.x-self.width-dis;
            self.y=view.y;
            [superview addSubview:self];
        }
    }
}

-(void)addRightOfView:(UIView *)view distance:(CGFloat)dis
{
    if(view)
    {
        UIView* superview=view.superview;
        if(superview)
        {
            self.x=view.x+view.width+dis;
            self.y=view.y;
            [superview addSubview:self];
        }
    }
}

-(void)removeAllSubviews
{
    NSArray* subViews=self.subviews;
    for(UIView* v in subViews)
    {
        [v removeFromSuperview];
    }
}

+ (UIView *)separateLineWithWidth:(CGFloat)width x:(CGFloat)x y:(CGFloat)y{
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor colorWithWhite:(233/255.0) alpha:1];
    line.x = x;
    line.y = y;
    line.width = width;
    line.height = 0.5;
    return line;
}

- (void)setAllCornerRadius:(CGFloat)rad {
    [self layoutIfNeeded];
    UIImage* img=[UIImage imageNamed:@"fourCorner"];
    UIImage* scaleImg=[img resizeToWidth:2*rad height:2*rad];
    UIImage* streImg=[scaleImg stretchableImageWithLeftCapWidth:rad topCapHeight:rad];
    UIImageView* cornerImg=(UIImageView*)[self viewWithTag:CORNER_IMG_TAG];
    if (cornerImg==nil) {
        cornerImg=[[UIImageView alloc]init];
        cornerImg.tag=CORNER_IMG_TAG;
    }
    cornerImg.frame=self.bounds;
    cornerImg.image=((self.width==self.height)&&(rad>=self.width/2))?img:streImg;
    [self addSubview:cornerImg];
    
//    self.layer.cornerRadius=rad;
//    self.layer.masksToBounds=YES;
}

-(void)removeMyCornerRadius
{
    UIView* v=[self viewWithTag:CORNER_IMG_TAG];
    if (v) {
        [v removeFromSuperview];
    }
}

-(void)setRoundRectDefault
{
    self.layer.cornerRadius=7;
    self.layer.borderWidth=0.5;
    self.layer.borderColor=gray(220).CGColor;
    self.clipsToBounds=YES;
}

@end
