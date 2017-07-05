//
//  God.m
//  singleTest
//
//  Created by Macbook Air on 16/2/24.
//  Copyright © 2016年 iMac206. All rights reserved.
//

#import "God.h"

@implementation God

//* 用来保存唯一的单例对象
static id _instance;

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{   //onceToken是GCD用来记录是否执行过 ，如果已经执行过就不再执行(保证执行一次）
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (instancetype)manager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
    
//    return [[God alloc]init];
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _thisGuy        = [YDAccountTool account];
        if (!_thisGuy) {
            _thisGuy = [[YDaccount alloc] init];
        }
        else{
            _user_state     = _thisGuy.user_state;
            _user_name      = _thisGuy.user_name;
            _user_id        = _thisGuy.user_id;
            _password       = _thisGuy.password;
            _nick_name      = _thisGuy.nick_name;
            _portrait_url   = _thisGuy.portrait_url;
            _card_url       = _thisGuy.card_url;
            _introduce      = _thisGuy.introduce;
            _signature      = _thisGuy.signature;
            _sessionID      = _thisGuy.sessionID;
            _character      = _thisGuy.character;
            _true_name      = _thisGuy.true_name;
            _address        = _thisGuy.address;
            _tel_phone      = _thisGuy.tel_phone;
            _school         = _thisGuy.school;
            _grade          = _thisGuy.grade;
            _sex            = _thisGuy.sex;
            _email          = _thisGuy.email;
            _faculty        = _thisGuy.faculty;
            _isLogIn        = [_thisGuy.isLogIn boolValue];
        }
    }
    return self;
}

#pragma mark - 单例的方法
- (void)updateThisGuyToDatabase{
    [YDAccountTool save:self.thisGuy];
}

