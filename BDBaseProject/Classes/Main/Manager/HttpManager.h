//
//  HttpManager.h
//  BDBaseProject
//
//  Created by 史国强 on 17/1/13.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface HttpUpLoadModel:NSObject

@property (nonatomic, copy) NSString *urlStr;
@property (nonatomic, strong) NSDictionary *parmas;
@property (nonatomic, strong) id imageData;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) NSString *mimeType;

+(instancetype)creatUpLoadModelWithUrlStr:(NSString *)urlStr parmas:(NSDictionary *)parmas imageData:(id)imageData name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType;

@end


@interface HttpManager : NSObject
+(instancetype)shareManager;//获取正常网络请求的单例
-(NSURLSessionDataTask *)postWithUrlStr:(NSString *)urlStr parmas:(NSDictionary *)parmas success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;
-(NSURLSessionDataTask *)getWithUrlStr:(NSString *)urlStr parmas:(NSDictionary *)parmas success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;
-(NSURLSessionDataTask *)putUpLoadModel:(HttpUpLoadModel *)model progress:(void (^)(NSProgress *))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure;
-(NSURLSessionDataTask *)putUpLoadModelArr:(NSArray <HttpUpLoadModel *>*)modelArr progress:(void (^)(NSProgress *))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure;

@end
