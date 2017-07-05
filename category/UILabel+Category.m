//
//  UILabel+Category.m
//  橙子
//
//  Created by Macbook Air on 15/10/28.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

+ (UILabel *)setLabel:(UILabel *)label lineSpace:(CGFloat)lineSpace
{
    if(label.text==nil)
    {
        label.text = @" ";
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];//如果text为nil，将发生灾难性后果。。。
    NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
    [paragrahStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0, label.text.length)];
    [label setAttributedText:attributedString];
    [label sizeToFit];
    return label;
}

-(void)setLineSpace:(CGFloat)lineSpace
{
    if(self.text==nil)
    {
        self.text = @" ";
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];//如果text为nil，将发生灾难性后果。。。
    NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
    [paragrahStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0, self.text.length)];
    [self setAttributedText:attributedString];
//    [self sizeToFit];
}

+ (UILabel *)setLabel:(UILabel *)label lineSpace:(CGFloat)lineSpace lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    if(label.text==nil)
    {
        label.text = @" ";
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];//如果text为nil，将发生灾难性后果。。。
    NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
    [paragrahStyle setLineSpacing:lineSpace];
    [paragrahStyle setLineBreakMode:lineBreakMode];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0, label.text.length)];
    [label setAttributedText:attributedString];
    [label sizeToFit];
    return label;
}

+ (CGSize)sizeWithText:(NSString *)text textFont:(CGFloat)font lineSpace:(CGFloat)lineSpace maxSize:(CGSize)maxSize numberOfLines:(NSInteger)number
{
    if (text.length==0) {
        return CGSizeZero;
    }
    CGSize size;
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:font];
    label.numberOfLines = number;
    label.size = maxSize;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
    [paragrahStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0, text.length)];
    [label setAttributedText:attributedString];
    [label sizeToFit];
    size = label.size;
    return size;
}

+ (UILabel *)setLabel:(UILabel *)label Text:(NSString *)text textFont:(CGFloat)font lineSpace:(CGFloat)lineSpace numberOfLines:(NSInteger)number
{
    label.font = [UIFont systemFontOfSize:font];
    label.numberOfLines = number;
//    label.size = maxSize;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
    [paragrahStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0, text.length)];
    [label setAttributedText:attributedString];
    [label sizeToFit];
    return label;
}
@end
 