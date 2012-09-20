//
//  UIAlertView+Additions.m
//  TJFoundation
//
//  Created by Thomas Joulin on 7/22/12.
//
//

#import "UIAlertView+Additions.h"

@implementation UIAlertView (Additions)

+ (void)showWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:cancelButtonTitle
                                              otherButtonTitles:nil];

    [alertView show];
}


@end
