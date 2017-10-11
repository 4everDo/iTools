//
//  TBaseModel.m
//  iTools
//
//  Created by admin on 2017/7/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TBaseModel.h"
#import "THttpManager.h"
#import "THttpBaseClass.h"
#import "TBaseEntity.h"

@interface TBaseModel ()
{
    THttpManager  *_manager;
    NSInteger     _status;
}
@end

@implementation TBaseModel

- (instancetype) init {
    self = [super init];
    if (self) {
        _pagenumber = 1;
        _limit = 20;
        [self setupManager];
    }
    return self;
}

- (void)setupManager {
    [self tool];
    _manager.t_base_url = [self BaseURL];
    _manager.tSecurityPolicy = [self SecurityPolicy];
    _manager.tHeaderFields = [self HeaderFields];
    _manager.tAuthorization = [self Authorization];
}

//可以重写  防止pageNumber  pageSize key不一样
- (NSString *)pageKey {
    return @"pageNum";
}

- (NSString *)pageSizeKey {
    return @"pageSize";
}

//返回缓存key
- (NSString *)cacheKey {
    return nil;
}

- (NSString *)statusKey {
    return @"";
}

- (NSString *)dataKey {
    return @"result";
}

#pragma mark  =====  请求所需
- (THttpManager *)tool {
    _manager = [THttpManager manager];
    return _manager;
}

- (TRequestMethodType)method {
    return TRequestMethodGET;
}

- (NSDictionary *)param {
    return [NSDictionary dictionary];
}

- (NSString *)requestUrl {
    return @"";
}

- (NSString *)BaseURL {
    return @"";
}
//Headers 非必需
- (NSDictionary *)HeaderFields {
    return @{};
}
//SSL 非必需
- (AFSecurityPolicy *)SecurityPolicy {
    return nil;
}
//Authorization 非必需
- (NSString *)Authorization {
    return @"";
}

#pragma mark  =====  方法实现
- (void)loadData:(void (^)())startBlock finishBlock:(void(^)(TBaseModel *model))finishBlock errorBlock:(void (^)(NSError *error))errorBlock {
    if (!self.isloading) {
        if (startBlock) {
            startBlock();
        }
        
        self.isloading = YES;
        
        NSMutableDictionary *param = [[NSMutableDictionary alloc] initWithDictionary:[self param]];
        [param setObject:@(_pagenumber) forKey:[self pageKey]];
        [param setObject:@(_limit) forKey:[self pageSizeKey]];
        
//TODO: 添加网络请求
        [_manager t_HttpManagerRequestMethod:[self method] URL:[self requestUrl] param:[self param] successComplate:^(NSDictionary *result) {
            self.isloading = NO;
            finishBlock([self phaseData:result]);
        } failComplate:^(NSError *error) {
            errorBlock(error);
        }];
    }
}

- (void)loadCache {
    
}

// 实体化数据
- (id)entityData:(id)data {
    return [TBaseEntity entityWithData:data];
}

- (id)phaseData:(id)data {
    _status = [[data objectForKey:[self statusKey]] integerValue];
    id tmpData = [data objectForKey:[self dataKey]]; // 目标数据
    // 若返回有问题
    if (_status != 200) {
        return self;
    }
    if (!tmpData || [tmpData isKindOfClass:[NSString class]]) {
        return self;
    }
    if ([tmpData count] < _limit) {
        _canLoadMore = NO;
    } else {
        _canLoadMore = YES;
    }
    
    if ([tmpData isKindOfClass:[NSArray class]]) {
        
        NSMutableArray *resultArray = [NSMutableArray array];
        
        for (id item in tmpData) {
            id entity = [self entityData:item];
            [resultArray addObject:entity];
        }
        
        if (_isloading) {
            self.data = resultArray;
            _isloading = NO;
        } else {
            NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:self.data];
            [tmpArray addObjectsFromArray:resultArray];
            self.data = tmpArray;
        }
    } else {
        self.data = [self entityData:tmpData];
    }
    
//    NSString *cacheKey = [self cacheKey];//是否缓存 待续
    
    
    return self;
}


@end
