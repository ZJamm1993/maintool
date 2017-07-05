//
//  YDTailorImageView.m
//  橙子
//
//  Created by Macbook Air on 15/11/13.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import "YDTailorImageView.h"
#import "YDTailorWindowView.h"

@interface YDTailorImageView()<UIScrollViewDelegate>


/** 图片*/
@property (nonatomic ,strong) UIImageView *imageView;

/** 图片*/
@property (nonatomic ,strong) UIImage *image;

/** 裁剪窗口*/
@property (nonatomic ,strong) YDTailorWindowView *tailorWindow;

/** 裁剪窗口的size*/
@property (nonatomic ,assign) CGSize tailorSize;

@property (nonatomic) CGFloat curScale;
@property (nonatomic) CGFloat minScale;
@property (nonatomic) CGFloat maxScale;
@property (nonatomic) CGSize originSize;
@end

@implementation YDTailorImageView{
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        
        // 设置确定取消按钮
        [self tailorBtnView];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
        [self addGestureRecognizer:pan];
        UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch:)];
        [self addGestureRecognizer:pinch];
        
    }
    return self;
}

-(void)onPan:(UIPanGestureRecognizer *)panRecognizer
{
    CGPoint pos = [panRecognizer translationInView:self];
    CGPoint newImagePos = CGPointMake(self.imageView.centerX + pos.x, self.imageView.centerY + pos.y);
    if (((fabs(newImagePos.x - self.tailorWindow.centerX) <= (self.imageView.size.width - self.tailorSize.width) / 2) ) &&
        (fabs(newImagePos.y - self.tailorWindow.centerY) <= (self.imageView.size.height - self.tailorSize.height) / 2 ) ) {
        self.imageView.center = newImagePos;
        
        [self updateScaleBounds];
    }

    [panRecognizer setTranslation:CGPointZero inView:self];
}

-(void)onPinch:(UIPinchGestureRecognizer *)pinchRecognizer
{
    YDLog(@"Cur Scale: %f", self.curScale);
    YDLog(@"Min Scale: %f", self.minScale);
    YDLog(@"Max Scale: %f", self.maxScale);
    CGFloat newScale = self.curScale * pinchRecognizer.scale;
    if ((pinchRecognizer.scale <= 1.0 && newScale > self.minScale) ||   // 尝试缩小
        (pinchRecognizer.scale >= 1.0 && newScale < self.maxScale))     // 尝试放大
    {
        [self.imageView setTransform:CGAffineTransformScale(self.imageView.transform, pinchRecognizer.scale, pinchRecognizer.scale)];
        self.curScale = newScale;
    }
    [pinchRecognizer setScale:1.0f];
}

- (void)updateScaleBounds
{
    CGFloat xScale = (fabs(self.imageView.centerX - self.tailorWindow.centerX) + self.tailorSize.width / 2) / (self.originSize.width / 2 );
    CGFloat yScale = (fabs(self.imageView.centerY - self.tailorWindow.centerY) + self.tailorSize.height / 2) / (self.originSize.height /2 );
    self.minScale = MAX(xScale, yScale);
    if (self.minScale > self.maxScale) {
        self.minScale = self.maxScale;
    }
}


#pragma mark - 公共方法
/** 设置裁剪的图片*/
- (void)setImage:(UIImage *)image
{
    if (image != _image)
    {
        _image = [self fixOrientation:image];

        [self.imageView setImage:_image];
        
        CGFloat width = _image.size.width;
        CGFloat height = _image.size.height;
        CGFloat scale =  height / width;
        
        self.imageView.width =  screenWidth;
        self.imageView.height = screenWidth * scale;
        self.imageView.centerX = screenWidth * 0.5;
        self.imageView.centerY = screenHeight * 0.5;
        
        self.originSize = self.imageView.size;
        self.curScale = 1.0;
        self.maxScale = 3.0;
        [self updateScaleBounds];
    }
}

/** 设置裁剪框的size*/
- (void)setCropSize:(CGSize)size cornerRaduis:(CGFloat)cornerRaduis
{
    self.tailorSize = size;
    [self.tailorWindow setCropSize:self.tailorSize cornerRaduis:cornerRaduis];
}

- (void)setComfirBlock:(comfirButtonBlock)comfirBlock cancelBlock:(cancelButtonBlock)cancelBlock{
    self.comfirButtonBlock = comfirBlock;
    self.cancelButtonBlock = cancelBlock;
}

