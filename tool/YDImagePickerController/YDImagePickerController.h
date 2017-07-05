//
//  YDImagePickerController.h
//  橙子
//
//  Created by Macbook Air on 15/11/7.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
@class YDImagePickerController;

@protocol YDImagePickerControllerDelegate<NSObject>

/** 将选择对照片url传出去的代理*/
-(void)YDImagePickerController:(YDImagePickerController *)imagePicker getSelectedPhoto:(NSMutableArray *)photos;

@end

@interface YDImagePickerController : CustomViewController

/** 被选择的照片asset url数组*/
@property (nonatomic, strong) NSMutableArray *selectPhotos;

/** 照片选择器的代理*/
@property (nonatomic,weak) id<YDImagePickerControllerDelegate> delegate;

@end
