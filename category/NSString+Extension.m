//
//  NSString+Extension.m
//  风聆
//
//  Created by iMac206 on 16/1/22.
//  Copyright © 2016年 Macbook Air. All rights reserved.
//

#import "NSString+Extension.h"
static NSNumberFormatter* formatter;
@implementation NSString(Extension)

- (BOOL)isBlankString{
    if (self == nil) {
        return YES;
    }
    
    if (self == NULL) {
        return YES;
    }
    
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

//利用正则表达式验证
-(BOOL)isValidateEmail {
    if (self.length==0) {
        return NO;
    }
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

-(BOOL)is11PureNumber
{
    if (self.length!=11) {
        return NO;
    }
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

-(BOOL)isPhoneNumberProbably
{
    if(self.length==0)
    {
        return NO;
    }
    
    NSString* mobileNum=self;
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,177,180,189
     22         */
    NSString * CT = @"^1((33|53|77|8[09])[0-9]|349)\\d{7}$";
    
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestPHS = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    if(([regextestmobile evaluateWithObject:mobileNum] == YES)
       || ([regextestcm evaluateWithObject:mobileNum] == YES)
       || ([regextestct evaluateWithObject:mobileNum] == YES)
       || ([regextestcu evaluateWithObject:mobileNum] == YES)
       || ([regextestPHS evaluateWithObject:mobileNum] == YES)){
        return YES;
    }else{
        return NO;
    }
}

- (NSString *)removeSpaceAndNewline{
    NSString *string = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return string;
}

//普通的MD5加密
- (NSString *)md5 {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (int)strlen(cStr), result);
//    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
//            result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
//            result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]];
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02x", result[i]];
    return [hash lowercaseString];
}

//UTF16的MD5加密
- (NSString *)md5ForUTF16{
    NSData *temp = [self dataUsingEncoding:NSUTF16LittleEndianStringEncoding];
    
    UInt8 *cStr = (UInt8 *)[temp bytes];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (int)[temp length], result);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]];
}

-(NSDictionary*)parametersFromURLString
{
    NSMutableDictionary* mutaDict=[NSMutableDictionary dictionary];
    NSArray* params=[self componentsSeparatedByString:@"?"];
    NSString* paramsString=[params lastObject];
    NSArray* paramArray=[paramsString componentsSeparatedByString:@"&"];
    for(NSString * string in paramArray)
    {
        NSArray* array=[string componentsSeparatedByString:@"="];
        [mutaDict setValue:[array lastObject] forKey:array[0]];
    }
    NSDictionary *dict=mutaDict;
    return dict;
}

-(NSString*)stringWithFormatterDecimal
{
    if (self==nil) {
        return @"";
    }
    if(formatter==nil)
    {
        formatter=[[NSNumberFormatter alloc]init];
        formatter.numberStyle=NSNumberFormatterDecimalStyle;
    }
    CGFloat value=[self doubleValue];
    NSString* formatterString=[formatter stringFromNumber:[NSNumber numberWithDouble:value]];
    return formatterString;
}

-(NSString*)stringWithFormatterDecimalYuan
{
    NSString* string=[self stringWithFormatterDecimal];
    return [NSString stringWithFormat:@"%@  元",string];
}

+(NSString*)floatString:(float)value
{
    return [NSString stringWithFormat:@"%.0f",value];
}

+(NSString*)floatString2:(float)value
{
    return [NSString stringWithFormat:@"%.2f",value];
}

+(NSString*)integerString:(NSInteger)value
{
    return [NSString stringWithFormat:@"%ld",(long)value];
}

-(NSURL*)url
{
    return [NSURL URLWithString:self];
}

-(void)setUrl:(NSURL *)url
{
    
}

-(NSInteger)count
{
    return self.length;
}

-(void)setCount:(NSInteger)count
{
    
}

@end
