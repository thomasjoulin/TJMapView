TJMapView
=========

An MKMapView subclass adding some extra functionalities

    TJMapView *mapView = [[TJMapView alloc] initWithFrame:self.view.bounds];
    mapView.delegate = self;
    mapView.showsUserLocation = YES;
    
    [self.view addSubview:mapView];
    
    [mapView drawDirectionFrom:@"Place de Vosges, Paris" to:@"Carousel du Louvres, Paris"];

![I](http://i.imgur.com/P8uuo.jpg)

## Adding TJMapView To Your Project

TJFoundation uses Cocoa Pods. Add our Specs repository :

	pod repo add Specs git@github.com:thomasjoulin/Specs.git

Then in your project add `pod 'TJFoundation` in your Podfile or create one :

	platform :ios
	pod 'TJFoundation'

## How To Get Started

You can use one of the four direction methods :

	// [mapView drawDirectionFrom:@"Wall street, New York" to:@"Central Park, New York"];
	- (void)drawDirectionFrom:(NSString *)from to:(NSString *)to;

	// [mapView drawDirectionFromUserPositionToAddress:@"Bangkok"];
	- (void)drawDirectionFromUserPositionToAddress:(NSString *)toAddress;

	//    CLLocationCoordinate2D from = CLLocationCoordinate2DMake(38.479395, -105.117187);
	//    CLLocationCoordinate2D to = CLLocationCoordinate2DMake(19.145168, -98.964844);
	//    [mapView drawDirectionFromCoordinate:from toCoordinate:to];
	- (void)drawDirectionFromCoordinate:(CLLocationCoordinate2D)fromCoordinate toCoordinate:(CLLocationCoordinate2D)toCoordinate;

	//    [mapView drawDirectionFromUserPositionToCoordinate:to];
	- (void)drawDirectionFromUserPositionToCoordinate:(CLLocationCoordinate2D)toCoordinate;

*Don't forget to set yourself as the delegate to be able to draw the route line :*

	TJMapView *mapView = [[TJMapView alloc] initWithFrame:self.view.bounds];
	mapView.delegate = self;

	- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id)overlay
	{
	    MKPolylineView  *routeLineView = [[MKPolylineView alloc] initWithPolyline:overlay];
	    routeLineView.fillColor = [UIColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:0.5f];
	    routeLineView.strokeColor = [UIColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:0.5f];
	    routeLineView.lineWidth = 4;
    
	    return routeLineView;
	}
