//
//  WBTableView.h
//  WBTableView
//
//  Created by Jamm on 16/1/17.
//  Copyright © 2016年 Jamm. All rights reserved.
//
//此tableview已占用了footerview！！

#import <UIKit/UIKit.h>
//#import "SRRefreshView.h"
#import "WBRefreshView.h"
#import "WBLoadMoreFooterView.h"
@class WBTableView;
@protocol WBTableViewDelegate<NSObject,UITableViewDelegate>

@optional
-(void)WBTableViewStartRefresh:( WBTableView* )tableView;
//代理刷新

-(void)WBTableViewStartLoadMore:(WBTableView*)tableView;
//代理加载
@end

@interface WBTableView : UITableView
//@property (nonatomic,weak,nullable)id<WBTableViewDelegate> WBTableViewDelegate;

@property BOOL noSeparatorLineOnGroupedStyle;

-(void)stopRefresh;
-(void)stopRefreshWithMessage:(NSString*)message;
//获取到数据后调用

-(void)stopLoadingWithMessage:(NSString*)message;
//获取到数据后调用

-(void)configureRefreshView:(BOOL)shouldRefresh andLoadMoreView:(BOOL)shoulLoadMore;
//设定是否显示refresh和loadmore，不掉用则是普通tableview

-(void)showRefreshWithAnimated:(BOOL)animated;
//首次强制显示刷新调用

//-(void)WBScrollViewDidEndDragging:(UIScrollView* _Nullable)scrollView;
////在调用者的scrollViewDidEndDragging:调用
//-(void)scrollViewDidEndDragging:(UIScrollView* _Nullable)scrollView;
//
//-(void)WBScrollViewDidScroll:(UIScrollView * _Nullable)scrollView;
////在调用者的scrollViewDidScroll::调用
//-(void)scrollViewDidScroll:(UIScrollView *_Nullable)scrollView;

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

+(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

-(UILabel*)tableSectionLabelWithText:( NSString* )text;

@end

@interface ClassGroupedTableViewCell : UITableViewCell

@property (nonatomic,assign) UITableViewCellStyle style;
@property (nonatomic,assign) BOOL showDisclosureIndicator;
//@property (nonatomic,strong) UIView* myContentView;
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

@end
