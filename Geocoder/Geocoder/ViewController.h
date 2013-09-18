//
//  ViewController.h
//  Geocoder
//
//  Created by Giovanny Suarez on 18/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <MKMapViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *adressOutlet;
@property (strong, nonatomic) IBOutlet UITextField *cityOutlet;
@property (strong, nonatomic) IBOutlet UITextField *stateOutlet;
@property (strong, nonatomic) IBOutlet UITextField *zipOutlet;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)submitTapped:(id)sender;

@property CLLocation * selectedLocation;
@property NSMutableDictionary * placeDictionary;

@end
