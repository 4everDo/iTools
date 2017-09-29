//
//  TBaseModel.m
//  iTools
//
//  Created by admin on 2017/7/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TBaseModel.h"
#import "THttpManager.h"

@interface TBaseModel ()
{
    
}
@end

@implementation TBaseModel

- (instancetype) init {
    self = [super init];
    if (self) {
        _pagenumber = 1;
        _limit = 20;
    }
    return self;
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

#pragma mark  =====  请求所需
- (THttpManager *)tool {
    return [THttpManager shareSingletenManager];
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
        
        
    }
}

- (void)loadCache {
    
}

@end
