//
//  MySearchBar.h
//  风聆
//
//  Created by iMac206 on 16/11/23.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MySearchBar;
@protocol MySearchBarDelegate <NSObject>

@optional

-(BOOL)searchBarShouldBeginEditing:(MySearchBar*)searchBar;
- (void)searchBarSearchButtonClicked:(MySearchBar *)searchBar;
- (void)searchBarCancelButtonClicked:(MySearchBar *)searchBar;

@end

@interface MySearchBar : UIView

@property (nonatomic,weak) id<MySearchBarDelegate> delegate;
@property (nonatomic,strong) NSString* placeholder;
@property (nonatomic,strong) NSString* text;
@property (nonatomic,assign) NSTextAlignment textAlignment;

@end
