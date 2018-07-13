//
//  HttpTool.m
//  mtxz
//
//  Created by 史国强 on 17/1/13.
//  Copyright © 2017年 hljc. All rights reserved.
//


#import "HttpTool.h"
#import <HYBHelperKit/NSObject+HYBHelperKit.h>
#import <YYCache/YYCache.h>
@implementation HttpTool

+ (void)get:(NSString *)url params:(NSDictionary *)params isNeedShowErrorMessage:(BOOL)isNeedShow success:(void (^)(id,BOOL))success failure:(void (^)(NSError *))failure
{
    NSMutableDictionary *mutableParams= [self getParmasWithDict:params];
    [[HttpManager shareManager] getWithUrlStr:url parmas:mutableParams success:^(id responseObj) {
        NSLog(@"%@",responseObj);
        if (success) {
            BOOL isSuccess = [self getPostIsSuccess:responseObj isNeedShowMessage:isNeedShow];
            success([responseObj hyb_filterNullNil],isSuccess);
        }
    } failure:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
        if (failure) {
            failure(error);
        }
        [self errorToast:isNeedShow error:error];
    }];
}
+ (void)post:(NSString *)url params:(NSDictionary *)params isNeedShowErrorMessage:(BOOL)isNeedShow success:(void (^)(id,BOOL))success failure:(void (^)(NSError *))failure
{
    NSMutableDictionary *mutableParams= [self getParmasWithDict:params];
    NSLog(@"请求的URL为:%@\n请求的参数为：\n%@",url,mutableParams);
    [[HttpManager shareManager] postWithUrlStr:url parmas:mutableParams success:^(id responseObj) {
        NSLog(@"URL为%@的返回结果为：\n%@",url,responseObj);
        if (success) {
            BOOL isSuccess = [self getPostIsSuccess:responseObj isNeedShowMessage:isNeedShow];
            success([responseObj hyb_filterNullNil],isSuccess);
        }
    } failure:^(NSError *error) {
        NSLog(@"URL为%@的请求失败信息为：%@",url,error.localizedDescription);
        if (failure) {
            failure(error);
        }
        [self errorToast:isNeedShow error:error];
    }];
}

+(void)post:(NSString *)url params:(NSDictionary *)params isCache:(BOOL)isCache isNeedShowErrorMessage:(BOOL)isNeedShow success:(void (^)(id,BOOL))success failure:(void (^)(NSError *))failure{
    NSMutableDictionary *mutableParams= [self getParmasWithDict:params];
    NSLog(@"请求的URL为:%@\n请求的参数为：\n%@",url,mutableParams);
    [[HttpManager shareManager] postWithUrlStr:url parmas:mutableParams success:^(id responseObj) {
        NSLog(@"URL为%@的返回结果为：\n%@",url,responseObj);
        if (success) {
            BOOL isSuccess = [self getPostIsSuccess:responseObj isNeedShowMessage:isNeedShow];
            success([responseObj hyb_filterNullNil],isSuccess);
            if (isCache && isSuccess) {
                YYCache *cache = [YYCache cacheWithName:@"NETCACHE"];
                cache.diskCache.countLimit = 50;
                NSString *dictStr = [mutableParams mj_JSONString];
                NSString *key = [url stringByAppendingString:dictStr];
                [cache setObject:responseObj forKey:key];
            }

        }
    } failure:^(NSError *error) {
        NSLog(@"URL为%@的请求失败信息为：%@",url,error.localizedDescription);
        if (isCache) {
            YYCache *cache = [YYCache cacheWithName:@"NETCACHE"];
            NSString *dictStr = [mutableParams mj_JSONString];
            NSString *key = [url stringByAppendingString:dictStr];
            id responseObj = [cache objectForKey:key];
            BOOL isSuccess = [self getPostIsSuccess:responseObj isNeedShowMessage:isNeedShow];
            if (isSuccess && responseObj) {
                success([responseObj hyb_filterNullNil],isSuccess);
                return;
            }
        }
        if (failure) {
            failure(error);
        }
        [self errorToast:isNeedShow error:error];
    }];
}

