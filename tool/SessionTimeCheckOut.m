//
//  SessionTimeCheckOut.m
//  风聆
//
//  Created by Jamm on 16/7/27.
//  Copyright © 2016年 风聆小镇工作室. All rights reserved.
//

#import "SessionTimeCheckOut.h"

@implementation SessionTimeCheckOut

+(BOOL)isSessionAvailable
{
    NSUserDefaults* userdefault=[NSUserDefaults standardUserDefaults];
    NSDate* date=[userdefault valueForKey:SESSION_UPDATE_TIME_KEY];
    if (date==nil) {
        return [SessionTimeCheckOut updateSessionTime];
    }
    else
    {
        NSDate* today=[NSDate date];
        NSTimeInterval interval=[today timeIntervalSinceDate:date];
        int hour=interval/3600;
        int day=hour/24;
        //if (interval<30) {
          if (day<=28) {
            return YES;
        }
    }
    return NO;
}

+(BOOL)updateSessionTime
{
    NSUserDefaults* userdefault=[NSUserDefaults standardUserDefaults];
    NSDate* today=[NSDate date];
    [userdefault setValue:today forKey:SESSION_UPDATE_TIME_KEY];
    return YES;
}

@end
