//
//  loadMoreFooterView.h
//  橙子
//
//  Created by Jamm on 15/10/22.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBLoadMoreFooterView;
@protocol WBLoadMoreFooterViewDelegate <NSObject>
@optional
-(void)loadMoreFooterStartLoading:(WBLoadMoreFooterView*)loadMoreView;
@end

@interface WBLoadMoreFooterView : UIView
@property (nonatomic)BOOL loading;
@property (nonatomic,weak)id<WBLoadMoreFooterViewDelegate>delegate;
-(void)stopLoadingWithMessage:(NSString*)message;   //停止动画 并显示一段文字
-(void)loadMoreScrollViewDidEndDragging:(UIScrollView *)scrollView;
-(void)loadMoreScrollViewDidScroll:(UIScrollView *)scrollView;
@end
