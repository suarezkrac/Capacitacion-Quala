//
//  ViewController.h
//  Quartz
//
//  Created by Giovanny Suarez on 23/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)changeColor:(id)sender;
- (IBAction)changeShape:(id)sender;
@property (strong, nonatomic) IBOutlet UISegmentedControl *colorControl;

@end
