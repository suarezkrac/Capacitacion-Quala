//
//  ViewController.h
//  MonkeyPinch
//
//  Created by Ray Wenderlich on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>

/*- (IBAction)handlePan:(UIPanGestureRecognizer *)sender;*/
- (IBAction)handlePinch:(UIPinchGestureRecognizer *)sender;
- (IBAction)handleRotate:(UIRotationGestureRecognizer *)sender;

@property (strong, nonatomic) IBOutlet UIImageView *mico;

- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)sender;


@property AVAudioPlayer * compPlayer;
@property AVAudioPlayer * hehePlayer;

@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *monkeyPan;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *bananaPan;


@end
