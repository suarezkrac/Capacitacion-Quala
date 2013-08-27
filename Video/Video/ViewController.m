//
//  ViewController.m
//  Video
//
//  Created by Giovanny Suarez on 27/08/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize reproductor;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString * ruta = [[NSBundle mainBundle] pathForResource:@"BigBuckBunny" ofType:@"mp4"];
    
    NSURL * url = [[NSURL alloc] initFileURLWithPath:ruta];
    
    reproductor = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    reproductor.view.frame = CGRectMake(10, 10, 300, 300);
    
    [self.view addSubview:reproductor.view];
    
    [reproductor play];
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