+(void)putUpLoadModel:(HttpUpLoadModel *)model isNeedShowErrorMessage:(BOOL)isNeedShow progress:(void (^)(NSProgress *))progress success:(void (^)(id,BOOL))success failure:(void (^)(NSError *))failure{
    NSMutableDictionary *mutableParams= [self getParmasWithDict:model.parmas];
    model.parmas = mutableParams;
    NSLog(@"请求的URL为:%@\n请求的参数为：\n%@",model.urlStr,mutableParams);
    [[HttpManager shareManager] putUpLoadModel:model progress:progress success:^(id responseObj) {
        NSLog(@"URL为%@的返回结果为：\n%@",model.urlStr,responseObj);
        if (success) {
            BOOL isSuccess = [self getPostIsSuccess:responseObj isNeedShowMessage:isNeedShow];
            success([responseObj hyb_filterNullNil],isSuccess);
        }

    } failure:^(NSError *error) {
        NSLog(@"URL为%@的请求失败信息为：%@",model.urlStr,error.localizedDescription);
        if (failure) {
            failure(error);
        }
        [self errorToast:isNeedShow error:error];
    }];
}

+(NSURLSessionDataTask *)putUpLoadModelArr:(NSArray<HttpUpLoadModel *> *)modelArr isNeedShowErrorMessage:(BOOL)isNeedShow progress:(void (^)(NSProgress *))progress success:(void (^)(id, BOOL))success failure:(void (^)(NSError *))failure{
    HttpUpLoadModel *model = modelArr.firstObject;
    NSMutableDictionary *mutableParams= [self getParmasWithDict:model.parmas];
    model.parmas = mutableParams;
    NSLog(@"请求的URL为:%@\n请求的参数为：\n%@",model.urlStr,mutableParams);
    return  [[HttpManager shareManager] putUpLoadModelArr:modelArr progress:progress success:^(id responseObj) {
        NSLog(@"URL为%@的返回结果为：\n%@",model.urlStr,responseObj);
        if (success) {
            BOOL isSuccess = [self getPostIsSuccess:responseObj isNeedShowMessage:isNeedShow];
            success([responseObj hyb_filterNullNil],isSuccess);
        }

    } failure:^(NSError *error) {
        NSLog(@"URL为%@的请求失败信息为：%@",model.urlStr,error.localizedDescription);
        if (failure) {
            failure(error);
        }
        [self errorToast:isNeedShow error:error];

    }];

}

+(NSMutableDictionary *)getParmasWithDict:(NSDictionary *)dict{
    if (!kIsDictionary(dict)) {
        dict = @{};
    }
    NSMutableDictionary *parmas = dict.mutableCopy;
    BDAccountManager *user = [BDAccountManager shareInstance];
    if (!kIsSafeString(user.token)) {
        parmas[@"token"] = user.token;
    }
    if (!kIsSafeString(user.phone)) {
        parmas[@"phone"] = user.phone;
    }
    return parmas;
}

+(BOOL)getPostIsSuccess:(id)responseObj isNeedShowMessage:(BOOL)isNeedShow{
    if (kIsDictionary(responseObj)) {
        NSNumber *status = responseObj[@"ErrCode"];
        if (status && status.integerValue == 0) {
            return YES;
        } else{
            
                NSString *message = responseObj[@"msg"];
                if (status && status.integerValue == 2) {//User not found
                    [MBProgressHUD add_showHUDWithTitle:kGetSafeString(message)];
                    [BDAccountManager cleanData];
                    return NO;
                }
                if (!kIsSafeString(message) && isNeedShow) {
                    [MBProgressHUD add_showHUDWithTitle:message];
                }
            }
    }
    return NO;
}

+(void)errorToast:(BOOL)isNeedShow error:(NSError *)error{
    if (!isNeedShow) {
        return;
    }
    NSString *message = @"网络错误";
    if (error.code == NSURLErrorTimedOut) {
        message = @"网络超时";
    } else if (error.code == NSURLErrorBadServerResponse){
        message = @"网络错误";
    }
    [MBProgressHUD add_showHUDWithTitle:message];
}
@end
