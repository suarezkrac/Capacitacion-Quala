//
//  ViewController.h
//  MapKit
//
//  Created by Estudiante on 16/09/13.
//  Copyright (c) 2013 QUALA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "mapPoint.h"

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
{
    // para identificar la latitud y longitud
    CLLocationManager * locationManager;
    MKCoordinateRegion region;
    UIImage * imagen;
    NSString *lugar;
}


@property (strong, nonatomic) IBOutlet UITextField *locationTitleField;
@property (strong, nonatomic) IBOutlet MKMapView *worldView;

- (IBAction)changeMapType:(id)sender;

- (void) foundLocation:(CLLocation *) loc;
- (void) setRegion1:(CLLocation *) loc imageString:(NSString *)cadena;

@end
