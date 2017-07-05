//
//  NSString+Extension.h
//  风聆
//
//  Created by iMac206 on 16/1/22.
//  Copyright © 2016年 Macbook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString(Extension)

/** 判断字符是否全为空格*/
- (BOOL)isBlankString;
//利用正则表达式验证是否邮箱地址
-(BOOL)isValidateEmail;
//是否11位数字
-(BOOL)is11PureNumber;
//是否可能是电话号码
-(BOOL)isPhoneNumberProbably;

/** 取出首尾的空格和换行*/
- (NSString *)removeSpaceAndNewline;

-(NSString *)md5;
-(NSString *)md5ForUTF16;
-(NSDictionary *)parametersFromURLString;
-(NSString*)stringWithFormatterDecimal;
-(NSString*)stringWithFormatterDecimalYuan;
+(NSString*)floatString:(float)value;
+(NSString*)floatString2:(float)value;
+(NSString*)integerString:(NSInteger)value;

@property (nonatomic,strong) NSURL* url;
@property (nonatomic,assign) NSInteger count;
@end