/** 获得裁剪照片的方法*/
- (UIImage *)cropImage
{
    YDLog(@"Image Size: (%f, %f)", self.image.size.width, self.image.size.height);

    // 获取当前ImageView与原图的size比例
    CGFloat scaleX =  self.image.size.width / self.imageView.frame.size.width;
    CGFloat scaleY = self.image.size.height / self.imageView.frame.size.height ;
    
    // 获取在image中截取的Size
    CGFloat width = self.tailorSize.width * scaleX;
    CGFloat height = self.tailorSize.height * scaleY;
    
    // 获取在image中截取的Origin
    CGFloat aX1 = (self.tailorWindow.centerX - self.tailorSize.width / 2 - self.imageView.frame.origin.x) * scaleX;
    CGFloat aY1 = (self.tailorWindow.centerY - self.tailorSize.height / 2 - self.imageView.frame.origin.y) * scaleY;
    
    // 将图片从原图从裁剪出来
    UIImage *image = [_image cropImageWithX:aX1 y:aY1 width:width height:height];
    
    // 将裁剪的图片处理成分辨率与裁剪窗口一样大的图片
    image = [image resizeToWidth:self.tailorSize.width height:self.tailorSize.height];
    
    YDLog(@"Image Size: (%f, %f)", self.image.size.width, self.image.size.height);
    return image;
}

- (void)comfirm:(UIButton *)button
{
    [self removeFromSuperview];
    if (self.comfirButtonBlock) {
        self.comfirButtonBlock (self);
    }
}
- (void)cancel:(UIButton *)button
{
    [self removeFromSuperview];
    if (self.cancelButtonBlock) {
        self.cancelButtonBlock (self);
    }
}

#pragma mark - 懒加载
- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
//    self.backgroundColor = color_background;
    [self.tailorWindow setFrame:self.bounds];
    
    // 如果没有设置裁剪框的size，则取以下大小
    if (CGSizeEqualToSize(self.tailorSize, CGSizeZero)) {
        [self setCropSize:CGSizeMake(150, 150) cornerRaduis:0];
    }
}


- (YDTailorWindowView *)tailorWindow
{
    if (_tailorWindow == nil)
    {
        _tailorWindow = [[YDTailorWindowView alloc] init];
        [_tailorWindow setBackgroundColor:[UIColor clearColor]];
        [_tailorWindow setUserInteractionEnabled:NO];
        [self addSubview:_tailorWindow];
        
    }
    [self bringSubviewToFront:_tailorWindow];
    return _tailorWindow;
}

- (void)tailorBtnView
{
    UIView *_tailorBtnView = [[UIView alloc] init];
    _tailorBtnView.frame = CGRectMake(0, 0, screenWidth, navBar_height);
//        _tailorBtnView.backgroundColor = [UIColor whiteColor];
    UIBlurEffect* blur=[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView* eff=[[UIVisualEffectView alloc]initWithEffect:blur];
    [_tailorBtnView addSubview:eff];
    eff.frame=_tailorBtnView.bounds;
//    _tailorBtnView.backgroundColor=gray(255);

    UIButton *comfirBtn = [[UIButton alloc] init];
    comfirBtn.frame = CGRectMake(screenWidth - 44-20, 20, 44, 44);
    [comfirBtn setTitle:@"确定" forState:UIControlStateNormal];
    [comfirBtn setTitleColor:color_main_app forState:UIControlStateNormal];
    [comfirBtn setTitleColor:color_Highlighted_app forState:UIControlStateHighlighted];
    [comfirBtn addTarget:self action:@selector(comfirm:) forControlEvents:UIControlEventTouchUpInside];
    [_tailorBtnView addSubview:comfirBtn];
    
    UIButton *cancelBtn = [[UIButton alloc] init];
    cancelBtn.frame = CGRectMake(20, 20, 44, 44);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:color_main_app forState:UIControlStateNormal];
    [cancelBtn setTitleColor:color_Highlighted_app forState:UIControlStateHighlighted];
    [cancelBtn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [_tailorBtnView addSubview:cancelBtn];
    
    [self addSubview:_tailorBtnView];
}

- (UIImage *)fixOrientation:(UIImage *)image {
    
    // No-op if the orientation is already correct
    if (image.imageOrientation == UIImageOrientationUp) return image;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (image.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, image.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, image.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (image.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, image.size.width, image.size.height,
                                             CGImageGetBitsPerComponent(image.CGImage), 0,
                                             CGImageGetColorSpace(image.CGImage),
                                             CGImageGetBitmapInfo(image.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (image.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.height,image.size.width), image.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.width,image.size.height), image.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

@end
