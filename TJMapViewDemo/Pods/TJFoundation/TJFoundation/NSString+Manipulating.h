//
//  NSString+Manipulation.h
//  TJFoundation
//
//  Created by Thomas Joulin on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Manipulating)

// Manipulate strings
- (NSString *)substringFrom:(NSInteger)a to:(NSInteger)b;

- (NSString *)trimmedString;
- (NSString *)stringByTrimmingCharactersNotInSet:(NSCharacterSet *)set;

- (NSString *)urlEncodedString;

@end
