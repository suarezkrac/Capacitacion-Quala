//
//  SegundoViewController.h
//  VariableView
//
//  Created by Giovanny Suarez on 5/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegundoViewController : UIViewController

@property int kilometros;

@property (strong, nonatomic) IBOutlet UILabel *display;

-(void)setKilometaje:(int)kilometros_var;

@end
