//
//  NSDictionary+Category.h
//  talk
//
//  Created by iMac206 on 16/9/2.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Category)

/*
 仅在字典中包含success键的时候使用
 */
-(BOOL)success;
-(NSString*)msg;
-(void)nslog;
@property (nonatomic,assign) NSInteger length;

@end
