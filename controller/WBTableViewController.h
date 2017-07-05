//
//  WBTableViewController.h
//  风聆
//
//  Created by Jamm on 16/8/3.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBTableView.h"

@interface WBTableViewController : CustomViewController<UITableViewDataSource,WBTableViewDelegate>

@property (nonatomic,strong,readonly)WBTableView* table;
@property (nonatomic,strong,readonly)WBTableView* tableView;

@property (nonatomic,strong,readonly)NSMutableArray* dataSource;
@property (nonatomic,strong)NSString* url;
@property (nonatomic,strong)NSMutableDictionary* params;
@property (nonatomic,assign)UITableViewStyle style;

-(instancetype)initWithStyle:(UITableViewStyle)style;

-(void)loadMoreSuccess:(NSDictionary*)dict;
-(void)loadMoreFailure:(NSError*)error;
-(void)refreshSuccess:(NSDictionary*)dict;
-(void)refreshFailure:(NSError*)error;

-(void)startRefresh;

@end
