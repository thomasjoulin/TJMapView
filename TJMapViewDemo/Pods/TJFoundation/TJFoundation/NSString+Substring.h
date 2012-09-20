//
//  NSString+Substring.h
//  TJFoundation
//
//  Created by Thomas Joulin on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Substring)

- (NSInteger)indexOf:(NSString *)substring from:(NSInteger)starts;
- (NSString *)substringFrom:(NSInteger)a to:(NSInteger)b;

@end
