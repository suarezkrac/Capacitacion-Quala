//
//  SelectedObjectViewController.m
//  ResizeImagen
//
//  Created by Giovanny Suarez on 5/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import "SelectedObjectViewController.h"

@interface SelectedObjectViewController ()

@end

@implementation SelectedObjectViewController

@synthesize isObjectGrouped, isObjectSelected;

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        //Codigo del constructor
        isObjectSelected = NO;
        isObjectGrouped = NO;
        
        self.userInteractionEnabled = YES;
    }
    return self;
}


@end
