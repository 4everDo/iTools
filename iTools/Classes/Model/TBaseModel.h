//
//  TBaseModel.h
//  iTools
//
//  Created by admin on 2017/7/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBaseModel : NSObject

@property (nonatomic,strong) id data;

@property (nonatomic) NSInteger limit;
@property (nonatomic) NSInteger pagenumber;

@property (nonatomic) BOOL  canLoadMore;
@property (nonatomic) BOOL  isloading;

- (void)loadData:(void (^)())startBlock finishBlock:(void(^)(TBaseModel *model))finishBlock errorBlock:(void (^)(NSError *error))errorBlock;

- (void)loadCache;

- (NSString *)cacheKey;

    
@end
