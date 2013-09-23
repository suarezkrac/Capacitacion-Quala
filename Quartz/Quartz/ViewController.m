//
//  ViewController.m
//  Quartz
//
//  Created by Giovanny Suarez on 23/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import "ViewController.h"
#import "HelloQuartzView.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView{
    //CONEXION PARA EDIAR EL VIEW
    self.view = [[HelloQuartzView alloc] initWithFrame: CGRectMake(0, 0, 500, 500)];
    UIGestureRecognizer * recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(repaintView)];
    [self.view addGestureRecognizer:recognizer];
    
}
-(void)repaintView{
    [self.view setNeedsDisplay];
}
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

@end
