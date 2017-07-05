//
//  WBRefreshView.h
//  myRefreshView
//
//  Created by jam on 17/4/1.
//  Copyright © 2017年 jam. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WBRefreshViewDelegate;

@interface WBRefreshView : UIView

@property (nonatomic,weak) id<WBRefreshViewDelegate> delegate;
@property (nonatomic,assign) BOOL loading;
@property (nonatomic,strong) UIImage* leftImage;
@property (nonatomic,strong) UIImage* bottomImage;
@property (nonatomic,strong) NSString* normalText;
@property (nonatomic,strong) NSString* pullingText;
@property (nonatomic,strong) NSString* loadingText;
@property (nonatomic,strong) NSString* finishText;

-(void)scrollViewDidScroll:(UIScrollView *)scrollView;
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView;

-(void)startRefresh;
-(void)endRefresh;

@end

@protocol WBRefreshViewDelegate <NSObject>

@optional
-(void)refreshViewStartRefresh:(WBRefreshView*)refreshView;

@end
