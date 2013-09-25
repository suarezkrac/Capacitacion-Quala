//
//  ViewController.h
//  Compass
//
//  Created by Giovanny Suarez on 25/09/13.
//  Copyright (c) 2013 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager * locationManager;
    IBOutlet UIImageView *compassImage;
    
}

@property CLLocationManager * locationManager;

@end
