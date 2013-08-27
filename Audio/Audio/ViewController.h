//
//  ViewController.h
//  Audio
//
//  Created by Giovanny Suarez on 27/08/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

- (IBAction)play:(id)sender;
- (IBAction)pausa:(id)sender;
- (IBAction)stop:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *etiqueta;

- (IBAction)cambioVolumen:(id)sender;
- (IBAction)cambioVelocidad:(id)sender;

@property (strong, nonatomic) AVAudioPlayer * reproductor;

@end
