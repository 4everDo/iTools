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
static  NSArray    *_t_headerFields = nil;

@interface THttpManager ()
{
    AFSecurityPolicy  *_t_securityPolicy;
}
@end

@implementation THttpManager

+ (THttpManager *)shareSingletenManager {
    static THttpManager *tManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tManager = [[THttpManager alloc] init];
        [tManager setupManager];
    });
    return tManager;
}

- (void)setupManager {
    [self.requestSerializer setTimeoutInterval:timeOut];
    
    AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    self.responseSerializer = responseSerializer;
    self.requestSerializer = [AFJSONRequestSerializer serializer];
}
- (AFSecurityPolicy *)buildCustomSecurityPolicy {
    NSString * cerPath = [[NSBundle mainBundle] pathForResource:@"project" ofType:@"cer"];
    NSData * certData = [NSData dataWithContentsOfFile:cerPath];
    NSSet * certDataSet = [[NSSet alloc] initWithObjects:certData, nil];
    AFSecurityPolicy * securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    securityPolicy.pinnedCertificates = certDataSet;
    return securityPolicy;
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

- (void)setTHeaderFields:(NSArray *)tHeaderFields {
    if (tHeaderFields) {
        _t_headerFields = tHeaderFields;
    }
}

- (void)setTAuthorization:(NSString *)tAuthorization {
    if (tAuthorization) {
        _t_authorization = tAuthorization;
    }
}

+ (void)requestWithUrl:(NSString *)url withParam:(NSDictionary *)param type:(TRequestMethodType)type result:(void(^)(id resultObject))resultComplate failure:(void(^)(NSError *error))failure {
    THttpManager *manager = (THttpManager *)[self shareSingletenManager];
    if (_t_authorization.length > 0) {
        [manager.requestSerializer setValue:_t_authorization forHTTPHeaderField:@"Authorization"];
    }
    
    [manager t_HttpManagerRequestMethod:type URL:[NSString stringWithFormat:@"%@%@",_t_baseURL,url] param:param successComplate:^(NSDictionary *result) {
        TLog(@"result  ====  %@",result);
        resultComplate(result);
    } failComplate:^(NSError *error) {
        failure(error);
    }];
    
    return;
    NSMutableURLRequest *request = [manager.requestSerializer requestWithMethod:@"GET" URLString:[NSString stringWithFormat:@"%@%@",_t_baseURL,url] parameters:param error:nil];
    request.timeoutInterval = timeOut;
    if (_t_headerFields) {
        for (NSDictionary *dic in _t_headerFields) {
            [request setValue:dic.allValues[0] forHTTPHeaderField:dic.allKeys[0]];
        }
    }
    
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            failure(error);
        }else{
            resultComplate(responseObject);
        }
    }];
    [task resume];
}


@end
