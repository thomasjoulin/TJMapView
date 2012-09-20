//
//  NSArray+Underscore.m
//  Underscore.js Port to Objective-C
//
//  Created by Thomas Joulin on 1/20/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id   (^ TJReduceBlock)(id memo, id obj);
typedef BOOL (^ TJFindBlock)(id obj);

@interface NSArray (Additions)

/*
    Methods of Underscore existing in Cocoa Touch:
    ---
 
    include     => contains:
    invoke      => makeObjectsPerformSelector:withObject:
    sortBy      => sortedArrayUsingComparator:
    sortedIndex => indexOfObject:inSortedRange:options:usingComparator:
 */

- (NSArray *)each:(void (^)(id obj))context;
- (NSArray *)map:(id (^)(id obj))context;
- (id)reduceWithMemo:(id)memo andReduceBlock:(TJReduceBlock)context;
- (id)reduceRightWithMemo:(id)memo andReduceBlock:(TJReduceBlock)context;
- (id)find:(TJFindBlock)context;
//- (NSArray *)filter:(TJTestBlock)context;
//- (NSArray *)reject:(TJTestBlock)context;
//- (BOOL)all:(TJTestBlock)context;
//- (BOOL)any:(TJTestBlock)context;
- (NSArray *)pluck:(NSString *)propertyName;
- (id)max;
- (id)maxUsingBlock:(id (^)(id obj))context;
- (id)min;
- (id)minUsingBlock:(id (^)(id obj))context;
- (NSArray *)zip:(NSArray *)firstArray, ... NS_REQUIRES_NIL_TERMINATION;
- (NSDictionary *)groupBy:(NSString *)keyPath;
- (NSDictionary *)groupUsingBlock:(id (^)(id obj))context;
- (NSArray *)shuffle;
- (id)firstObject;

@end
