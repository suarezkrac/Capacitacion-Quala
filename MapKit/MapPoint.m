//
//  MapPoint.m
//  MapKit
//
//  Created by Giovanny Suarez on 16/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint

@synthesize coordinate, title;

-(id)init{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Holaa!!!"];
}

-(id)initWithCoordinate : (CLLocationCoordinate2D)c title: (NSString *) t{
    self = [super init];
    if(self){
        coordinate = c;
        [self setTitle:t];
    }
    return self;
}

@end
