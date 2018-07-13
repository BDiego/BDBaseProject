//
//  BDAccountManager.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "BDAccountManager.h"
#import "AppDelegate.h"

@implementation BDAccountManager

+ (instancetype)shareInstance {
    static BDAccountManager *_accountMgr;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _accountMgr = [[BDAccountManager alloc] init];
    });
    
    return _accountMgr;
}

+(void)setUserInfoWithDict:(NSDictionary *)dict{
    if (!kIsDictionary(dict)) {
        return;
    }
    NSMutableArray *allNames = [[NSMutableArray alloc] init];
    unsigned int propertyCount = 0;
    objc_property_t *propertys = class_copyPropertyList([self class], &propertyCount);
    for (int i = 0; i < propertyCount; i ++) {
        objc_property_t property = propertys[i];
        const char * propertyName = property_getName(property);
        [allNames addObject:[NSString stringWithUTF8String:propertyName]];
    }
    free(propertys);
    NSArray *allKeys = dict.allKeys;
    for (NSString *str in allKeys) {
        if ([allNames containsObject:str]) {
            [BDAccountManager setObject:dict[str] forKey:str];
        }
    }
}

+(void)cleanData{
    NSMutableArray *allNames = [[NSMutableArray alloc] init];
    unsigned int propertyCount = 0;
    objc_property_t *propertys = class_copyPropertyList([self class], &propertyCount);
    for (int i = 0; i < propertyCount; i ++) {
        objc_property_t property = propertys[i];
        const char * propertyName = property_getName(property);
        [allNames addObject:[NSString stringWithUTF8String:propertyName]];
    }
    free(propertys);
    for (NSString *key in allNames) {
        [BDAccountManager setObject:@"" forKey:key];
    }
    //[kAppDelegate configRootVC];
}

+ (BOOL)setObject:(NSString *)obj forKey:(NSString *)key {
    if ([obj isKindOfClass:[NSNumber class]]) {
        obj = [NSString stringWithFormat:@"%@",obj];
    }
    [kUserDefaults setObject:kGetSafeString(obj) forKey:[NSString stringWithFormat:@"user_%@", key]];
    return [kUserDefaults synchronize];
}

+(void)getUserInfoFromNetCompleteBlock:(void(^)(BOOL isSuccess))block{
    [HttpTool post:nil params:nil isNeedShowErrorMessage:YES success:^(id responseObj, BOOL isSuccess) {
        if ([responseObj[@"ErrCode"] integerValue] == 0) {
            [BDAccountManager setUserInfoWithDict:responseObj[@"user"]];
        }
        block(isSuccess);
    } failure:^(NSError *error) {
        block(NO);
    }];
}
- (NSString *)phone {
    return kGetSafeString((NSString *)[kUserDefaults objectForKey:@"user_phone"]);
}
- (NSString *)token{
    return kGetSafeString((NSString *)[kUserDefaults objectForKey:@"user_token"]);
}

- (NSString *)isLogin{
    return kGetSafeString((NSString *)[kUserDefaults objectForKey:@"user_isLogin"]);
}

//备案信息
- (NSString *)name{
    return kGetSafeString((NSString *)[kUserDefaults objectForKey:@"user_name"]);
}
- (NSString *)sex{
    return kGetSafeString((NSString *)[kUserDefaults objectForKey:@"user_sex"]);
}
- (NSString *)idNumber{
    return kGetSafeString((NSString *)[kUserDefaults objectForKey:@"user_idNumber"]);
}
- (NSString *)phoneNumber{
    return kGetSafeString((NSString *)[kUserDefaults objectForKey:@"user_phoneNumber"]);
}
- (NSString *)vendor{
    return kGetSafeString((NSString *)[kUserDefaults objectForKey:@"user_vendor"]);
}
- (NSString *)type{
    return kGetSafeString((NSString *)[kUserDefaults objectForKey:@"user_type"]);
}
- (NSString *)batteryNumber{
    return kGetSafeString((NSString *)[kUserDefaults objectForKey:@"user_batteryNumber"]);
}
- (NSString *)motorNumber{
    return kGetSafeString((NSString *)[kUserDefaults objectForKey:@"user_motorNumber"]);
}
- (NSString *)photourl{
    return kGetSafeString((NSString *)[kUserDefaults objectForKey:@"user_photourl"]);
}
- (NSString *)code{
    return kGetSafeString((NSString *)[kUserDefaults objectForKey:@"user_code"]);
}
- (NSString *)licenseNumber{
    return kGetSafeString((NSString *)[kUserDefaults objectForKey:@"user_licenseNumber"]);
}
- (NSString *)iotImei{
    return kGetSafeString((NSString *)[kUserDefaults objectForKey:@"user_iotImei"]);
}


@end
