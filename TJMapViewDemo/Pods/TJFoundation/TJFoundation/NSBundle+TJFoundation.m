//
//  NSBundle+TJFoundation.m
//  TJFoundation
//
//  Created by Thomas Joulin on 7/20/12.
//
//

#import "NSBundle+TJFoundation.h"

@implementation NSBundle (TJFoundation)

+ (NSBundle *)TJFoundationBundle
{
    static dispatch_once_t onceToken;
    static NSBundle *myLibraryResourcesBundle = nil;

    dispatch_once(&onceToken, ^{
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"TJFoundationResources" withExtension:@"bundle"];
        
        if (url)
        {
            myLibraryResourcesBundle = [NSBundle bundleWithURL:url];
        }
    });

    return myLibraryResourcesBundle;
}

@end
