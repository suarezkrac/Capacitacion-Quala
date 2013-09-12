//
//  SegundoViewController.m
//  VariableView
//
//  Created by Giovanny Suarez on 5/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import "SegundoViewController.h"

@interface SegundoViewController ()

@end

@implementation SegundoViewController
@synthesize kilometros, display;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.display.text = [NSString stringWithFormat:@"%d", kilometros];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setKilometaje:(int)kilometros_var{
    kilometros = kilometros_var;
    NSString * result = [NSString stringWithFormat:@"%d", kilometros];
    NSLog(@"%@", result);
}

@end
