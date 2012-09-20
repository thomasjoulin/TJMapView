//
//  NDictionary+Additions.h
//  callresto
//
//  Created by Thomas Joulin on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Additions)

- (void)each:(void(^)(id, id))context;

@end
