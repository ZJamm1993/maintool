//
//  WBTableViewController.m
//  风聆
//
//  Created by Jamm on 16/8/3.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import "WBTableViewController.h"
#import "WBHttpTool.h"

@interface WBTableViewController ()
{
    NSInteger currentPage;
}
@end

@implementation WBTableViewController

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    self=[super init];
    self.style=style;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.automaticallyAdjustsScrollViewInsets = YES;
    currentPage=0;
    _url=@"";
    _params=[NSMutableDictionary dictionary];
    _dataSource=[NSMutableArray array];
    _table=[[WBTableView alloc]initWithFrame:self.view.frame style:self.style];
    _table.dataSource=self;
    _table.delegate=self;
    _tableView=_table;
    [self.view addSubview:_table];
    [_table configureRefreshView:YES andLoadMoreView:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startRefresh
{
    [self.table showRefreshWithAnimated:YES];
}

-(void)WBTableViewStartLoadMore:(WBTableView *)tableView
{
    [self loadMore];
}

-(void)WBTableViewStartRefresh:(WBTableView *)tableView
{
    [self refresh];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

-(void)refresh
{
    [_params setValue:@"1" forKey:@"pageNo"];
    [_params setValue:@"10" forKey:@"pageSize"];
    [WBHttpTool get:_url params:_params success:^(id responseObject) {
        NSDictionary* d=(NSDictionary*)responseObject;
        [_table stopRefresh];
        NSString* msg=[[d allKeys]containsObject:@"msg"]?[d valueForKey:@"msg"]:nil;
        [_table stopLoadingWithMessage:msg];
        if([d valueForKey:@"success"])
        {
            currentPage=1;
            [self refreshSuccess:d];
            [_table reloadData];
        }
    } failure:^(NSError *error) {
        [_table stopRefresh];
        [self refreshFailure:error];
    }];
}

-(void)loadMore
{
    [_params setValue:[NSString integerString:currentPage+1] forKey:@"pageNo"];
    [_params setValue:@"10" forKey:@"pageSize"];
    [WBHttpTool get:_url params:_params success:^(id responseObject) {
        NSDictionary* d=(NSDictionary*)responseObject;
        NSString* msg=[[d allKeys]containsObject:@"msg"]?[d valueForKey:@"msg"]:nil;
        [_table stopLoadingWithMessage:msg];
        if([d valueForKey:@"success"])
        {
            currentPage++;
            [self loadMoreSuccess:d];
            [_table reloadData];
        }
    } failure:^(NSError *error) {
        [self loadMoreFailure:error];
    }];
}

-(void)loadMoreSuccess:(NSDictionary*)dict
{
    
}

-(void)loadMoreFailure:(NSError*)error
{
    
}

-(void)refreshSuccess:(NSDictionary*)dict
{
    
}

-(void)refreshFailure:(NSError*)error
{
    
}

@end
