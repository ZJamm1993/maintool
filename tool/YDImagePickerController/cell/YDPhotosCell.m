//
//  YDPhotosCell.m
//  橙子
//
//  Created by Macbook Air on 15/11/7.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import "YDPhotosCell.h"

@implementation YDPhotosCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView *photoView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetWidth(self.frame))];
        photoView.backgroundColor = [UIColor blueColor];
        [self addSubview:photoView];
        self.photoView = photoView;
        
//        UIImageView *selectedBtn = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) - 20, 0, 20, 20)];
//        selectedBtn.backgroundColor = [UIColor redColor];
//        [self addSubview:selectedBtn];
//        self.selectedBtn = selectedBtn;
        
        UIButton *selectedBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) - 30, 0, 30, 30)];
        [selectedBtn setImage:[UIImage imageNamed:@"btn_choose_n"]forState:UIControlStateNormal];
        [selectedBtn setImage:[UIImage imageNamed:@"btn_choose_s"] forState:UIControlStateSelected];
        [selectedBtn addTarget:self action:@selector(clickedSelectedBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:selectedBtn];
        self.selectedBtn = selectedBtn;
        return self;
    }
    return self;
}

- (void)clickedSelectedBtn
{
    // 创建代理方法
    if (self.delegate && [self.delegate respondsToSelector:@selector(YDPhotosCell:)]) {
        [self.delegate YDPhotosCell:self];
    }
}

@end
