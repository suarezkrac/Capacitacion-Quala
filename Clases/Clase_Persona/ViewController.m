//
//  ViewController.m
//  Clase_Persona
//
//  Created by Giovanny Suarez on 4/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize persona;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    Person * juan = [Person alloc];
    [juan setName:@"JUAN PEREZ"];
    [juan setAge:19];
    
    
    NSLog(@"%@",juan.name);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
