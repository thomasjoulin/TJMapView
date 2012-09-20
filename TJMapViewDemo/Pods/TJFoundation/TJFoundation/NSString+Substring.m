//
//  NSString+Substring.m
//  TJFoundation
//
//  Created by Thomas Joulin on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSString+Substring.h"

@implementation NSString (Substring)

- (NSInteger)indexOf:(NSString*)substring from:(NSInteger)starts
{
	NSRange r;
    NSRange index;
    
	r.location = starts;
	r.length = [self length] - r.location;
	
	index = [self rangeOfString:substring options:NSLiteralSearch range:r];
	if (index.location == NSNotFound)
    {
		return -1;
	}
    
	return index.location;
}

- (NSString *)substringFrom:(NSInteger)a to:(NSInteger)b
{
    if (a == -1 || b == -1)
    {
        return  nil;
    }
    
	NSRange r;
    
	r.location = a;
	r.length = b - a;
	return [self substringWithRange:r];
}

@end
