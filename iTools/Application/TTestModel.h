//
//  TTestModel.h
//  iTools
//
//  Created by admin on 2017/9/20.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TBaseEntity.h"

@interface TTestSmailModel : TBaseEntity
@property (nonatomic,copy) NSString *key1;
@property (nonatomic,copy) NSString *key2;
@end


@interface TTestModel : TBaseEntity

@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign)  NSInteger  index;
@property (nonatomic,assign)  BOOL   status;
@property (nonatomic,copy) NSArray  *datasource;
@property (nonatomic,copy) NSDictionary  *dic;

- (TTestModel *)entityModel;

@end
