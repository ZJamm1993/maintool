//
//  dictionaryCache.h
//  风聆
//
//  Created by Jamm on 16/3/19.
//  Copyright © 2016年 Macbook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dictionaryCache : NSObject

+(BOOL)writeArray:(NSArray*)array toPlistFile:(NSString*)fileName;
+(NSArray*)readArrayFromPlistFile:(NSString*)fileName;

@end
