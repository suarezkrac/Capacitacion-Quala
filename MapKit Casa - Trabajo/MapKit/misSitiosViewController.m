//
//  misSitiosViewController.m
//  MapKit
//
//  Created by Estudiante on 16/09/13.
//  Copyright (c) 2013 QUALA. All rights reserved.
//

#import "misSitiosViewController.h"

@interface misSitiosViewController ()

@end

@implementation misSitiosViewController


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%@", segue.identifier);
    if([segue.identifier isEqualToString:@"MiCasa"])
    {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:4.681642 longitude:-74.051478];
        [segue.destinationViewController setRegion1:location imageString:@"casa"];
    }
    else if([segue.identifier isEqualToString:@"MiOficina"])
    {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:4.599573 longitude:-74.138998];
        [segue.destinationViewController setRegion1:location imageString:@"bonice"];
    }

}



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}



@end
