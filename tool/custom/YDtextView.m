//
//  YDtextView.m
//  橙子
//
//  Created by iMac206 on 15/10/16.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import "YDtextView.h"
@interface YDtextView()



/** 设置占位文字的颜色*/
//@property (nonatomic, strong) UIColor *placeholderColor;
//
///** 设置占位label的size*/
//@property (nonatomic, assign) CGSize placeholderSize;
//
///** 设置占位label的origin*/
//@property (nonatomic, assign) CGPoint placeholderPoint;
//
///** 设置占位label的frame*/
//@property (nonatomic, assign) CGRect placeholderFrame;
@property (nonatomic ,strong) UILabel *placeholderLabel;

@end

@implementation YDtextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.placeholderLabel = [[UILabel alloc] init];
        self.placeholderLabel.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.placeholderLabel.numberOfLines = 1;
        self.placeholderLabel.textAlignment = NSTextAlignmentLeft;
        self.placeholderLabel.textColor = [UIColor lightGrayColor];
        self.font=font_12;
        self.textContainerInset=self.textContainerInset;
        [self addSubview:self.placeholderLabel];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewPlaceholderChange) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.placeholderLabel.font=font;
}

- (void)setTextContainerInset:(UIEdgeInsets)textContainerInset
{
    [super setTextContainerInset:textContainerInset];
    _placeholderLabel.frame= CGRectMake(self.textContainerInset.left, self.textContainerInset.top, self.width-self.textContainerInset.right, 40);
    [_placeholderLabel sizeToFit];
}

/** 更新label的文字属性*/
-(void)setPlaceholder:(NSString *)placeholder
{
    if (placeholder.length==0) {
        return;
    }
    _placeholder =[@" "stringByAppendingString:placeholder];
    self.placeholderLabel.text = _placeholder;
    _placeholderLabel.frame=CGRectMake(self.textContainerInset.left, self.textContainerInset.top, self.width-self.textContainerInset.right, 40);
    [_placeholderLabel sizeToFit];
}

/** 键盘的通知*/
- (void)textViewPlaceholderChange
{
    self.placeholderLabel.hidden=![self.text isEqualToString:@""];
}

- (void)setLineSpace:(CGFloat)lineSpace
{
    // 给输入框文字增加行距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.text.length)];
    [self setAttributedText:attributedString];
}

@end
