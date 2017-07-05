//
//  loadMoreFooterView.m
//  橙子
//
//  Created by Jamm on 15/10/22.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import "WBLoadMoreFooterView.h"

@implementation WBLoadMoreFooterView
{
    UIActivityIndicatorView* activity;
    UILabel* loadingLabel;
}

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    self.backgroundColor=[UIColor clearColor];
    CGFloat w=frame.size.width;
    CGFloat h=frame.size.height;
    activity=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(70,0,h,h)];
    activity.hidesWhenStopped=YES;
    
    //[activity startAnimating];
    activity.activityIndicatorViewStyle=UIActivityIndicatorViewStyleGray;
    [self addSubview:activity];
    
    
    loadingLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,0 , w, h)];
    loadingLabel.textAlignment=NSTextAlignmentCenter;
    loadingLabel.font=font(13);
//    loadingLabel.text=@"加载更多";
    loadingLabel.textColor=[UIColor grayColor];
    [self addSubview:loadingLabel];
    
    UIButton* loadButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, w, h)];
    [loadButton addTarget:self action:@selector(startLoading) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:loadButton];
    
    self.loading=NO;
    return self;
}

-(void)stopLoadingWithMessage:(NSString *)message
{
    self.loading=NO;
    if(message)
    {
        loadingLabel.text=message;
    }
    else
    {
        loadingLabel.text=@"";
    }
}

-(void)setLoading:(BOOL)loading
{
    _loading=loading;
    if(_loading)
    {
        [activity startAnimating];
    }
    else
    {
        [activity stopAnimating];
    }
    loadingLabel.width=self.width/3;
//    [loadingLabel sizeToFit];
    loadingLabel.center=CGPointMake(self.width/2, self.height/2);
    activity.x=loadingLabel.x-activity.width-30;
    if (loadingLabel.text.length==0) {
        activity.center=loadingLabel.center;
    }
}

-(void)startLoading
{
    if(!_loading)
    {
        if([self.delegate respondsToSelector:@selector(loadMoreFooterStartLoading:)])
        {
            loadingLabel.text=@"正在加载...";
            self.loading=YES;
            [self.delegate performSelector:@selector(loadMoreFooterStartLoading:) withObject:self];
        }
    }
}

-(void)loadMoreScrollViewDidEndDragging:(UIScrollView *)scrollView
{
    if(scrollView)
    {
        CGFloat offSetY=scrollView.contentOffset.y;
        CGFloat frameHeight=scrollView.frame.size.height;
        CGFloat contentHeight=scrollView.contentSize.height;
        if(offSetY+frameHeight-contentHeight>=20)
        {
            //如果到底部并上拉至多少点
            [self startLoading];
        }
    }
}

-(void)loadMoreScrollViewDidScroll:(UIScrollView *)scrollView
{
    //暂时没有正在上拉的变化效果
}

@end
