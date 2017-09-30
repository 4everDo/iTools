//
//  THttpManager.m
//  iTools
//
//  Created by Mac on 2017/9/30.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "THttpManager.h"

static  NSInteger  timeOut = 20;

static  NSString   *_t_baseURL = @"";
static  NSString   *_t_authorization = @"";
static  NSDictionary  *_t_headerFields = nil;

@interface THttpManager ()
{
    AFSecurityPolicy  *_t_securityPolicy;
}
@end

@implementation THttpManager

+ (THttpManager *)manager {
    static THttpManager *tManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tManager = [[THttpManager alloc] init];
    });
    return tManager;
}

- (void)setupManager {
    [self.requestSerializer setTimeoutInterval:timeOut];
    
    AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    self.responseSerializer = responseSerializer;
    self.requestSerializer = [AFJSONRequestSerializer serializer];
}

- (void)setT_base_url:(NSString *)t_base_url {
    if (t_base_url) {
        _t_baseURL = t_base_url;
    }
}

- (void)setTSecurityPolicy:(AFSecurityPolicy *)tSecurityPolicy {
    if (tSecurityPolicy) {
        _t_securityPolicy = tSecurityPolicy;
    }
    self.securityPolicy = tSecurityPolicy;
}

- (void)setTHeaderFields:(NSDictionary *)tHeaderFields {
    if (tHeaderFields) {
        _t_headerFields = tHeaderFields;
    }
}

- (void)setTAuthorization:(NSString *)tAuthorization {
    if (tAuthorization) {
        _t_authorization = tAuthorization;
    }
}


+ (NSURLSessionDataTask *)requestWithBody:(NSString *)body withUrl:(NSString *)url result:(void(^)(id resultObject))result failure:(void(^)(NSError *error))failure {
    
    THttpManager *manager = (THttpManager *)[self manager];
    if (_t_authorization) {
        [manager.requestSerializer setValue:_t_authorization forHTTPHeaderField:@"Authorization"];
    }
    
    NSMutableURLRequest *request = [manager.requestSerializer requestWithMethod:@"POST" URLString:[NSString stringWithFormat:@"%@%@",_t_baseURL,url] parameters:nil error:nil];
    request.timeoutInterval = timeOut;
    if (_t_headerFields) {
        for (NSDictionary *dic in _t_headerFields) {
            [request setValue:dic.allValues[0] forHTTPHeaderField:dic.allKeys[0]];
        }
    }
    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask *task = [[self manager] dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (error) {
            failure(error);
        } else {
            result(responseObject);
        }
    }];
    
    [task resume];
    
    return task;
    
}

@end
