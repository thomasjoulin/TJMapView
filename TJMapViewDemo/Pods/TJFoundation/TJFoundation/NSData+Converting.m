//
//  NSData+Converting.m
//  TJFoundation
//
//  Created by Thomas Joulin on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSData+Converting.h"

@implementation NSData (Converting)

- (NSString *)stringValue
{
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

@end
