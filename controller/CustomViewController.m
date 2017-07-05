//
//  BaseViewController.m
//  风聆
//
//  Created by iMac206 on 17/3/10.
//  Copyright © 2017年 风聆小镇工作室. All rights reserved.
//

#import "CustomViewController.h"

@interface CustomViewController ()
{
    UIView* showedNothingView;
//    BOOL hasShowedNothingView;
    NSString* showedNothingMsg;
}
@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setWeakSelfController:(UIViewController *)weakSelfController
{
    
}

-(UIViewController*)weakSelfController
{
    __weak typeof(self) we=self;
    return we;
}

-(UIControl*)getNothingControl
{
    UIControl* contr=[[UIControl alloc]initWithFrame:self.view.bounds];
    [contr addTarget:self action:@selector(hideNothingView) forControlEvents:UIControlEventTouchUpInside];
    contr.backgroundColor = gray_233;;
    
    UIImageView* imgv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"unhappy"]];
    imgv.center=contr.center;
    [contr addSubview:imgv];
    
    UILabel* msg=[[UILabel alloc]initWithFrame:CGRectMake(0, imgv.maxY+40, contr.width, 40)];
    msg.textAlignment=NSTextAlignmentCenter;
    msg.textColor=gray_102;
    msg.numberOfLines=0;
    if (showedNothingMsg.length==0) {
        showedNothingMsg=@"无相关内容";
    }
    msg.text=showedNothingMsg;
    [contr addSubview:msg];
    
    return contr;
}

-(void)showNothingView
{
    [self showNothingViewWithMsg:nil];
}

-(void)showNothingViewWithMsg:(NSString *)msg
{
    return;
//    if (hasShowedNothingView) {
//        return;
//    }
//    hasShowedNothingView=YES;
    showedNothingMsg=msg;
    [showedNothingView removeFromSuperview];
    showedNothingView=[self getNothingControl];
    [self.view addSubview:showedNothingView];
}

-(void)hideNothingView
{
    [showedNothingView removeFromSuperview];
//    [self didHideNothingView];
    if ([[YDAccountTool account]guest]) {
        if(self.navigationController.viewControllers.count>=2)
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else
    {
        for (UIView* v in self.view.subviews) {
            if([v isKindOfClass:[WBTableView class]])
            {
                [((WBTableView*)v) showRefreshWithAnimated:YES];
            }
        }
    }
}

-(void)didHideNothingView{
    NSLog(@"did hide nothing view");
}
@end
