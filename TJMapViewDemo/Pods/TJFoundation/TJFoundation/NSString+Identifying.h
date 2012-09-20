//
//  NSString+Identifying.h
//  TJFoundation
//
//  Created by Thomas Joulin on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Identifying)

// Test Strings
- (BOOL)isValidEmail;
- (BOOL)isNotEmpty;
- (BOOL)containsString:(NSString *)aString;
- (BOOL)isUppercase;

@end
