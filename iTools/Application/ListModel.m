//
//  ListModel.m
//  iTools
//
//  Created by Mac on 2017/10/16.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel

- (TRequestMethodType)method {
    return TRequestMethodGET;
}

- (NSString *)requestUrl {
    return @"/api/v2/userAreaRelation/list";
}

- (id)phaseData:(id)data {
    NSLog(@"data  === %@",data);
    return data;
}

@end
