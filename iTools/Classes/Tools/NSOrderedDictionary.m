//
//  NSOrderedDictionary.m
//  GCD
//
//  Created by chengbin on 15/8/11.
//  Copyright (c) 2015年 chengbin. All rights reserved.
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
#import "NSOrderedDictionary.h"
#import <Availability.h>
#import <libkern/OSAtomic.h>

#if !__has_feature(objc_arc)
#error This file must be compiled with ARC. Convert your project to ARC or specify the -fobjc-arc flag.
#endif

@implementation NSOrderedDictionary
{
@protected  //@protected:Only be the class and inheritance class can use.
    NSArray      *_values;
    NSOrderedSet *_keys;
}

+ (instancetype)dictionaryWithContentsOfFile:(NSString *)path
{
    return [self dictionaryWithDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
}

+ (instancetype)dictionaryWithContentsOfURL:(NSURL *)url
{
    return [self dictionaryWithDictionary:[NSDictionary dictionaryWithContentsOfURL:url]];
}

- (instancetype)initWithContentsOfFile:(NSString *)path
{
    return [self initWithDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
}

- (instancetype)initWithContentsOfURL:(NSURL *)url
{
    return [self initWithDictionary:[NSDictionary dictionaryWithContentsOfURL:url]];
}

- (instancetype)initWithObjects:(NSArray *)objects forKeys:(NSArray *)keys
{
    if ((self = [super init]))
    {
        _values = [objects copy];
        _keys = [NSOrderedSet orderedSetWithArray:keys];
        
        NSParameterAssert([_keys count] == [_values count]);
    }
    return self;
}

- (instancetype)initWithObjects:(const __unsafe_unretained id [])objects forKeys:(const __unsafe_unretained id <NSCopying> [])keys count:(NSUInteger)count
{
    if ((self = [super init]))
    {
        _values = [[NSArray alloc] initWithObjects:objects count:count];
        _keys = [[NSOrderedSet alloc] initWithObjects:keys count:count];
        
        NSParameterAssert([_values count] == count);
        NSParameterAssert([_keys count] == count);
    }
    return self;
}

- (Class)classForCoder
{
    return [self class];
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init]))
    {
        _values = [decoder decodeObjectOfClass:[NSArray class] forKey:@"values"];
        _keys = [decoder decodeObjectOfClass:[NSOrderedSet class] forKey:@"keys"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:_values forKey:@"values"];
    [coder encodeObject:_keys forKey:@"keys"];
}

- (instancetype)copyWithZone:(__unused NSZone *)zone
{
    return self;
}

- (instancetype)mutableCopyWithZone:(NSZone *)zone
{
    return [[NSMutableOrderedDictionary allocWithZone:zone] initWithDictionary:self];
}

- (NSArray *)allKeys
{
    return [_keys array];
}

- (NSArray *)allValues
{
    return [_values copy];
}

- (NSUInteger)count
{
    return [_keys count];
}

- (NSUInteger)indexOfKey:(id)key {
    if (!key) {
        return -1;
    }
    return [_keys indexOfObject:key];
}

- (id)objectForKey:(id)key
{
    if (key) {
        NSUInteger index = [_keys indexOfObject:key];
        if (index != NSNotFound)
        {
            return _values[index];
        }
        return nil;
    }
    return nil;
}

- (NSEnumerator *)keyEnumerator
{
    return [_keys objectEnumerator];
}

- (NSEnumerator *)reverseKeyEnumerator
{
    return [_keys reverseObjectEnumerator];
}

- (NSEnumerator *)objectEnumerator
{
    return [_values objectEnumerator];
}

- (NSEnumerator *)reverseObjectEnumerator
{
    return [_values reverseObjectEnumerator];
}

- (void)enumerateKeysAndObjectsWithIndexUsingBlock:(void (^)(id key, id obj, NSUInteger idx, BOOL *stop))block
{
    [_keys enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop) {
        block(key, self->_values[idx], idx, stop);
    }];
}

- (id)keyAtIndex:(NSUInteger)index
{
    return _keys[index];
}

