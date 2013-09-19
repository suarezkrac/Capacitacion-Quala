//
//  ViewController.m
//  Distancia Mapkit
//
//  Created by Giovanny Suarez on 19/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import "ViewController.h"
#import "DisplayMap.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mapVIew, routeLine;

- (void)viewDidLoad
{
    [super viewDidLoad];
	[mapVIew setMapType:MKMapTypeHybrid];
    [mapVIew setZoomEnabled:YES];
    [mapVIew setScrollEnabled:YES];
    
    MKCoordinateRegion region;
    
    region.center.latitude = 22.569722;
    region.center.longitude = 88.369722;
    
    region.span.longitudeDelta = 40.0f;
    region.span.latitudeDelta = 40.0f;
    
    [mapVIew setRegion:region animated:YES];
    
    DisplayMap * ann = [[DisplayMap alloc] init];
    ann.title = @"Kolkata";
    ann.subtitle = @"Punto A";
    ann.coordinate = region.center;
    [mapVIew addAnnotation:ann];
    
    DisplayMap * pun = [[DisplayMap alloc] init];
    pun.title = @"Mumbai";
    pun.subtitle = @"Punto B";
    CLLocationCoordinate2D coord = {19.12, 73.02};
    pun.coordinate = coord;
    [mapVIew addAnnotation:pun];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
