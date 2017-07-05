//
//  WBSeachController.m
//  customViewTest
//
//  Created by Jamm on 16/3/8.
//  Copyright © 2016年 Jamm. All rights reserved.
//

#import "WBSearchController.h"
#import "MySearchBar.h"

@interface WBSearchController ()<MySearchBarDelegate>
{
    MySearchBar* search;
}
@end

@implementation WBSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSearchBar];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [search becomeFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [search resignFirstResponder];
}

-(void)setSearchBar
{
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.resultTableView=[[WBTableView alloc]initWithFrame:self.view.frame style:_style];
    [self.view addSubview:self.resultTableView];
    
    search=[[MySearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.width-20, 44)];
//    search.showsCancelButton=YES;
    search.placeholder=_placeholder;
    search.delegate=self;
    self.navigationItem.titleView=search;
}

-(void)setStyle:(UITableViewStyle)style
{
    _style=style;
    [self.resultTableView removeFromSuperview];
    self.resultTableView=[[WBTableView alloc]initWithFrame:self.view.frame style:_style];
    [self.view addSubview:self.resultTableView];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [self startSearch:searchBar.text];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self cancel];
}

-(void)cancel
{
//    [search resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController popViewControllerAnimated:YES];
}
-(void)textFieldValueChanged:(UITextField*)textField
{
    //NSLog(@"value changed: %@",textField.text);
}

-(void)startSearch:(NSString*)string
{
    
}

-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder=placeholder;
    search.placeholder=placeholder;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return @"搜索结果";
    }
    else
    {
        return nil;
    }
}

@end
