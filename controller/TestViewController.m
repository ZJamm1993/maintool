//
//  TestViewController.m
//  风聆
//
//  Created by iMac206 on 16/12/5.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import "TestViewController.h"
#import "BaseMyRecordController.h"
#import "ColumnsView.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.backgroundColor=[UIColor purpleColor];
    
    NSMutableArray* titles=[NSMutableArray array];
    NSMutableArray* values=[NSMutableArray array];
    
    for (int i=0; i<36; i++) {
        NSString* tit=[NSString stringWithFormat:@"%d月",i+1];
        NSNumber* num=[NSNumber numberWithInt:arc4random()];
        [titles addObject:tit];
        [values addObject:num];
    }
    
    ColumnsView* col=[[ColumnsView alloc]initWithFrame:CGRectMake(10, 100, screenWidth-20, 150)];
    col.enabled=YES;
    col.backgroundColor=[UIColor whiteColor];
    col.titles=titles;
    col.values=values;
    [self.view addSubview:col];
    
    col.selectedBlock=^(NSInteger selectedItem)
    {
        NSLog(@"selected %ld",(long)selectedItem);
        [self.navigationController pushViewController:[[BaseMyRecordController alloc]init] animated:YES];
    };
}


@end
