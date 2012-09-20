//
//  UIView+Frame.m
//  TJFoundation
//
//  Created by Thomas Joulin on 7/19/12.
//
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

#pragma mark -
#pragma Easy access to the frame properties

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;

    frame.origin.x = x;

    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;

    frame.origin.y = y;

    self.frame = frame;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;

    frame.size = size;

    self.frame = frame;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;

    frame.origin = origin;

    self.frame = frame;
}

#pragma mark -
#pragma Center View

- (void)centerInSuperview
{
    self.center = self.superview.center;
}

- (void)centerHorizontallyInSuperview
{
    [self centerHorizontallyInView:self.superview];
}

- (void)centerHorizontallyInView:(UIView *)view
{
    self.center = CGPointMake(view.center.x, self.center.y);
}

- (void)centerVerticallyInSuperview
{
    [self centerVerticallyInView:self.superview];
}

- (void)centerVerticallyInView:(UIView *)view
{
    self.center = CGPointMake(self.center.x, view.center.y);
}

#pragma mark -
#pragma Move views

- (void)moveBelowView:(UIView *)view
{
    [self moveBelowView:view withMargin:0 animated:NO];
}

- (void)moveBelowView:(UIView *)view animated:(BOOL)animated
{
    [self moveBelowView:view withMargin:0 animated:animated];
}

- (void)moveBelowView:(UIView *)view withMargin:(CGFloat)topMargin animated:(BOOL)animated
{
    if (animated)
    {
        [UIView beginAnimations:@"MoveBelowView" context:nil];
    }

    CGRect frame = self.frame;

    frame.origin.y = view.frame.origin.y + view.frame.size.height + topMargin;

    self.frame = frame;

    if (animated)
    {
        [UIView commitAnimations];
    }
}

@end
