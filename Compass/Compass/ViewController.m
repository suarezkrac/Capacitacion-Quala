//
//  ViewController.m
//  Compass
//
//  Created by Giovanny Suarez on 25/09/13.
//  Copyright (c) 2013 Giovanny Suarez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize locationManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.headingFilter = 1;
    locationManager.delegate = self;
    [locationManager startUpdatingHeading];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    float oldRad = -manager.heading.trueHeading * M_PI/ 180.0f;
    float newRad = -newHeading.trueHeading * M_PI/ 180.0f;
    
    CABasicAnimation *theAnimation;
    
    theAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    theAnimation.fromValue = [NSNumber numberWithFloat:oldRad];
    theAnimation.toValue = [NSNumber numberWithFloat:newRad];
    theAnimation.duration = 0.5f;
    
    [compassImage.layer addAnimation:theAnimation forKey:@"animateMyRotation"];
    compassImage.transform = CGAffineTransformMakeRotation(newRad);

}








@end
