//
//  NSObject+Additions.m
//  TJFoundation
//
//  Created by Thomas Joulin on 7/10/12.
//
//

#import "NSObject+Additions.h"
#import <objc/runtime.h>

@implementation NSObject (Additions)

- (id)unless:(id)object
{
    return object ? object : self;
}

- (NSString *)descriptionByListingProperties
{
    NSMutableString *string = [[NSMutableString alloc] init];
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList( [self class], &count );
    for( unsigned int i = 0; i < count; i++ ) {
        objc_property_t property = properties[i];
        const char* propertyName = property_getName(property);

        NSString *s = @(propertyName);
        [string appendFormat:@"\n\t%@ = `%@`", s, [self valueForKey:s]];
    }
    free( properties );

    return string;
}

@end
