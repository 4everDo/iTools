//
//  TBaseModel.h
//  iTools
//
//  Created by admin on 2017/7/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface TBaseModel : NSObject

@property (nonatomic,strong) id data;

@property (nonatomic) NSInteger limit;
@property (nonatomic) NSInteger pagenumber;

@property (nonatomic) BOOL  canLoadMore;
@property (nonatomic) BOOL  isloading;

- (void)loadData:(void (^)())startBlock finishBlock:(void(^)(TBaseModel *model))finishBlock errorBlock:(void (^)(NSError *error))errorBlock;

- (void)loadCache;

- (NSString *)cacheKey;

#pragma mark ====  重写方法 配置请求 例如SSL

#pragma mark  必须
//域名
- (NSString *)BaseURL;
#pragma mark  非必须
//Headers 非必需
- (NSDictionary *)HeaderFields;
//SSL 非必需
- (AFSecurityPolicy *)SecurityPolicy;
//Authorization 非必需
- (NSString *)Authorization;

@end
