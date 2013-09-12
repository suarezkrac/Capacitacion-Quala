//
//  ViewController.m
//  MonkeyPinch
//
//  Created by Ray Wenderlich on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize bananaPan;
@synthesize monkeyPan;
@synthesize compPlayer, hehePlayer, mico;

-(AVAudioPlayer *) loadWav:(NSString *) filename{

    NSURL * url = [[NSBundle mainBundle] URLForResource:filename withExtension:@"wav"];
    NSError * error;
    
    AVAudioPlayer * player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    if (!player) {
        NSLog(@"Error cargando %@: %@", url, error.localizedDescription);
    }
    else{
        [player prepareToPlay];
    }
    return  player;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    for (UIView * view in self.view.subviews) {
        
        UITapGestureRecognizer * recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        recognizer.delegate = self;
        [view addGestureRecognizer:recognizer];
        [recognizer requireGestureRecognizerToFail:monkeyPan];
        [recognizer requireGestureRecognizerToFail:bananaPan];
    }

    self.compPlayer = [self loadWav:@"chomp"];
    self.hehePlayer = [self loadWav:@"hehehe1"];
 
}

- (void)viewDidUnload
{
    [self setBananaPan:nil];
    [self setMonkeyPan:nil];
    [self setMico:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

/*- (IBAction)handlePan:(UIPanGestureRecognizer *)sender {
    
    // Comment for panning
    // Uncomment for tickling
    //return;
    
    CGPoint translation = [sender translationInView:self.view];
    sender.view.center = CGPointMake(sender.view.center.x + translation.x, 
                                         sender.view.center.y + translation.y);
    [sender setTranslation:CGPointMake(0, 0) inView:self.view];
       
}
*/
- (IBAction)handlePinch:(UIPinchGestureRecognizer *)sender {
    
    sender.view.transform = CGAffineTransformScale(sender.view.transform, sender.scale, sender.scale);
    sender.scale = 1;
    
}

- (IBAction)handleRotate:(UIRotationGestureRecognizer *)sender {
    
    sender.view.transform = CGAffineTransformRotate(sender.view.transform, sender.rotation);
    sender.rotation = 0;
    
}

- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)sender {

    UIImage* imagen_nueva = [UIImage imageNamed:@"access0.png"];
    [mico setImage:imagen_nueva];

    
}


- (void)handleTap:(UITapGestureRecognizer *)sender {
    
    NSLog(@"%ld", (long)sender.view.tag);
    [self.hehePlayer play];
    
    UIImage * img = [UIImage imageNamed:@"monkey_1.png"];
    UIImageView * imgView = [[UIImageView alloc] initWithImage:img];
    imgView.center = CGPointMake(100, 100);
    [self.view addSubview:imgView];
}







@end
