//
//  TTestModel.m
//  iTools
//
//  Created by admin on 2017/9/20.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TTestModel.h"

@implementation TTestModel

- (TTestModel *)entityModel {
    return [TTestModel entityWithData:@{@"name":@"你好",@"index":[NSNumber numberWithInteger:1],@"status":[NSNumber numberWithBool:1],@"datasource":@[@{@"key1":@"key1",@"key2":@"key1"},@{@"key1":@"key2",@"key2":@"key2"}]}];
}
@end
