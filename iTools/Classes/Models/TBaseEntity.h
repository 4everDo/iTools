//
//  TBaseEntity.h
//  iTools
//
//  Created by admin on 2017/9/20.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBaseEntity : NSObject<NSCoding>

+ (TBaseEntity *)entityWithData:(id)data;

@end
