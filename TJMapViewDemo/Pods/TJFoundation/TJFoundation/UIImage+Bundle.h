//
//  UIImage+Bundle.h
//  TJFoundation
//
//  Created by Thomas Joulin on 7/20/12.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Bundle)

+ (UIImage *)imageNamed:(NSString *)imageName inBundle:(NSBundle *)bundle;

@end
