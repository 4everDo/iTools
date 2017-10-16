//
//  TNetMiddleware.m
//  iTools
//
//  Created by Mac on 2017/10/11.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TNetMiddleware.h"

@implementation TNetMiddleware

- (instancetype)init {
    self = [super init];
    return self;
}
- (NSString *)statusKey {
    return @"code";
}

- (NSString *)BaseURL{
    return @"https://service.gogen.cn:8888";
}
//SSL 非必需
- (AFSecurityPolicy *)SecurityPolicy {
    NSString * cerPath = [[NSBundle mainBundle] pathForResource:@"project" ofType:@"cer"];
    NSData * certData = [NSData dataWithContentsOfFile:cerPath];
    NSSet * certDataSet = [[NSSet alloc] initWithObjects:certData, nil];
    AFSecurityPolicy * securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];

    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    securityPolicy.pinnedCertificates = certDataSet;
    return securityPolicy;
}
//Authorization 非必需
- (NSString *)Authorization {
    NSString *string = [NSString stringWithFormat:@"Bearer %@",@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4MjM0ODExNDMsImN1clV1aWQiOiIwZjA0MjUzMGIxZDNmMDFlNTY3YWU4NTM3YzFmZDVhOSJ9.mkBvpto6iy5oZ973YJrhf_HAu10oKlfi_WJ_d5nt3qk"];
    return string;
}


@end