- (void)setThisGuy:(YDaccount *)thisGuy{
//     if (![thisGuy.user_state isEqualToString:@"null"] && ![thisGuy.user_state isEqualToString:@""] && thisGuy.user_state != nil) {
        _user_state= thisGuy.user_state;
        _thisGuy.user_state = thisGuy.user_state;
//     }
//     if (![thisGuy.user_name isEqualToString:@"null"] && ![thisGuy.user_name isEqualToString:@""] && thisGuy.user_name != nil) {
        _user_name = thisGuy.user_name;
        _thisGuy.user_name = thisGuy.user_name;
//     }
     if (![thisGuy.password isEqualToString:@"null"] && ![thisGuy.password isEqualToString:@""] && thisGuy.password != nil && (_thisGuy.password == nil || [_thisGuy.password isEqualToString:@""])) {
        _password = thisGuy.password;
        _thisGuy.password = thisGuy.password;
     }
//     if (![thisGuy.user_id isEqualToString:@"null"] && ![thisGuy.user_id isEqualToString:@""] && thisGuy.user_id != nil) {
        _user_id = thisGuy.user_id;
        _thisGuy.user_id = thisGuy.user_id;
//     }
//     if (![thisGuy.nick_name isEqualToString:@"null"] && ![thisGuy.nick_name isEqualToString:@""] && thisGuy.nick_name != nil) {
        _nick_name = thisGuy.nick_name;
        _thisGuy.nick_name = thisGuy.nick_name;
//     }
     if (![thisGuy.sessionID isEqualToString:@"null"] && ![thisGuy.sessionID isEqualToString:@""] && thisGuy.sessionID != nil) {
        _sessionID = thisGuy.sessionID;
        _thisGuy.sessionID = thisGuy.sessionID;
     }
//     if (![thisGuy.portrait_url isEqualToString:@"null"] && ![thisGuy.portrait_url isEqualToString:@""] && thisGuy.portrait_url != nil) {
        _portrait_url = thisGuy.portrait_url;
        _thisGuy.portrait_url = thisGuy.portrait_url;
//     }
//     if (![thisGuy.card_url isEqualToString:@"null"] && ![thisGuy.card_url isEqualToString:@""] && thisGuy.card_url != nil) {
        _card_url = thisGuy.card_url;
        _thisGuy.card_url = thisGuy.card_url;
//     }
//     if (![thisGuy.character isEqualToString:@"null"] && ![thisGuy.character isEqualToString:@""] && thisGuy.character != nil) {
        _character = thisGuy.character;
        _thisGuy.character = thisGuy.character;
//     }
//     if (![thisGuy.signature isEqualToString:@"null"] && ![thisGuy.signature isEqualToString:@""] && thisGuy.signature != nil) {
        _signature = thisGuy.signature;
        _thisGuy.signature = thisGuy.signature;
//     }
//     if (![thisGuy.introduce isEqualToString:@"null"] && ![thisGuy.introduce isEqualToString:@""] && thisGuy.introduce != nil) {
        _introduce = thisGuy.introduce;
        _thisGuy.introduce = thisGuy.introduce;
//     }
//     if (![thisGuy.faculty isEqualToString:@"null"] && ![thisGuy.faculty isEqualToString:@""] && thisGuy.faculty != nil) {
        _faculty = thisGuy.faculty;
        _thisGuy.faculty = thisGuy.faculty;
//     }
//     if (![thisGuy.school isEqualToString:@"null"] && ![thisGuy.school isEqualToString:@""] && thisGuy.school != nil) {
        _school = thisGuy.school;
        _thisGuy.school = thisGuy.school;
//     }
//     if (![thisGuy.sex isEqualToString:@"null"] && ![thisGuy.sex isEqualToString:@""] && thisGuy.sex != nil) {
        _sex = thisGuy.sex;
        _thisGuy.sex = thisGuy.sex;
//     }
//     if (![thisGuy.true_name isEqualToString:@"null"] && ![thisGuy.true_name isEqualToString:@""] && thisGuy.true_name != nil) {
        _thisGuy.true_name = thisGuy.true_name;
//     }
//     if (![thisGuy.address isEqualToString:@"null"] && ![thisGuy.address isEqualToString:@""] && thisGuy.address != nil) {
        _address = thisGuy.address;
        _thisGuy.address = thisGuy.address;
//     }
//     if (![thisGuy.true_name isEqualToString:@"null"] && ![thisGuy.true_name isEqualToString:@""] && thisGuy.true_name != nil) {
        _true_name = thisGuy.true_name;
        _thisGuy.true_name = thisGuy.true_name;
//     }
//     if (![thisGuy.tel_phone isEqualToString:@"null"] && ![thisGuy.tel_phone isEqualToString:@""] && thisGuy.tel_phone != nil) {
        _tel_phone = thisGuy.tel_phone;
        _thisGuy.tel_phone = thisGuy.tel_phone;
//     }
//     if (![thisGuy.email isEqualToString:@"null"] && ![thisGuy.email isEqualToString:@""] && thisGuy.email != nil) {
        _email = thisGuy.email;
        _thisGuy.email = thisGuy.email;
//     }
//     if (![thisGuy.grade isEqualToString:@"null"] && ![thisGuy.grade isEqualToString:@""] && thisGuy.grade != nil) {
        _grade = thisGuy.grade;
        _thisGuy.grade = thisGuy.grade;
//     }
    
    // 保存到本地文件
    [YDAccountTool save:_thisGuy];
}
#pragma mark - 保存单个属性
- (void)setUser_state:(NSNumber *)user_state{
    _user_state = user_state;
    self.thisGuy.user_state = user_state;
    [YDAccountTool save:self.thisGuy];
}
/** 用户帐号*/
- (void)setUser_name:(NSString *)user_name{
    _user_name = user_name;
    self.thisGuy.user_name = user_name;
    [YDAccountTool save:self.thisGuy];
}
/** 用户ID*/
- (void)setUser_id:(NSString *)user_id{
    _user_id = user_id;
    self.thisGuy.user_id = user_id;
    [YDAccountTool save:self.thisGuy];
}
/** 密码*/
- (void)setPassword:(NSString *)password{
    _password = password;
    self.thisGuy.password = password;
    [YDAccountTool save:self.thisGuy];
}
/** 昵称*/
- (void)setNick_name:(NSString *)nick_name{
    _nick_name = nick_name;
    self.thisGuy.nick_name = nick_name;
    [YDAccountTool save:self.thisGuy];
}
/** 头像url*/
- (void)setPortrait_url:(NSString *)portrait_url{
    _portrait_url = portrait_url;
    self.thisGuy.portrait_url = portrait_url;
    [YDAccountTool save:self.thisGuy];
}
/** 卡片url*/
- (void)setCard_url:(NSString *)card_url{
    _card_url = card_url;
    self.thisGuy.card_url = card_url;
    [YDAccountTool save:self.thisGuy];
}
/** 个人简介*/
- (void)setIntroduce:(NSString *)introduce{
    _introduce = introduce;
    self.thisGuy.introduce = introduce;
    [YDAccountTool save:self.thisGuy];
}
/** 个性签名*/
- (void)setSignature:(NSString *)signature{
    _signature = signature;
    self.thisGuy.signature = signature;
    [YDAccountTool save:self.thisGuy];
}
/** sessionid*/
- (void)setSessionID:(NSString *)sessionID{
    _sessionID = sessionID;
    self.thisGuy.sessionID = sessionID;
    [YDAccountTool save:self.thisGuy];
}
/** 身份*/
- (void)setCharacter:(NSString *)character{
    _character = character;
    self.thisGuy.character = character;
    [YDAccountTool save:self.thisGuy];
}
/** 真实姓名*/
- (void)setTrue_name:(NSString *)true_name{
    _true_name = true_name;
    self.thisGuy.true_name = true_name;
    [YDAccountTool save:self.thisGuy];
}
/** 地址*/
- (void)setAddress:(NSString *)address{
    _address = address;
    self.thisGuy.address = address;
    [YDAccountTool save:self.thisGuy];
}
/** 手机*/
- (void)setTel_phone:(NSString *)tel_phone{
    _tel_phone = tel_phone;
    self.thisGuy.tel_phone = tel_phone;
    [YDAccountTool save:self.thisGuy];
}
/** 学校*/
- (void)setSchool:(NSString *)school{
    _school = school;
    self.thisGuy.school = school;
    [YDAccountTool save:self.thisGuy];
}
/** 年级*/
- (void)setGrade:(NSString *)grade{
    _grade = grade;
    self.thisGuy.grade = grade;
    [YDAccountTool save:self.thisGuy];
}
/** 性别*/
- (void)setSex:(NSString *)sex{
    _sex = sex;
    self.thisGuy.sex = sex;
    [YDAccountTool save:self.thisGuy];
}
/** 邮箱*/
- (void)setEmail:(NSString *)email{
    _email = email;
    self.thisGuy.email = email;
    [YDAccountTool save:self.thisGuy];
}
/** 专业*/
- (void)setFaculty:(NSString *)faculty{
    _faculty = faculty;
    self.thisGuy.faculty = faculty;
    [YDAccountTool save:self.thisGuy];
}

- (void)setIsLogIn:(BOOL)isLogIn{
    _isLogIn = isLogIn;
    self.thisGuy.isLogIn = isLogIn ? @1 : @0;
    [YDAccountTool save:self.thisGuy];
}
@end
