//
//  NSArray+Underscore.m
//  Underscore.js Port to Objective-C
//
//  Created by Thomas Joulin on 1/20/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import "NSArray+Underscore.h"

@implementation NSArray (Additions)

- (NSArray *)map:(id (^)(id obj))context
{
    NSMutableArray *mapped = [NSMutableArray arrayWithCapacity:[self count]];
    
    for (id obj in self)
    {
        id mapped_object = context(obj);
        
        if (mapped_object)
        {
            [mapped addObject:mapped_object];
        }
    }
    
    return mapped;
}

- (id)reduceWithMemo:(id)memo andReduceBlock:(TJReduceBlock)context
{
    for (id obj in self)
    {
        memo = context(memo, obj);
    }
    
    return memo;
}

- (id)reduceRightWithMemo:(id)memo andReduceBlock:(TJReduceBlock)context
{
    for (id obj in [self reverseObjectEnumerator])
    {
        memo = context(memo, obj);
    }
    
    return memo;
}

- (id)find:(TJFindBlock)context
{
    for (id obj in self)
    {
        if (context(obj))
        {
            return obj;
        }
    }
    
    return nil;
}

- (NSArray *)pluck:(NSString *)propertyName
{
    return [self map:^ id (id obj) {
        return [obj valueForKeyPath:propertyName];
    }];
}

- (NSArray *)each:(void (^)(id obj))context
{
    for (id obj in self)
    {
        context(obj);
    }
    
    return self;
}

//- (NSArray *)filter:(TJTestBlock)context
//{
//    NSMutableArray *array = [NSMutableArray array];
//
//    for (id obj in self)
//    {
//        if (context(obj))
//        {
//            [array addObject:obj];
//        }
//    }
//    
//    return array;
//}
//
//- (NSArray *)reject:(BOOL (^)(id obj))context
//{
//    return [self filter:[NSObject negateBlock:context]];
//}
//
//- (BOOL)all:(TJTestBlock)context
//{
//    for (id obj in self)
//    {
//        if (!context(obj))
//        {
//            return NO;
//        }
//    }
//    
//    return [self count] != 0;
//}
//
//- (BOOL)any:(TJTestBlock)context
//{
//    for (id obj in self)
//    {
//        if (context(obj))
//        {
//            return YES;
//        }
//    }
//    
//    return NO;
//}
//
- (id)max
{
    return [self maxUsingBlock:^ id (id obj) { return obj; }];
}

- (id)maxUsingBlock:(id (^)(id obj))context
{
    id max = nil;

    for (id obj in self)
    {
        id comparee = context(obj);

        if (!max)
        {
            max = comparee;
        }

        if ([max compare:comparee] == NSOrderedAscending)
        {
            max = comparee;
        }
    }

    return max;
}

- (id)min
{
    return [self minUsingBlock:^ id (id obj) { return obj; }];
}

- (id)minUsingBlock:(id (^)(id obj))context
{
    id min = nil;

    for (id obj in self)
    {
        id comparee = context(obj);

        if (!min)
        {
            min = comparee;
        }

        if ([min compare:comparee] == NSOrderedDescending)
        {
            min = comparee;
        }
    }

    return min;
}

- (NSArray *)shuffle
{
    NSMutableArray *result = [self mutableCopy];

    for (NSInteger i = result.count - 1; i > 0; i--)
    {
        [result exchangeObjectAtIndex:arc4random() % (i + 1)
                    withObjectAtIndex:i];
    }

    return result;
}

- (NSDictionary *)groupBy:(NSString *)keyPath
{
    return [self groupUsingBlock:^ id (id obj) {
        return [obj valueForKeyPath:keyPath];
    }];
}

- (NSDictionary *)groupUsingBlock:(id (^)(id obj))context
{
    NSMutableDictionary *ret = [NSMutableDictionary dictionary];

    for (id obj in self)
    {
        id key = context(obj);

        NSMutableArray *a = ret[key];

        if (!a)
        {
            a = [NSMutableArray array];
            ret[key] = a;
        }

        [a addObject:obj];
    }
    
    return ret;
}

- (id)firstObject
{
    return [self objectAtIndex:0];
}

- (NSArray *)zip:(NSArray *)firstArray, ...
{
    va_list args;
    NSInteger numberOfArrays = 1;
    NSInteger longestArray = 0;
    NSMutableArray *ret = nil;
    NSInteger i = 0, j = 0;

    va_start(args, firstArray);

    for (NSArray *arg = firstArray; arg; arg = va_arg(args, id))
    {
        numberOfArrays += 1;
        longestArray = MAX(longestArray, [arg count]);
    }

    ret = [NSMutableArray arrayWithCapacity:longestArray];
    for (i = 0; i < longestArray; i++)
    {
        NSMutableArray *a = [NSMutableArray arrayWithCapacity:numberOfArrays];

        for (NSInteger j = 0; j < numberOfArrays; j++)
        {
            [a addObject:[NSNull null]];
        }

        [ret addObject:a];
    }

    va_end(args);

    va_start(args, firstArray);

    for (i = 0; i < [self count]; i++)
    {
        NSMutableArray *a = ret[i];

        a[0] = self[i];
    }

    j = 1;
    for (NSArray *arg = firstArray; arg; arg = va_arg(args, id), j++)
    {
        for (i = 0; i < [arg count]; i++)
        {
            NSMutableArray *a = ret[i];

            a[j] = arg[i];
        }
    }

    va_end(args);

    return ret;
}


@end
