//
//  HNNavigationBar.m
//  橙子
//
//  Created by Macbook Air on 15/9/5.
//  Copyright (c) 2015年 Macbook Air. All rights reserved.
//

#import "HNNavigationBar.h"

@implementation HNNavigationBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 修改标题字体
//        self.titleTextAttributes = @{NSForegroundColorAttributeName:color_main_app,NSFontAttributeName:[UIFont systemFontOfSize:20]};
//        self.tintColor = color_main_app;//?
//        [self setBarTintColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 修改标题字体
    self.titleTextAttributes = @{NSForegroundColorAttributeName:gray_102,NSFontAttributeName:[UIFont systemFontOfSize:navigationBarTitleFontSize]};
    self.tintColor = color_main_app;// 设置的是bar的颜色
    [self setBarTintColor:[UIColor whiteColor]];
    
    // 修改左右按钮的位置
//    for (UIButton *button in self.subviews) {
////        YDLog(@"NavigationBar's subview is : %@",[NSString stringWithUTF8String:object_getClassName(button)]);
//        if ([(UISegmentedControl *)button isKindOfClass:[UISegmentedControl class]]){
//            button.centerX = screenWidth / 2.0;
//        }
//        if([button isKindOfClass:[NSClassFromString(@"UINavigationItemView") class]]){
//            button.centerX = screenWidth / 2.0;
//        }
//        if (![button isKindOfClass:[UIButton class]]) continue;
//        if (button.centerX < 44) {
////            button.x = 0;
//        }
//        else{
////            YDLog(@"rightButton.x == %f",button.x);
////            button.x = screenWidth - 44;
//        }
////        else if (button.x > screenWidth/2 && button.centerX < screenWidth - 44){
////            button.x = screenWidth - 88;
////        }
//    }
}

+ (void)initialize
{
    // 设置UINavigationBarTheme的主
//    [self setupNavigationBarTheme];
    
    // 设置UIBarButtonItem的主题
    [self setupBarButtonItemTheme];
    
}

/**
 *  设置UIBarButtonItem的主题
 */
+ (void)setupBarButtonItemTheme
{
    // 通过appearance对象能修改整个项目中所有UIBarButtonItem的样式
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    /**设置文字属性**/
    // 设置普通状态的文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = color_main_app;
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
//    textAttrs[NSShadowAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置高亮状态的文字属性
    NSMutableDictionary *highTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    highTextAttrs[NSForegroundColorAttributeName] = color_Highlighted_app;
    [appearance setTitleTextAttributes:highTextAttrs forState:UIControlStateHighlighted];
    
    // 设置不可用状态(disable)的文字属性
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [appearance setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];

}

@end
