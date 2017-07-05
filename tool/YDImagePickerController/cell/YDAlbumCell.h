//
//  YDAlbumCell.h
//  橙子
//
//  Created by Macbook Air on 15/11/8.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YDAlbumCell : UITableViewCell

/** 缩略图*/
@property (nonatomic ,weak) UIImageView *thumbnailView;

/** 专辑名字*/
@property (nonatomic ,weak) UILabel *albumLab;

/** 照片数量*/
@property (nonatomic ,weak) UILabel *photosCountLab;

/** 创建cell的方法*/
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
