//
//  NSString+Category.m
//  iTools
//
//  Created by admin on 2017/7/28.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "NSString+Category.h"

#define IPHONE_VERSION [[UIDevice currentDevice] systemVersion].floatValue

@implementation NSString (Category)

- (BOOL)containsString:(NSString *)str{
    BOOL result = [self rangeOfString:str].location != NSNotFound;
    return result;
}

@end
