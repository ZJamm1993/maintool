//
//  YDaccount.m
//  橙子
//
//  Created by Macbook Air on 15/8/29.
//  Copyright (c) 2015年 Macbook Air. All rights reserved.
//

#import "YDaccount.h"

@implementation YDaccount

-(NSString*)user_id
{
    if (_user_id.length==0) {
        _user_id=@"windbell";
        
        //在原来的user_id方法中,判断是否有user_id,
        //如果没有,则是访客,给定一个值。
    }
    return _user_id;
}

//-(NSString*)user_name
//{
//    if (_user_name.length==0) {
//        _user_name=@"访客";
//    }
//    return _user_name;
//}

-(BOOL)guest
{
    //如果user_id是上述的值,则是访客
    return ([self.user_id isEqualToString:@"windbell"]);
}

+ (instancetype)accountWithDict:(NSDictionary *)dict
{
    YDaccount *account = [[self alloc] init];
    account.user_name = dict[@"user_name"];
    account.password = dict[@"password"];
    account.user_id = dict[@"user_id"];
    account.nick_name = dict[@"nick_name"];
    account.sessionID = dict[@"sessionID"];
    account.portrait_url = dict[@"portrait"];
    account.card_url = dict[@"card_pic"];
    account.character = dict[@"role"];
    account.signature = dict[@"signature"];
    account.introduce = dict[@"introduce"];
//    int staute = [dict[@"user_state"] intValue];
//    if (staute==1||staute==2) {
//        account.user_state_int=staute;
//    }
    account.user_state = dict[@"user_state"];//staute == 1 ? STRING_ONLINE : (staute == 2 ? STRING_OFFLINE : STRING_BUSY);
    // 额外信息
    account.faculty = dict[@"faculty"];
    account.school = dict[@"school"];
    account.sex = dict[@"sex"];
    account.true_name = dict[@"true_name"];
    account.address = dict[@"address"];
    account.tel_phone = dict[@"tel_phone"];
    account.email = dict[@"email"];
    account.grade = dict[@"grade"];
    return account;
}

/**
 *  当从文件中解析出一个对象的时候调用
 *  在这个方法中写清楚：怎么解析文件中的数据
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        // 基本信息
        self.user_name      = [decoder decodeObjectForKey:@"user_name"];
        self.password       = [decoder decodeObjectForKey:@"password"];
        self.user_id        = [decoder decodeObjectForKey:@"user_id"];
        self.nick_name      = [decoder decodeObjectForKey:@"nick_name"];
        self.sessionID      = [decoder decodeObjectForKey:@"sessionID"];
        self.portrait_url   = [decoder decodeObjectForKey:@"portrait"];
        self.card_url       = [decoder decodeObjectForKey:@"card_pic"];
        self.character      = [decoder decodeObjectForKey:@"role"];
        self.signature      = [decoder decodeObjectForKey:@"signature"];
        self.introduce      = [decoder decodeObjectForKey:@"introduce"];
//        self.user_state_int=[[decoder decodeObjectForKey:@"user_state_int"]intValue];
        self.user_state     = [decoder decodeObjectForKey:@"user_state"];
        // 额外信息
        self.faculty = [decoder decodeObjectForKey:@"faculty"];
        self.school = [decoder decodeObjectForKey:@"school"];
        self.sex = [decoder decodeObjectForKey:@"sex"];
        self.true_name = [decoder decodeObjectForKey:@"true_name"];
        self.address = [decoder decodeObjectForKey:@"address"];
        self.tel_phone = [decoder decodeObjectForKey:@"tel_phone"];
        self.email = [decoder decodeObjectForKey:@"email"];
        self.grade = [decoder decodeObjectForKey:@"grade"];
        // app 配置信息
//        self.soundEnabled = [decoder decodeObjectForKey:@"soundEnabled"];
//        self.vibrateEnabled = [decoder decodeObjectForKey:@"vibrateEnabled"];
        self.isLogIn=[decoder decodeObjectForKey:@"isLogIn"];
    }
    return self;
}

/**
 *  将对象写入文件时调用
 *  在这个方法中写清楚：要存储哪些对象，以及怎样存储属性
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    // 基本信息
    [encoder encodeObject:self.user_name forKey:@"user_name"];
    [encoder encodeObject:self.password forKey:@"password"];
    [encoder encodeObject:self.user_id forKey:@"user_id"];
    [encoder encodeObject:self.nick_name forKey:@"nick_name"];
    [encoder encodeObject:self.sessionID forKey:@"sessionID"];
    [encoder encodeObject:self.portrait_url forKey:@"portrait"];
    [encoder encodeObject:self.card_url forKey:@"card_pic"];
    [encoder encodeObject:self.character forKey:@"role"];
    [encoder encodeObject:self.signature forKey:@"signature"];
    [encoder encodeObject:self.introduce forKey:@"introduce"];
//    [encoder encodeObject:[NSNumber numberWithInt:self.user_state_int] forKey:@"user_state_int"];
    [encoder encodeObject:self.user_state forKey:@"user_state"];
    // 额外信息
    [encoder encodeObject:self.faculty forKey:@"faculty"];
    [encoder encodeObject:self.school forKey:@"school"];
    [encoder encodeObject:self.sex forKey:@"sex"];
    [encoder encodeObject:self.true_name forKey:@"true_name"];
    [encoder encodeObject:self.address forKey:@"address"];
    [encoder encodeObject:self.tel_phone forKey:@"tel_phone"];
    [encoder encodeObject:self.email forKey:@"email"];
    [encoder encodeObject:self.grade forKey:@"grade"];
    // app 配置信息
//    [encoder encodeObject:self.soundEnabled forKey:@"soundEnabled"];
//    [encoder encodeObject:self.vibrateEnabled forKey:@"vibrateEnabled"];
    [encoder encodeObject:self.isLogIn forKey:@"isLogIn"];
    
    YDLog(@"存储来账号信息");
}
@end
