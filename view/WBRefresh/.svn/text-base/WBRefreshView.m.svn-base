//
//  WBRefreshView.m
//  myRefreshView
//
//  Created by jam on 17/4/1.
//  Copyright © 2017年 jam. All rights reserved.
//

#import "WBRefreshView.h"
#import "Masonry.h"

const CGFloat defaultWBRefreshViewHeight=72;

@interface WBRefreshView()

@property (nonatomic,strong) UIView* bgView;
@property (nonatomic,strong) UILabel* textLabel;
@property (nonatomic,strong) UIImageView* leftImageView;
@property (nonatomic,strong) UIImageView* bottomImageView;

@end

@implementation WBRefreshView
{
    __weak UIScrollView* mySuperView;
    UIEdgeInsets oldInsets;
    BOOL shouldRefresh;
    BOOL isFinish;
}

-(void)startLoadingAnimation
{
    UIImageView* iv=self.leftImageView;
    
//    iv.layer.anchorPoint=CGPointMake(0.5, 0.1);
//    
//    CGPoint cen=iv.center;
//    cen.y=cen.y-(iv.layer.anchorPoint.y*iv.frame.size.height);
//    iv.center=cen;
    CGFloat dx=0.4;
    CAMediaTimingFunction* timing=[CAMediaTimingFunction functionWithControlPoints:dx :0 :1-dx :1];
    
    CABasicAnimation *rota = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rota.fromValue = [NSNumber numberWithFloat:+0.3];
    rota.toValue = [NSNumber numberWithFloat:-0.3];
//    rota.timingFunction=timing;
    
//    iv.layer.anchorPoint=CGPointMake(0.5, 0);
    
    CABasicAnimation *mova=[CABasicAnimation animationWithKeyPath:@"position"];
    CGFloat ox=iv.frame.size.width/8;
    mova.fromValue=[NSValue valueWithCGPoint:CGPointMake(iv.center.x-ox, iv.center.y)];
    mova.toValue=[NSValue valueWithCGPoint:CGPointMake(iv.center.x+ox, iv.center.y)];
//    mova.timingFunction=timing;
    
    CAAnimationGroup* swing=[CAAnimationGroup animation];
    swing.animations=[NSArray arrayWithObjects:(id)rota,(id)mova, nil];
    swing.duration =1.5;
    swing.timingFunction=timing;
    swing.repeatCount = CGFLOAT_MAX;
    swing.autoreverses = YES;
    swing.delegate = self;
    
    [iv.layer addAnimation:swing forKey:@"rotation"];
}

-(void)endLoadingAnimation
{
    UIImageView* iv=self.leftImageView;
    [iv.layer removeAnimationForKey:@"rotation"];
}

-(UIView*)bgView
{
    if (_bgView==nil) {
        _bgView=[[UIView alloc]initWithFrame:CGRectMake(0, -defaultWBRefreshViewHeight, 320, defaultWBRefreshViewHeight)];
        [self addSubview:_bgView];
        
        //
//        _bgView.backgroundColor=[UIColor redColor];
    }
    return _bgView;
}

-(UILabel*)textLabel
{
    if (_textLabel==nil) {
        _textLabel=[[UILabel alloc]init];
        [self.bgView addSubview:_textLabel];
        
        _textLabel.textAlignment=NSTextAlignmentCenter;
        _textLabel.textColor=[UIColor colorWithWhite:102/255.0 alpha:1];
        _textLabel.text=self.normalText;
        [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.bgView.mas_centerX);
            make.top.equalTo(self.bgView.mas_top).offset(10);
        }];
        
        //
//        _textLabel.backgroundColor=[UIColor yellowColor];
    }
    return _textLabel;
}

-(UIImageView*)leftImageView
{
    if (_leftImageView==nil) {
        _leftImageView=[[UIImageView alloc]init];
        _leftImageView.contentMode=UIViewContentModeScaleToFill;
        [self.bgView addSubview:_leftImageView];
        
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@(24));
            make.right.equalTo(self.textLabel.mas_left).offset(-10);
            make.centerY.equalTo(self.textLabel.mas_centerY);
        }];
    }
    return _leftImageView;
}

-(void)setLeftImage:(UIImage *)leftImage
{
    _leftImage=leftImage;
    self.leftImageView.image=_leftImage;
}

-(UIImageView*)bottomImageView
{
    if (_bottomImageView==nil) {
        _bottomImageView=[[UIImageView alloc]init];
        _bottomImageView.contentMode=UIViewContentModeScaleAspectFit;
        [self.bgView addSubview:_bottomImageView];
        
        [_bottomImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@(20));
            make.centerX.equalTo(self.textLabel.mas_centerX);
            make.bottom.equalTo(self.bgView.mas_bottom).offset(-5);
        }];
    }
    return _bottomImageView;
}

-(void)setBottomImage:(UIImage *)bottomImage
{
    _bottomImage=bottomImage;
    self.bottomImageView.image=_bottomImage;
}

-(void)setNormalText:(NSString *)normalText
{
    _normalText=normalText;
    self.textLabel.text=normalText;
}

-(void)startRefresh
{
    shouldRefresh=NO;
    if (mySuperView==nil) {
        [self scrollViewDidScroll:(UIScrollView*)self.superview];
    }
    if (self.loading==YES) {
        return;
    }
    self.loading=YES;
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(refreshViewStartRefresh:)]) {
        [self.delegate refreshViewStartRefresh:self];
    }
    
    self.textLabel.text=self.loadingText;
    [self performSelector:@selector(startLoadingAnimation) withObject:nil afterDelay:0];
    
    oldInsets=mySuperView.contentInset;
    UIEdgeInsets newInsets=oldInsets;
    newInsets.top=oldInsets.top+defaultWBRefreshViewHeight;
    
    //使用异步调用主线程不会产生跳动现象。。。
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.25 animations:^{
            mySuperView.contentInset = newInsets;
            [mySuperView setContentOffset:CGPointMake(mySuperView.contentOffset.x, -newInsets.top) animated:YES];
        } completion:^(BOOL finished) {
        }];
    });

//#warning why it will jump once?
}

- (void)endRefresh
{
    if (self.loading==NO) {
        return;
    }
    self.loading=NO;
    
    [self endLoadingAnimation];
    
    isFinish=YES;
    
    if (mySuperView) {
        [UIView animateWithDuration:0.25 animations:^{
            mySuperView.contentInset=oldInsets;
        } completion:^(BOOL finished) {
            isFinish=NO;
        }];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([self.superview isKindOfClass:[UIScrollView class]]) {
        mySuperView=(UIScrollView*)self.superview;
        self.bgView.frame=CGRectMake(0, -defaultWBRefreshViewHeight, scrollView.frame.size.width, defaultWBRefreshViewHeight);
        self.textLabel=self.textLabel;
    }
    
    CGFloat oy=scrollView.contentOffset.y+scrollView.contentInset.top;
    
//    NSLog(@"%f",oy);
    
    if (self.loading==NO) {
        if (oy<(-defaultWBRefreshViewHeight)) {
            self.textLabel.text=self.pullingText;
            shouldRefresh=YES;
        }
        else
        {
            self.textLabel.text=self.normalText;
            shouldRefresh=NO;
            if (isFinish) {
                self.textLabel.text=self.finishText;
            }
        }
    }
    else
    {
        self.textLabel.text=self.loadingText;
    }
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
{
//    CGFloat oy=scrollView.contentOffset.y+scrollView.contentInset.top;
//    if (oy<-defaultWBRefreshViewHeight) {
    if (shouldRefresh){
        self.textLabel.text=self.loadingText;
        [self startRefresh];
    }
}

@end
