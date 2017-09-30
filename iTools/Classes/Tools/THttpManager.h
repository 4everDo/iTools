//
//  THttpManager.h
//  iTools
//
//  Created by Mac on 2017/9/30.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "THttpBaseClass.h"

@interface THttpManager : THttpBaseClass

@property (nonatomic,assign) NSString  *t_base_url;

/**
 SSL  需要配置证书
 */

@property (nonatomic,strong) AFSecurityPolicy *tSecurityPolicy;
@property (nonatomic,strong) NSDictionary  *tHeaderFields;

@property (nonatomic,strong) NSString    *tAuthorization;

+ (THttpManager *)manager;

+ (NSURLSessionDataTask *)requestWithBody:(NSString *)body withUrl:(NSString *)url result:(void(^)(id resultObject))result failure:(void(^)(NSError *error))failure;

@end
