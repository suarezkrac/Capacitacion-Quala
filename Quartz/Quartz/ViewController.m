//
//  ViewController.m
//  Quartz
//
//  Created by Giovanny Suarez on 23/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"
#import "QuartzView.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize colorControl;


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

- (IBAction)changeColor:(id)sender {
    UISegmentedControl * control = sender;
    NSInteger index = [control selectedSegmentIndex];
    QuartzView * quartzView = (QuartzView *)self.view;
    
    switch (index) {
        case kRedColorTab:
            quartzView.currentColor = [UIColor redColor];
            quartzView.useRandomColor = NO;
            break;
        case kBlueColorTab:
            quartzView.currentColor = [UIColor blueColor];
            quartzView.useRandomColor = NO;
            break;
        case kYellowColorTab:
            quartzView.currentColor = [UIColor yellowColor];
            quartzView.useRandomColor = NO;
            break;
        case kGreenColorTab:
            quartzView.currentColor = [UIColor greenColor];
            quartzView.useRandomColor = NO;
            break;
        case kRandomColorTab:
            quartzView.useRandomColor = YES;
            break;
            
        default:
            break;
    }
}

- (IBAction)changeShape:(id)sender {
    UISegmentedControl * control = sender;
    NSLog(@"%ld", (long)[control selectedSegmentIndex]);
    [(QuartzView *)self.view setShapeType:[control selectedSegmentIndex]];
}
@end
