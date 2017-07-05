//
//  ZJDropMenu.h
//  ZJDropMenu
//
//  Created by Jamm on 16/4/16.
//  Copyright © 2016年 Jamm. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ZJDropMenuCollectionType) {
    ZJDropMenuCollectionTypePlain = 0,
    ZJDropMenuCollectionTypeGroup,
};
@class ZJDropMenu;
@protocol ZJDropMenuDataSource <NSObject>
@required
-(NSInteger)numberOfCollectionForMenu;
-(NSString*)titleForCollection:(NSInteger)num;
-(NSInteger)numberOfRowForCollection:(NSInteger)num;
-(ZJDropMenuCollectionType)typeForCollection:(NSInteger)num;
-(NSString*)titleForPlainRow:(NSInteger)row inCollection:(NSInteger)col;
-(NSString*)titleForGroupRow:(NSInteger)row inCollection:(NSInteger)col;
-(NSInteger)numberOfButtonForGroupRow:(NSInteger)row inCollection:(NSInteger)col;
-(NSString*)titleForButtonForGroupIndex:(NSInteger)ind row:(NSInteger)row col:(NSInteger)col;
@end

@class ZJDropMenu;
@protocol ZJDropMenuDelegate <NSObject>
@optional
-(void)dropMenuDidSelected:(NSDictionary*)dict;
@end

@interface ZJDropMenu : UIView
-(void)hideAllTables;
@property (nonatomic,weak)id<ZJDropMenuDataSource>datasource;
@property (nonatomic,weak)id<ZJDropMenuDelegate>delegate;
@end
