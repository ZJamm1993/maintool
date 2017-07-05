//
//  YDTailorWindowView.m
//  橙子
//
//  Created by Macbook Air on 15/11/13.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import "YDTailorWindowView.h"
#define kMaskViewBorderWidth 2.0f
@interface YDTailorWindowView()

/** 裁剪框的size*/
@property (nonatomic ,assign) CGRect cropRect;
@end

@implementation YDTailorWindowView{
    CGFloat _cornerRaduis;
}
// 真正的设置裁剪框frame。set方法
- (void)setCropSize:(CGSize)size cornerRaduis:(CGFloat)cornerRaduis
{
    CGFloat x = (CGRectGetWidth(self.bounds) - size.width) / 2;
    CGFloat y = (CGRectGetHeight(self.bounds) - size.height) / 2;
    _cropRect = CGRectMake(x, y, size.width, size.height);
    _cornerRaduis = cornerRaduis;
    [self setNeedsDisplay];
}

// 真正的get方法
- (CGSize)cropSize
{
    return _cropRect.size;
}

// 除领裁剪框的位置
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    // 设置绘制区域个参数
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    CGFloat circleX = (self.width - _cropRect.size.width) / 2;
    CGFloat circleY = (self.height - _cropRect.size.height) / 2;
    CGFloat circleRadius = _cornerRaduis;
    
    // 画圆的贝斯曲线，从顶点xy开始画，后面为高宽，宽高一致为圆。
    //UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(circleX, circleY, circleRadius, circleRadius)];
    //[circlePath setUsesEvenOddFillRule:YES];
    //[circleLayer setPath:[circlePath CGPath]];
    //[circleLayer setFillColor:[[UIColor clearColor] CGColor]];
    
    // 画导航栏透明位置
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *barPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, screenWidth, navBar_height)];
    [layer setPath:[barPath CGPath]];
    [layer setFillColor:[[UIColor clearColor] CGColor]];
    
    // 画圆角矩形
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(circleX, circleY, _cropRect.size.width, _cropRect.size.width) cornerRadius:circleRadius];
    [circleLayer setPath:[cornerPath CGPath]];
    [circleLayer setFillColor:[[UIColor clearColor] CGColor]];
    
    // 贝斯曲线反扫描的区域。从xy开始扫，扫的高度为height，宽度为width
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, screenWidth, screenHeight) cornerRadius:0];
    // 拼接，需要画的路径都要通过appendPath拼接才能画出来
    [path appendPath:barPath];
    [path appendPath:cornerPath];
    [path setUsesEvenOddFillRule:YES];
    
    CAShapeLayer *fillLayer = [CAShapeLayer layer];
    fillLayer.name = @"fillLayer";
    fillLayer.path = path.CGPath;
    fillLayer.fillRule = kCAFillRuleEvenOdd;
    fillLayer.fillColor = [UIColor blackColor].CGColor;
    fillLayer.opacity = 0.8;
    [self.layer addSublayer:fillLayer];
    
    /**UIGraphicsGetCurrentContext 方法*/
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    //
//    CGContextAddArc(ctx, rect.size.width / 2, rect.size.height / 2, _cropRect.size.height / 2, 0, M_PI * 2, 0);
//    CGContextFillPath(ctx);
//    // 外框的rgba
//    CGContextSetRGBFillColor(ctx, 0, 0, 0, 0.8);
//    // 外框的frame
//    CGContextFillRect(ctx, self.bounds);
//    // 内框的颜色
//    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
//    // 设置内框和外框的分割线
//    //    CGContextStrokeRectWithWidth(ctx, _cropRect, kMaskViewBorderWidth);
//    // 设置内框的范围
//    CGContextClearRect(ctx, _cropRect);
//    // 画按钮透明位置
//    CGContextClearRect(ctx, CGRectMake(0, 0, screenWidth, navBar_height));
//    // [[UIColor redColor] set];
    
    
    
}
@end
