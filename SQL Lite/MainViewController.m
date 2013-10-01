//
//  MainViewController.m
//  SQL Lite
//
//  Created by Giovanny Suarez on 30/09/13.
//  Copyright (c) 2013 Giovanny Suarez. All rights reserved.
//

#import "MainViewController.h"
#import "AddViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addRegister:(id)sender {
    AddViewController *addViewController = [[AddViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:addViewController animated:YES];
    
}

- (IBAction)listado:(id)sender {
}
@end
