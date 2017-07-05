//
//  dictionaryCache.m
//  风聆
//
//  Created by Jamm on 16/3/19.
//  Copyright © 2016年 Macbook Air. All rights reserved.
//

#import "dictionaryCache.h"

@implementation dictionaryCache

+(BOOL)writeArray:(NSArray *)array toPlistFile:(NSString *)fileName
{
    NSString* filePath=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileName];
    YDLog(@"%@",filePath);
    NSFileManager* fm=[NSFileManager defaultManager];
    if(![fm fileExistsAtPath:filePath])
    {
        [fm createFileAtPath:filePath contents:nil attributes:nil];
    }
    return [array writeToFile:filePath atomically:YES];
}

+(NSArray*)readArrayFromPlistFile:(NSString *)fileName
{
    NSString* file=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileName];
    NSArray* array=[NSArray arrayWithContentsOfFile:file];
    return array;
}

@end
