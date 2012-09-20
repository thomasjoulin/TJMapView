//
//  UIView+Frame.h
//  TJFoundation
//
//  Created by Thomas Joulin on 7/19/12.
//
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

- (void)centerInSuperview;
- (void)centerHorizontallyInView:(UIView *)view;
- (void)centerHorizontallyInSuperview;
- (void)centerVerticallyInSuperview;
- (void)centerVerticallyInView:(UIView *)view;

- (void)moveBelowView:(UIView *)view;
- (void)moveBelowView:(UIView *)view animated:(BOOL)animated;
- (void)moveBelowView:(UIView *)view withMargin:(CGFloat)topMargin animated:(BOOL)animated;

- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;
- (void)setSize:(CGSize)size;
- (void)setOrigin:(CGPoint)origin;

@end
