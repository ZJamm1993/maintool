//
//  YDAlbumCell.m
//  橙子
//
//  Created by Macbook Air on 15/11/8.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import "YDAlbumCell.h"

@implementation YDAlbumCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"YDAlbumCell";
    YDAlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[YDAlbumCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self != nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(10, 5, 50, 50);
        [self.contentView addSubview:imageView];
        self.thumbnailView = imageView;
        
        UILabel *albumLab = [[UILabel alloc] init];
        albumLab.frame = CGRectMake(70, 5, screenWidth, 30);
        [self.contentView  addSubview:albumLab];
        self.albumLab = albumLab;
        
        UILabel *photosCountLab = [[UILabel alloc] init];
        photosCountLab.frame = CGRectMake(70, 35, screenWidth, 20);
        photosCountLab.font = [UIFont systemFontOfSize:15];
        [self.contentView  addSubview:photosCountLab];
        self.photosCountLab = photosCountLab;
    }
    return self;
}


@end
