//
//  HNTextViewToolBar.h
//  风聆
//
//  Created by Macbook Air on 16/1/10.
//  Copyright © 2016年 Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HNMessageTextView.h"

#define kInputTextViewMinHeight 31
#define kInputTextViewMaxHeight 100
#define kHorizontalPadding 6
#define kVerticalPadding 9

@protocol HNMessageToolBarDelegate;
@interface HNTextViewToolBar : UIView

@property (nonatomic, weak) id <HNMessageToolBarDelegate> delegate;

/**
 *  操作栏背景图片
 */
@property (strong, nonatomic) UIImage *toolbarBackgroundImage;

/**
 *  背景图片
 */
@property (strong, nonatomic) UIImage *backgroundImage;

/**
 *  用于输入文本消息的输入框
 */
@property (strong, nonatomic) HNMessageTextView *inputTextView;
@property (nonatomic) NSString* text;
@property (nonatomic) NSString* placeHolder;
/**
 *  文字输入区域最大高度，必须 > KInputTextViewMinHeight(最小高度)并且 < KInputTextViewMaxHeight，否则设置无效
 */
@property (nonatomic) CGFloat maxTextInputViewHeight;

/**
 *  初始化方法
 *
 *  @param frame      位置及大小
 *
 *  @return DXMessageToolBar
 */
- (instancetype)initWithFrame:(CGRect)frame;
-(void)input;
-(void)cancelEditing;
/**
 *  默认高度
 *
 *  @return 默认高度
 */
+ (CGFloat)defaultHeight;

@end

@protocol HNMessageToolBarDelegate <NSObject>

@optional

/**
 *  文字输入框开始编辑
 *
 *  @param inputTextView 输入框对象
 */
- (void)inputTextViewDidBeginEditing:(HNMessageTextView *)messageInputTextView;

/**
 *  文字输入框将要开始编辑
 *
 *  @param inputTextView 输入框对象
 */
- (void)inputTextViewWillBeginEditing:(HNMessageTextView *)messageInputTextView;

/**
 *  发送文字消息，可能包含系统自带表情
 *
 *  @param text 文字消息
 */
- (void)didSendText:(NSString *)text;

//@required
/**
 *  高度变到toHeight
 */
- (void)didChangeFrameToHeight:(CGFloat)toHeight;

/**
 *   取消按钮
 */
-(void)HNMessageToolBarDidCancel:(HNMessageTextView *)messageInputTextView;
@end
