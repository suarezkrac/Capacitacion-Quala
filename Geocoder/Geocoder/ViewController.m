//
//  ViewController.m
//  Geocoder
//
//  Created by Giovanny Suarez on 18/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize adressOutlet, cityOutlet, stateOutlet, zipOutlet, mapView, selectedLocation, placeDictionary;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.adressOutlet.delegate = self;
    self.cityOutlet.delegate = self;
    self.stateOutlet.delegate = self;
    self.zipOutlet.delegate = self;
    self.mapView.delegate = self;
    
    self.placeDictionary = [[NSMutableDictionary alloc] init];
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 4.60971;
    zoomLocation.longitude = -74.08175;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 1609.344, 1609.344);
    
    [self.mapView setRegion:viewRegion animated:YES];
}

//METODO PARA ACTUALIZAR DICCIONARIO
-(void)updatePlaceDictionary{
    [self.placeDictionary setValue:self.adressOutlet.text forKey:@"Street"];
    [self.placeDictionary setValue:self.cityOutlet.text forKey:@"City"];
    [self.placeDictionary setValue:self.stateOutlet.text forKey:@"State"];
    [self.placeDictionary setValue:self.zipOutlet.text forKey:@"ZIP"];
}

-(void)updateMaps{
    CLGeocoder * geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressDictionary:self.placeDictionary completionHandler:^(NSArray *placemarks, NSError *error) {
        if ([placemarks count]) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            CLLocation * location = placemark.location;
            CLLocationCoordinate2D coordinate = location.coordinate;
            [self.mapView setCenterCoordinate:coordinate animated:YES];
        }else{
            NSLog(@"Error ");
        }
    }];
}
-(void)delayedReverseGeocodeLocation{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self reverseGeocodeLocation];
}
-(void)reverseGeocodeLocation{
    CLGeocoder * geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:self.selectedLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if ([placemarks count]) {
            NSDictionary *dictionary = [[placemarks objectAtIndex:0] addressDictionary];
            [self.adressOutlet setText:[dictionary valueForKey:@"Street"]];
            [self.cityOutlet setText:[dictionary valueForKey:@"City"]];
            [self.stateOutlet setText:[dictionary valueForKey:@"State"]];
            [self.zipOutlet setText:[dictionary valueForKey:@"ZIP"]];
        }
    }];
}
// ENLAZAR AL MAPA
-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    
    self.selectedLocation = [[CLLocation alloc] initWithLatitude:self.mapView.centerCoordinate.latitude longitude:self.mapView.centerCoordinate.longitude];
    
    [self performSelector:@selector(delayedReverseGeocodeLocation) withObject:nil afterDelay:0.3];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitTapped:(id)sender {
    [self updatePlaceDictionary];
    [self updateMaps];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
