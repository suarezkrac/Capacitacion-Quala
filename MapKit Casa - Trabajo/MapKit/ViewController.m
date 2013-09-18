//
//  ViewController.m
//  MapKit
//
//  Created by Estudiante on 16/09/13.
//  Copyright (c) 2013 QUALA. All rights reserved.
//

#import "ViewController.h"
#import "CalloutView.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize worldView, locationTitleField;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if (self)
    {
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [locationManager startUpdatingLocation];
    }

    [self foundLocation:[[CLLocation alloc] initWithLatitude:region.center.latitude longitude:region.center.longitude]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeMapType:(id)sender
{
    int typeIndex = [sender selectedSegmentIndex];
    if (typeIndex == 0)
    {
        [worldView setMapType:MKMapTypeStandard];
    }
    else if (typeIndex == 1)
    {
        [worldView setMapType:MKMapTypeSatellite];
    }
    else if (typeIndex == 2)
    {
        [worldView setMapType:MKMapTypeHybrid];
    }
}


-(void) setRegion1:(CLLocation *) loc imageString:(NSString *)cadena
{
    CLLocationCoordinate2D coord = [loc coordinate];
    region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    lugar = cadena;
    imagen =  [UIImage imageNamed:lugar];
}

- (void) foundLocation:(CLLocation *) loc
{
    NSLog(@"locación: %f , %f", loc.coordinate.latitude, loc.coordinate.longitude);
    CLLocationCoordinate2D coord = [loc coordinate];
    mapPoint * mp = [[mapPoint alloc] initWithCoordinate:coord title:[locationTitleField text]];
    [worldView addAnnotation:mp];
    region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES]; 
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    NSString * identifier = @"mapPoint";
    MKAnnotationView * annotationView = [self.worldView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView)
    {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.image = imagen;
    }
    else
    {
        annotationView.annotation = annotation;
    }
    return annotationView;
}
-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    if (![view.annotation isKindOfClass:[MKUserLocation class]]) {
        CalloutView * calloutview = (CalloutView *)[[[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil] objectAtIndex:0];
        
        CGRect calloutViewFrame = calloutview.frame;
        calloutViewFrame.origin = CGPointMake(-calloutViewFrame.size.width/2 +15, -calloutViewFrame.size.height);
        calloutview.frame = calloutViewFrame;
        
        [calloutview.calloutLabel setText:lugar];
        
        [view addSubview:calloutview];
    }
}


 

@end
