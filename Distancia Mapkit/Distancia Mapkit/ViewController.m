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
    
    CLLocation *loc1 = [[CLLocation alloc] initWithLatitude:22.569722 longitude:88.369722];
    
    CLLocation *loc2 = [[CLLocation alloc] initWithLatitude:19.12 longitude:73.02];
    
    //CALCULAR DISTANCIA ENTRE PUNTOS
    // 1 Meter = 0.000621371192 Miles
    CLLocationDistance distance = [loc1 distanceFromLocation:loc2 ];
    NSLog(@"Distancia entre los puntos en metros es : %f \n en Millas = %f \n en Kilometros %f", distance, distance * 0.000621371192, distance/ 1000);
    
    
    //LINEA
    MKMapPoint * pointsArray = malloc(sizeof(CLLocationCoordinate2D)*2);
    
    CLLocationCoordinate2D coord1 = {22.569722, 88.369722};
    CLLocationCoordinate2D coord2 = {19.12, 73.02};
    
    pointsArray[0] = MKMapPointForCoordinate(coord1);
    pointsArray[1] = MKMapPointForCoordinate(coord2);
    
    routeLine = [MKPolyline polylineWithPoints:pointsArray count:2];
    
    [mapVIew addOverlay:routeLine];
}

//METODO DEL MAP DELEGATE
-(MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay{
    
    MKOverlayView * overlayView = nil;
    
    MKPolylineView * _routeLineView = [[MKPolylineView alloc] initWithPolyline:self.routeLine];
    _routeLineView.fillColor = [UIColor redColor];
    _routeLineView.strokeColor = [UIColor greenColor];
    _routeLineView.lineWidth = 5;
    _routeLineView.lineCap = kCGLineCapSquare;
    
    overlayView = _routeLineView;
    
    return overlayView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
