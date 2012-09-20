//
//  ViewController.m
//  TJMapViewDemo
//
//  Created by Thomas Joulin on 9/20/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import "ViewController.h"
#import <TJMapView.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TJMapView *mapView = [[TJMapView alloc] initWithFrame:self.view.bounds];
    mapView.delegate = self;
    mapView.showsUserLocation = YES;
    
    [self.view addSubview:mapView];
    
//    [mapView drawDirectionFrom:@"Wall street, New York" to:@"Central Park, New York"];
//    [mapView drawDirectionFromUserPositionToAddress:@"Los Angeles"];
    
    CLLocationCoordinate2D from = CLLocationCoordinate2DMake(38.479395, -105.117187);
    CLLocationCoordinate2D to = CLLocationCoordinate2DMake(19.145168, -98.964844);
    
    [mapView drawDirectionFromCoordinate:from toCoordinate:to];
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id)overlay
{
    MKPolylineView  *routeLineView = [[MKPolylineView alloc] initWithPolyline:overlay];
    routeLineView.fillColor = [UIColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:0.5f];
    routeLineView.strokeColor = [UIColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:0.5f];
    routeLineView.lineWidth = 4;
    
    return routeLineView;
}

@end
