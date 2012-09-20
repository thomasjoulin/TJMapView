//
//  UIColor+Leijon.m
//  Leijon
//
//  Created by Thomas Joulin on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIColor+Additions.h"

@implementation UIColor (Additions)

+ (UIColor *)colorWithRGBA:(RGBA)color
{
    color.red /= 255.0;
    color.green /= 255.0;
    color.blue /= 255.0;
    
    return [UIColor colorWithRed:color.red green:color.green blue:color.blue alpha:color.alpha];
}

@end
