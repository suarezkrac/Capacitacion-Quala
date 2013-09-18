//
//  ViewController.m
//  MapKit
//
//  Created by Giovanny Suarez on 16/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize MapType, worldView, locationTitleField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if (self) {
        locationManager = [[CLLocationManager alloc] init];
        
        [locationManager setDelegate:self];
        
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
        [locationManager startUpdatingLocation];
    }
    
    [worldView setShowsUserLocation:YES];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
   
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 500, 500);
    [worldView setRegion:region animated:YES];
}

-(void)findLocation{

}
-(void)foundLocation: (CLLocation *)loc{
    CLLocationCoordinate2D cood = [loc coordinate];
    
    MapPoint * mp = [[MapPoint alloc] initWithCoordinate:cood title:[locationTitleField text]];
    
    [worldView addAnnotation:mp];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(cood, 250, 250);
    
    [worldView setRegion:region animated:YES];

}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    
    [self foundLocation:newLocation];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeMapType:(id)sender {
    
    int typeIndex = [sender selectedSegmentIndex];
    
    if(typeIndex == 0){
        [worldView setMapType:MKMapTypeStandard];
    } else  if(typeIndex == 1){
        [worldView setMapType:MKMapTypeSatellite];
    } else  if(typeIndex == 2){
        [worldView setMapType:MKMapTypeHybrid];
    }
}
@end
