//
//  mapPoint.m
//  MapKit
//
//  Created by Estudiante on 16/09/13.
//  Copyright (c) 2013 QUALA. All rights reserved.
//

#import "mapPoint.h"


@implementation mapPoint

@synthesize coordinate, title;

- (id)init
{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Hola!!!"];
}

- (id) initWithCoordinate:(CLLocationCoordinate2D)c title: (NSString *) t
{
    self = [super init];
    if(self)
    {
         coordinate = c;
        [self setTitle:t];
    }
    return self;
}

@end
