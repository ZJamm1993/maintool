//
//  HISegmentedControl.m
//  singleTest
//
//  Created by Macbook Air on 16/4/18.
//  Copyright © 2016年 iMac206. All rights reserved.
//

#import "HISegmentedControl.h"

#define systemColor [UIColor colorWithRed:0 green:122/255.0 blue:255/255.0 alpha:1]
#define systemHightedColor [UIColor colorWithRed:200/255.0 green:255/255.0 blue:255/255.0 alpha:1]

@implementation HISegmentedControl{
    // 按钮的数量
    int buttonCount;
    // 按钮数组
    NSMutableArray *buttonArray;
    // tag数组
    NSMutableArray *tagViewArray;
    
    // 被选中的按钮
    UIButton *selectedButton;
    // 被选中的按钮的index;
    int selectedIndex;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.layer.borderColor = systemColor.CGColor;
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 4.0;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        
        buttonArray = [[NSMutableArray alloc] init];
        tagViewArray = [[NSMutableArray alloc] init];
        
    }
    return self;
}

- (void)setSegmentedColor:(UIColor *)segmentedColor{
    _segmentedColor = segmentedColor;
    self.layer.borderColor = segmentedColor.CGColor;
    for (UIButton *button in buttonArray) {
        [button setTitleColor:segmentedColor forState:UIControlStateNormal];
        [button setTitleColor:segmentedColor forState:UIControlStateHighlighted];
        [button setBackgroundImage:[UIImage createImageWithColor:segmentedColor] forState:UIControlStateSelected];
    }
}

- (void)setSegmentedHightedColor:(UIColor *)segmentedHightedColor{
    _segmentedColor = segmentedHightedColor;
    for (UIButton *button in buttonArray) {
        [button setBackgroundImage:[UIImage createImageWithColor:segmentedHightedColor] forState:UIControlStateHighlighted];
    }
}

- (void)setSelectedSegmentIndex:(NSUInteger)selectedSegmentIndex{
    _selectedSegmentIndex = selectedSegmentIndex;
    selectedButton = [buttonArray objectAtIndex:selectedSegmentIndex];
    selectedButton.selected = YES;
}

/** 插入按钮*/
- (void)insertSegmentWithTitle:( NSString *)title atIndex:(NSUInteger)index{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage createImageWithColor:systemColor] forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage createImageWithColor:systemHightedColor] forState:UIControlStateHighlighted];
    
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitleColor:systemColor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [button setTitleColor:systemColor forState:UIControlStateHighlighted];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateSelected];
    
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    button.tag = index;
    
    UIView *tagView = [[UIView alloc] init];
    tagView.backgroundColor = [UIColor redColor];
    tagView.clipsToBounds = YES;
    tagView.hidden = YES;
  
    [button addSubview:tagView];
    [self addSubview:button];
    
    [buttonArray addObject:button];
    [tagViewArray addObject:tagView];
    
    [self layoutSegmentedControl];
}



- (void)showTagView:(BOOL)isShow index:(NSUInteger)index{
    UIView *tagView = [tagViewArray objectAtIndex:index];
    tagView.hidden = !isShow;
}

- (void)buttonClicked:(UIButton *)button{
    selectedButton.selected = NO;
    selectedButton = button;
    selectedButton.selected = YES;
    _selectedSegmentIndex = selectedButton.tag;
    if (self.segmentedBlock) {
        self.segmentedBlock(selectedButton);
    }
}

- (void)layoutSegmentedControl{
    int segmentCount = (int)buttonArray.count;
    CGFloat width = self.frame.size.width / segmentCount;
    for (int i = 0; i < segmentCount; i++) {
        UIButton *button = [buttonArray objectAtIndex:i];
        button.x = width * i;
        button.y = 0;
        button.width = width;
        button.height = self.height;
        
        UIView *tagView = [tagViewArray objectAtIndex:i];
        tagView.x = button.width - 12;
        tagView.y = 4;
        tagView.width = 8;
        tagView.height = 8;
        tagView.layer.cornerRadius = tagView.width / 2.0;
    }
}
@end
