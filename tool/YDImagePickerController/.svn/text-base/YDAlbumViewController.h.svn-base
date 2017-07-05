//
//  YDAlbumViewController.h
//  橙子
//
//  Created by Macbook Air on 15/11/7.
//  Copyright © 2015年 Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@protocol YDAlbumViewControllerDelegate<NSObject>

-(void)selectAlbum:(ALAssetsGroup *)album;

@end

@interface YDAlbumViewController : UITableViewController

@property(nonatomic,assign) id<YDAlbumViewControllerDelegate> delegate;

@end
