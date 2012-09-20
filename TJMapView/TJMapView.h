//
//  TJMapView.h
//  TJMapView
//
//  Created by Thomas Joulin on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface TJMapView : MKMapView <CLLocationManagerDelegate>

- (void)drawDirectionFrom:(NSString *)from to:(NSString *)to;
- (void)drawDirectionFromUserPositionToAddress:(NSString *)toAddress;
- (void)drawDirectionFromCoordinate:(CLLocationCoordinate2D)fromCoordinate toCoordinate:(CLLocationCoordinate2D)toCoordinate;
- (void)drawDirectionFromUserPositionToCoordinate:(CLLocationCoordinate2D)toCoordinate;

@end
