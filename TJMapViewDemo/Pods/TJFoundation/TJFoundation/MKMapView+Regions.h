//
//  MKMapView+MKMapView_Regions.h
//  TJFoundation
//
//  Created by Thomas Joulin on 9/20/12.
//
//

#import <MapKit/MapKit.h>

@interface MKMapView (Regions)

- (MKCoordinateRegion)regionThatFitsRegions:(NSArray *)regions;

@end
