//
//  AddViewController.h
//  SQL Lite
//
//  Created by Giovanny Suarez on 30/09/13.
//  Copyright (c) 2013 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "AppDelegate.h"
#import "Tutorial.h"


@interface AddViewController : UIViewController
{

    IBOutlet UITextField *nombreTextField;
    IBOutlet UISegmentedControl *sistemaSegControl;
    IBOutlet UISwitch *terminadoSwitch;
    AppDelegate *appDelegate;
    Tutorial *auxTutorial;
}

- (IBAction)addTutorial:(id)sender;
- (IBAction)esconderTeclado:(id)sender;

@end
