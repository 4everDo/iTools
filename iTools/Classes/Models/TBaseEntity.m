//
//  TBaseEntity.m
//  iTools
//
//  Created by admin on 2017/9/20.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TBaseEntity.h"
#import <objc/runtime.h>

@implementation TBaseEntity

+ (TBaseEntity *)entityWithData:(id)data {
    TBaseEntity *entity = [[self alloc] init];
    [entity analyzeEntityWithData:data];
    return entity;
}

- (void)analyzeEntityWithData:(id)data {
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t pp = properties[i];
        
        NSString *propertyName = [NSString stringWithCString:property_getName(pp) encoding:NSUTF8StringEncoding];
        id valueData = [data objectForKey:[self filterString:propertyName]];
        if (!valueData || [valueData isKindOfClass:[NSNull class]]) {
            continue;
        }
        
        Class c = [self getPropertyClass:pp];
        
        if ([c isSubclassOfClass:[NSArray class]]) {
            [self setValue:[self recursionArray:valueData forProperty:propertyName] forKey:propertyName];
        }else if ([c isSubclassOfClass:[TBaseEntity class]]) {
            TBaseEntity *entity = [[TBaseEntity alloc] init];
            [entity analyzeEntityWithData:data];
            [self setValue:entity forKey:propertyName];
        }else {
            [self setValue:[data objectForKey:propertyName] forKey:propertyName];
        }
        
    }
    free(properties);
}

- (Class)getPropertyClass:(objc_property_t)property {
    NSString *pName = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
    NSArray *tempArray = [pName componentsSeparatedByString:@"\""];
    if (!tempArray || tempArray.count <= 1) {
        return Nil;
    }
    pName = [pName componentsSeparatedByString:@"\""][1];
    
    NSString *projectName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleExecutable"];
    
    NSRange range = [pName rangeOfString:projectName];
    if (range.length > 0) {
        pName = [pName substringFromIndex:range.location + range.length];
    }
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    pName = [pName stringByTrimmingCharactersInSet:set];
    return NSClassFromString(pName);
}

- (NSArray *)recursionArray:(NSArray *)array forProperty:(NSString *)propertyName {
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:array];
    
    for (int i = 0; i < array.count; i++) {
        id item = array[i];
        if ([item isKindOfClass:[NSArray class]]) {
            [tempArray replaceObjectAtIndex:i withObject:[self recursionArray:item forProperty:propertyName]];
        } else {
            id otherEntity = [[TBaseEntity alloc] init];
            [otherEntity entityWithData:item];
            [tempArray replaceObjectAtIndex:i withObject:otherEntity];
        }
    }
    return tempArray;
}

- (NSString *)filterString:(NSString *)string {
    if ([string hasPrefix:@"r_"]) {
        return [string substringFromIndex:2];
    }
    return string;
}

- (NSMutableDictionary *)getEntityAllPropertys {
    NSMutableDictionary *param = [[NSMutableDictionary alloc] initWithCapacity:0];
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        objc_property_t p = properties[i];
        NSString *propertyName = [NSString stringWithCString:property_getName(p) encoding:NSUTF8StringEncoding];
        
        id value = [self valueForKey:propertyName];
        Class cls = [self getPropertyClass:p];
        
        if ([cls isSubclassOfClass:[NSArray class]]) {
            NSMutableArray *tempArray = [NSMutableArray array];
            for (id item in value) {
                if ([item isKindOfClass:[TBaseEntity class]]) {
                    NSMutableDictionary *tempDic = [(TBaseEntity *)item getEntityAllPropertys];
                    [tempArray addObject:tempDic];
                } else {
                    [tempArray addObject:item];
                }
            }
            [param setValue:tempArray forKey:[self filterString:propertyName]];
        } else if ([cls isSubclassOfClass:[TBaseEntity class]]) {
            NSMutableDictionary *tempDic = [value getEntityAllPropertys];
            [param setValue:tempDic forKey:[self filterString:propertyName]];
        } else {
            [param setValue:value forKey:[self filterString:propertyName]];
        }
    }
    free(properties);
    return param;
}


#define mark  实现NSCoding协议

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:[self getEntityAllPropertys] forKey:@"aCoder"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    [self analyzeEntityWithData:[aDecoder decodeObjectForKey:@"aCoder"]];
    return self;
}

@end
