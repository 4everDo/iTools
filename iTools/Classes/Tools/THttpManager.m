//
//  THttpManager.m
//  iTools
//
//  Created by Mac on 2017/9/30.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "THttpManager.h"

static  NSInteger  timeOut = 20;

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
    
    [manager t_HttpManagerRequestMethod:type URL:url param:param successComplate:^(NSDictionary *result) {
        resultComplate(result);
    } failComplate:^(NSError *error) {
        failure(error);
    }];
}


@end
