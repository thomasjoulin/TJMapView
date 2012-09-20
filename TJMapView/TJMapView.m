//
//  TJMapView.m
//  TJMapView
//
//  Created by Thomas Joulin on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TJMapView.h"
#import "AFNetworking.h"
#import <TJFoundation/TJFoundation.h>

@interface TJMapView ()
{
    MKPolyline              *_routeLine;
    CLLocationManager       *_locationManager;
    NSString                *_toDestination;
    AFJSONRequestOperation  *_operation;
}

@end

@implementation TJMapView

- (void)drawDirectionFrom:(NSString *)from to:(NSString *)to
{
    NSURLRequest            *request;
    
    request = [self urlRequestForDirectionsFrom:from to:to];
    
    if (_operation)
    {
        NSLog(@"cancel operation");
        [_operation cancel];
    }
    
    _operation =
    [AFJSONRequestOperation
     JSONRequestOperationWithRequest:request
     success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSDictionary *json)
     {
         NSArray *routes = json[@"routes"];
         
         _operation = nil;
         if (routes && [routes count])
         {
             NSDictionary *route = routes[0];
             
             if (route[@"overview_polyline"])
             {
                 NSString *polyline = route[@"overview_polyline"][@"points"];
                 if (polyline)
                 {
                     NSArray *routePoints = [self decodePolyLine:polyline];
                     
                     if (routePoints && [routePoints count] > 0)
                     {
                         [self setRoutePoints:routePoints];
                     }
                 }
             }
         }
     }
     failure:nil];
    
    [_operation start];
}

- (void)drawDirectionFromCoordinate:(CLLocationCoordinate2D)fromCoordinate toCoordinate:(CLLocationCoordinate2D)toCoordinate
{
    NSString *from = [NSString stringWithFormat:@"%f,%f", fromCoordinate.latitude, fromCoordinate.longitude];
    NSString *to = [NSString stringWithFormat:@"%f,%f", toCoordinate.latitude, toCoordinate.longitude];
    
    [self drawDirectionFrom:from to:to];
}

- (void)drawDirectionFromUserPositionToAddress:(NSString *)toAddress
{
    _toDestination = toAddress;
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.delegate = self;
    [_locationManager startUpdatingLocation];
}

- (void)drawDirectionFromUserPositionToCoordinate:(CLLocationCoordinate2D)toCoordinate
{
    NSString *to = [NSString stringWithFormat:@"%f,%f", toCoordinate.latitude, toCoordinate.longitude];
    
    [self drawDirectionFromUserPositionToAddress:to];
}

#pragma mark -
#pragma mark CLLocationDelegate Methods

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSString *userLocation = [NSString stringWithFormat:@"%f,%f", newLocation.coordinate.latitude, newLocation.coordinate.longitude];
    
    [self drawDirectionFrom:userLocation to:_toDestination];
    
    _toDestination = nil;
    
    [_locationManager stopUpdatingLocation];
}

#pragma mark -
#pragma mark Private Methods

- (NSMutableArray *)decodePolyLine:(NSString *)polyline
{
	NSInteger       index = 0;
	NSInteger       latitude = 0;
	NSInteger       longitude = 0;
    NSInteger       delta;
	NSMutableArray  *array = [[NSMutableArray alloc] init];
    
    polyline = [polyline stringByReplacingOccurrencesOfString:@"\\\\" withString:@"\\"
                                                      options:NSLiteralSearch
                                                        range:NSMakeRange(0, [polyline length])];

	while (index < [polyline length])
    {
		NSInteger b;
		NSInteger shift = 0;
		NSInteger result = 0;

		do
        {
			b = [polyline characterAtIndex:index++] - 63;
			result |= (b & 0x1f) << shift;
			shift += 5;
		}
        while (b >= 0x20);

		delta = ((result & 1) ? ~(result >> 1) : (result >> 1));
		latitude += delta;
		shift = 0;
		result = 0;

		do
        {
			b = [polyline characterAtIndex:index++] - 63;
			result |= (b & 0x1f) << shift;
			shift += 5;
		}
        while (b >= 0x20);

		delta = ((result & 1) ? ~(result >> 1) : (result >> 1));
		longitude += delta;

		CLLocation *location = [[CLLocation alloc] initWithLatitude:(latitude * 1e-5) longitude:(longitude * 1e-5)];
		[array addObject:location];
	}
	
	return array;
}

- (void)setRoutePoints:(NSArray*)locations
{
	MKMapPoint  *pointArr = malloc(sizeof(CLLocationCoordinate2D) * locations.count);
	NSUInteger  i, count = [locations count];

	for (i = 0; i < count; i++)
    {
		CLLocation  *obj = [locations objectAtIndex:i];
		MKMapPoint  point = MKMapPointForCoordinate(obj.coordinate);
        
		pointArr[i] = point;
	}
	
	if (_routeLine)
    {
		[self removeOverlay:_routeLine];
	}
    
	_routeLine = [MKPolyline polylineWithPoints:pointArr count:locations.count];
	
	[self addOverlay:_routeLine];
	[self setRegion:[self regionThatFitsRegions:locations] animated:YES];
    
    free(pointArr);
}

- (NSURLRequest *)urlRequestForDirectionsFrom:(NSString *)from to:(NSString *)to
{
    NSString *urlString;
    NSURL    *url;
    
    from = [from stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    to = [to stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/directions/json?origin=%@&destination=%@&sensor=false", from, to];
    url = [NSURL URLWithString:urlString];
    
    return [NSURLRequest requestWithURL:url];
}

@end
