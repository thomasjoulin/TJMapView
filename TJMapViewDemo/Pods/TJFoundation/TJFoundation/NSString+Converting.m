//
//  NSString+Converting.m
//  TJFoundation
//
//  Created by Thomas Joulin on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSString+Converting.h"

@implementation NSString (Converting)

+ (NSString *)stringFromBool:(BOOL)boolean
{
    return boolean == TRUE ? @"TRUE" : @"FALSE";
}

@end
