//
//  ViewController.m
//  VariableView
//
//  Created by Giovanny Suarez on 5/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@"%@", segue.identifier);
    if ([segue.identifier isEqualToString:@"muyfeliz"]) {
        [segue.destinationViewController setKilometaje:100];
    } else if ([segue.identifier isEqualToString:@"feliz"]) {
        [segue.destinationViewController setKilometaje:75];
    } else if ([segue.identifier isEqualToString:@"triste"]) {
        [segue.destinationViewController setKilometaje:20];
    } else if ([segue.identifier isEqualToString:@"muytriste"]) {
        [segue.destinationViewController setKilometaje:1];
    }
    
}

@end
