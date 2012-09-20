//
//  UIImage+Bundle.m
//  TJFoundation
//
//  Created by Thomas Joulin on 7/20/12.
//
//

#import "UIImage+Bundle.h"
#import <TJFoundation/NSBundle+TJFoundation.h>

@implementation UIImage (Bundle)

+ (UIImage *)imageNamed:(NSString *)imageName inBundle:(NSBundle *)bundle
{
    return [UIImage imageWithContentsOfFile:[[NSBundle TJFoundationBundle] pathForResource:imageName ofType:nil]];
}

@end
