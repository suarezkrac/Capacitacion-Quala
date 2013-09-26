//
//  ViewController.m
//  Acelerometro_Giroscopio
//
//  Created by Giovanny Suarez on 25/09/13.
//  Copyright (c) 2013 Giovanny Suarez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize accX,accY,accZ, rotX,rotY,rotZ,maxAccX,maxAccY,maxAccZ,maxRotX,maxRotY, maxRotZ, motionManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
    currentMaxAccelX = 0;
    currentMaxAccelY = 0;
    currentMaxAccelZ = 0;
    
    currentMaxRotX = 0;
    currentMaxRotY = 0;
    currentMaxRotZ = 0;
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .2;
    self.motionManager.gyroUpdateInterval = .2;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
                                                    [self outputAccelerationData:accelerometerData.acceleration];
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                    }
                                                 }
     ];
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
        [self outputRotationData:gyroData.rotationRate];
        
    }];
    
}

-(void)outputAccelerationData:(CMAcceleration)acceleration{
    self.accX.text = [NSString stringWithFormat:@"%.2f", acceleration.x];
    self.accY.text = [NSString stringWithFormat:@"%.2f", acceleration.y];
    self.accZ.text = [NSString stringWithFormat:@"%.2f", acceleration.z];
}
-(void)outputRotationData:(CMRotationRate)rotation{
    self.rotX.text = [NSString stringWithFormat:@"%.2f", rotation.x];
    self.rotY.text = [NSString stringWithFormat:@"%.2f", rotation.y];
    self.rotZ.text = [NSString stringWithFormat:@"%.2f", rotation.z];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)resetMaxValues:(id)sender {
}
@end
