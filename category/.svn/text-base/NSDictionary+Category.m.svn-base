//
//  NSDictionary+Category.m
//  talk
//
//  Created by iMac206 on 16/9/2.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import "NSDictionary+Category.h"

@implementation NSDictionary (Category)

-(BOOL)success
{
    BOOL suc=[[self valueForKey:@"success"]boolValue];
    if (suc) {
        return suc;
    }
    else
    {
        NSDictionary* data=[self valueForKey:@"data"];
        return data.count>0;
    }
}

-(NSString*)msg
{
    return [self valueForKey:@"msg"];
}

-(void)nslog
{
    NSLog(@"%@",self);
}

-(NSInteger)length
{
    return self.count;
}

-(void)setLength:(NSInteger)length
{
    
}

@end
