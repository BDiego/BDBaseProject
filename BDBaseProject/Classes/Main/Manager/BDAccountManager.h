//
//  BDAccountManager.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDAccountManager : NSObject

@property (nonatomic, copy, readonly) NSString *isLogin;

@property (nonatomic, copy, readonly) NSString *token;
@property (nonatomic, copy, readonly) NSString *phone;

@property (nonatomic ,copy, readonly) NSString * name;//名字
@property (nonatomic ,copy, readonly) NSString * sex;//性别
@property (nonatomic ,copy, readonly) NSString * idNumber;//身份证
@property (nonatomic ,copy, readonly) NSString * phoneNumber;//电话
@property (nonatomic ,copy, readonly) NSString * vendor;//车厂
@property (nonatomic ,copy, readonly) NSString * type;//产品型号
@property (nonatomic ,copy, readonly) NSString * batteryNumber;//电池编号
@property (nonatomic ,copy, readonly) NSString * motorNumber;//发动机编号
@property (nonatomic ,copy, readonly) NSString * photourl;//备案电动车照片
@property (nonatomic ,copy, readonly) NSString * code;//车架号
@property (nonatomic ,copy, readonly) NSString * licenseNumber;//车牌号
@property (nonatomic ,copy, readonly) NSString * iotImei;//芯片编号

//更新用户单个属性信息
+ (BOOL)setObject:(NSString *)obj forKey:(NSString *)key;
//更新用户信息 eg {uid:"123",token:"1234"}
+(void)setUserInfoWithDict:(NSDictionary *)dict;
//清除数据
+(void)cleanData;
+(void)getUserInfoFromNetCompleteBlock:(void(^)(BOOL isSuccess))block;

+ (instancetype)shareInstance;

@end
