//
//  myAnnotation.m
//  MapView
//
//  Created by Giovanny Suarez on 17/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import "myAnnotation.h"

@implementation myAnnotation
//@synthesize title, coordinate;

-(id) initWithCoordinate: (CLLocationCoordinate2D) coordinate title: (NSString *) title{
    if (self =[super init ]) {
        self.coordinate = coordinate;
        self.title = title;
    }
    
    return self;
}
@end 
