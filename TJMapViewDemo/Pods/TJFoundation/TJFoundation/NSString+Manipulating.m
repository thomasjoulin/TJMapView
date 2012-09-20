//
//  NSString+Manipulation.m
//  TJFoundation
//
//  Created by Thomas Joulin on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSString+Manipulating.h"

@implementation NSString (Manipulating)

- (NSString *)substringFrom:(NSInteger)a to:(NSInteger)b
{
	NSRange r;
    
	r.location = a;
	r.length = b - a;
    
	return [self substringWithRange:r];
}

- (NSString *)urlEncodedString
{
	return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL, (__bridge CFStringRef)self, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8);
}

- (NSString *)trimmedString
{
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)stringByTrimmingCharactersNotInSet:(NSCharacterSet *)set
{
    NSMutableString *strippedString = [NSMutableString  stringWithCapacity:[self length]];
    NSScanner       *scanner = [NSScanner scannerWithString:self];
    
    while ([scanner isAtEnd] == NO)
    {
        NSString *buffer;
        if ([scanner scanCharactersFromSet:set intoString:&buffer])
        {
            [strippedString appendString:buffer];
        }
        else
        {
            [scanner setScanLocation:([scanner scanLocation] + 1)];
        }
    }
    
    return strippedString;
}

@end
