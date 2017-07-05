//
//  YDMsgButton.h
//  风聆
//
//  Created by iMac206 on 15/12/26.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YDMsgButton : UIButton

/** 创建方法*/
- (instancetype)initWithImageName:(NSString *)imageName hightlightedImageName:(NSString *)hightlightImageName;

/** badge*/
@property (nonatomic, assign) int badge;

@end
