//
//  MKMapView+Regions.m
//  TJFoundation
//
//  Created by Thomas Joulin on 9/20/12.
//
//

#import "MKMapView+Regions.h"

@implementation MKMapView (Regions)

- (MKCoordinateRegion)regionThatFitsRegions:(NSArray *)regions
{
	MKCoordinateRegion  region;
	CLLocationDegrees   maxLat = -90.0f;
	CLLocationDegrees   maxLon = -180.0f;
	CLLocationDegrees   minLat = 90.0f;
	CLLocationDegrees   minLon = 180.0f;
	
	for (int i = 0; i < regions.count; i++)
    {
		CLLocation *currentLocation = [regions objectAtIndex:i];
        
		if (currentLocation.coordinate.latitude > maxLat)
        {
			maxLat = currentLocation.coordinate.latitude;
		}
		if (currentLocation.coordinate.latitude < minLat)
        {
			minLat = currentLocation.coordinate.latitude;
		}
		if (currentLocation.coordinate.longitude > maxLon)
        {
			maxLon = currentLocation.coordinate.longitude;
		}
		if (currentLocation.coordinate.longitude < minLon)
        {
			minLon = currentLocation.coordinate.longitude;
		}
	}
	
	region.center.latitude     = (maxLat + minLat) / 2;
	region.center.longitude    = (maxLon + minLon) / 2;
	region.span.latitudeDelta  = maxLat - minLat;
	region.span.longitudeDelta = maxLon - minLon;

    return region;
}

@end
