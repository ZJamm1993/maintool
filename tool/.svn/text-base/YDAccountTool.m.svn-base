//
//  YDAccountTool.m
//  橙子
//
//  Created by Macbook Air on 15/8/29.
//  Copyright (c) 2015年 Macbook Air. All rights reserved.
//

#define YDaccountFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.Data"]

#import "YDAccountTool.h"
#import "YDaccount.h"
@implementation YDAccountTool

/** 归档存储用户资料*/
+ (void)save:(YDaccount *)account
{
    //归档
    [NSKeyedArchiver archiveRootObject:account toFile:YDaccountFilepath];
}

+(void)deleteAccount
{
    YDaccount* acc=[[YDaccount alloc]init];
    [YDAccountTool save:acc];
    [[God manager]setThisGuy:acc];
}

/** 解档取出用户资料。*/
+ (YDaccount *)account
{
    YDaccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:YDaccountFilepath];
//    YDLog(@"%@",YDaccountFilepath);
    if(account==nil)
    {
        return [[YDaccount alloc]init];
    }
    return account;
}
@end
