//
//  ViewController.h
//  MapKit
//
//  Created by Giovanny Suarez on 16/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "MapPoint.h"


@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
{
    CLLocationManager * locationManager;
}

@property (strong, nonatomic) IBOutlet UITextField *locationTitleField;
@property (strong, nonatomic) IBOutlet MKMapView *worldView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *MapType;

- (IBAction)changeMapType:(id)sender;

-(void)findLocation;
-(void)foundLocation: (CLLocation *)loc;

@end
