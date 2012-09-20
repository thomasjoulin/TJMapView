//
//  NSDictionary+Additions.m
//  callresto
//
//  Created by Thomas Joulin on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDictionary+Additions.h"

@implementation NSDictionary (Additions)

- (void)each:(void(^)(id, id))context
{
    for (NSString *key in [self allKeys])
    {
        context([self objectForKey:key], key);
    }
}

@end
