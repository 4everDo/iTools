//
//  NSOrderedDictionary.h
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

#import <Foundation/Foundation.h>

@interface NSOrderedDictionary : NSDictionary
+ (instancetype)dictionaryWithContentsOfFile:(NSString *)path;
+ (instancetype)dictionaryWithContentsOfURL:(NSURL *)url;

/**
 Returns the nth key in the dictionary.
 */
- (id)keyAtIndex:(NSUInteger)index;
/**
 Returns the nth object in the dictionary.
 */
- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;
/**
 Returns the index of the specified key, or NSNotFound if key is not found.
 */
- (NSUInteger)indexOfKey:(id)key;
/**
 Returns an enumerator for backwards traversal of the dictionary keys.
 */
- (NSEnumerator *)reverseKeyEnumerator;
/**
 Returns an enumerator for backwards traversal of the dictionary objects.
 */
- (NSEnumerator *)reverseObjectEnumerator;
/**
 Enumerates keys ands objects with index using block.
 */
- (void)enumerateKeysAndObjectsWithIndexUsingBlock:(void (^)(id key, id obj, NSUInteger idx, BOOL *stop))block;
/**
 *  Get all keys
 *
 */
- (NSArray *)allKeys;
/**
 *  Get all Values
 *
 */
- (NSArray *)allValues;
/**
 *  Get 'self' count
 *
 */
- (NSUInteger)count;

@end

#pragma mark - NSMutableOrderedDictionary 

@interface NSMutableOrderedDictionary : NSOrderedDictionary
+ (instancetype)dictionaryWithCapacity:(NSUInteger)count;
- (instancetype)initWithCapacity:(NSUInteger)count;

- (void)addEntriesFromDictionary:(NSDictionary *)otherDictionary;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)key;
- (void)removeObjectsForKeys:(NSArray *)keyArray;
- (void)setDictionary:(NSDictionary *)otherDictionary;
- (void)setObject:(id)object forKey:(id)key;
- (void)setObject:(id)object forKeyedSubscript:(id <NSCopying>)key;

/**
 Inserts an object at a specific index in the dictionary.
 */
- (void)insertObject:(id)object forKey:(id)key atIndex:(NSUInteger)index;
/**
 Replace an object at a specific index in the dictionary.
 */
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object;
- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index;
/**
 Swap the indexes of two key/value pairs in the dictionary.
 */
- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;
/**
 Removes the nth object in the dictionary.
 */
- (void)removeObjectAtIndex:(NSUInteger)index;

@end