- (id)objectAtIndex:(NSUInteger)index
{
    return _values[index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index
{
    return _values[index];
}


@end

///////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - NSMutableOrderedDictionary

@implementation NSMutableOrderedDictionary
{
    OSSpinLock _lock;
}
#define _mutableValues ((NSMutableArray *)_values)
#define _mutableKeys ((NSMutableOrderedSet *)_keys)
#define LOCKED(...) OSSpinLockLock(&_lock); \
__VA_ARGS__; \
OSSpinLockUnlock(&_lock);

+ (instancetype)dictionaryWithCapacity:(NSUInteger)count
{
    return [(NSMutableOrderedDictionary *)[self alloc] initWithCapacity:count];
}

- (instancetype)initWithObjects:(const __unsafe_unretained id [])objects forKeys:(const __unsafe_unretained id <NSCopying> [])keys count:(NSUInteger)count
{
    if ((self = [super init]))
    {
        _values = [[NSMutableArray alloc] initWithObjects:objects count:count];
        _keys = [[NSMutableOrderedSet alloc] initWithObjects:keys count:count];
    }
    return self;
}

- (instancetype)initWithCapacity:(NSUInteger)capacity
{
    if ((self = [super init]))
    {
        _values = [[NSMutableArray alloc] initWithCapacity:capacity];
        _keys = [[NSMutableOrderedSet alloc] initWithCapacity:capacity];
        _lock = OS_SPINLOCK_INIT;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithCapacity:0];
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init]))
    {
        _values = [decoder decodeObjectOfClass:[NSMutableArray class] forKey:@"values"];
        _keys = [decoder decodeObjectOfClass:[NSMutableOrderedSet class] forKey:@"keys"];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    return [[NSOrderedDictionary allocWithZone:zone] initWithDictionary:self];
}

- (void)addEntriesFromDictionary:(NSDictionary *)otherDictionary
{
    OSSpinLockLock(&_lock);
    [otherDictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, __unused BOOL *stop) {
        [self setObject:obj forKey:key];
    }];
    OSSpinLockUnlock(&_lock);
}

- (void)insertObject:(id)object forKey:(id)key atIndex:(NSUInteger)index
{
    OSSpinLockLock(&_lock);
    [self removeObjectForKey:key];
    [_mutableKeys insertObject:key atIndex:index];
    [_mutableValues insertObject:object atIndex:index];
    OSSpinLockUnlock(&_lock);
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object
{   if (!object)
    return;

    OSSpinLockLock(&_lock);
    _mutableValues[index] = object;
    OSSpinLockUnlock(&_lock);
}

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index
{
    if (!object) {
        return;
    }
    LOCKED(_mutableValues[index] = object);
    
}

- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2
{
    OSSpinLockLock(&_lock);
    [_mutableKeys exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
    [_mutableValues exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
    OSSpinLockUnlock(&_lock);
}

- (void)removeAllObjects
{
    OSSpinLockLock(&_lock);
    [_mutableKeys removeAllObjects];
    [_mutableValues removeAllObjects];
    OSSpinLockUnlock(&_lock);
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
     OSSpinLockLock(&_lock);
    [_mutableKeys removeObjectAtIndex:index];
    [_mutableValues removeObjectAtIndex:index];
     OSSpinLockUnlock(&_lock);
}

- (void)removeObjectForKey:(id)key
{
    if (!key) {
        return;
    }
    OSSpinLockLock(&_lock);
    NSUInteger index = [self->_keys indexOfObject:key];
    if (index != NSNotFound)
    {
        [self removeObjectAtIndex:index];
    }
    OSSpinLockUnlock(&_lock);
}

- (void)removeObjectsForKeys:(NSArray *)keyArray
{
    if (keyArray||keyArray.count==0) {
        return;
    }
    OSSpinLockLock(&_lock);
    for (id key in [keyArray copy])
    {
        [self removeObjectForKey:key];
    }
    OSSpinLockUnlock(&_lock);
}

- (void)setDictionary:(NSDictionary *)otherDictionary
{
    if (!otherDictionary) {
        return;
    }
    OSSpinLockLock(&_lock);
    [_mutableKeys removeAllObjects];
    [_mutableKeys addObjectsFromArray:[otherDictionary allKeys]];
    [_mutableValues setArray:[otherDictionary allValues]];
     OSSpinLockUnlock(&_lock);
}

- (void)setObject:(id)object forKey:(id)key
{
    if (!object || !key) {
        return;
    }
    OSSpinLockLock(&_lock);
    NSUInteger index = [_keys indexOfObject:key];
    if (index != NSNotFound)
    {
        _mutableValues[index] = object;
    }
    else
    {
        [_mutableKeys addObject:key];
        [_mutableValues addObject:object];
    }
     OSSpinLockUnlock(&_lock);
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if (!key) {
        return;
    }
    if (value)
    {
        [self setObject:value forKey:key];
    }
    else
    {
        [self removeObjectForKey:key];
    }
    
}

- (void)setObject:(id)object forKeyedSubscript:(id <NSCopying>)key
{
    if (!key ||!object) {
        return;
    }
    LOCKED([self setObject:object forKey:key]);
    
}

@end