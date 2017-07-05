//
//  leftViewController.h
//  橙子
//
//  Created by Macbook Air on 15/10/15.
//  Copyright (c) 2015年 Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

#define winW [UIScreen mainScreen].bounds.size.width
#define winH [UIScreen mainScreen].bounds.size.height
#define rate 0.84
#define menuW 256*rate
#define menuH 568*rate

@interface leftViewController : UIViewController

+ (instancetype)menu;

@end
