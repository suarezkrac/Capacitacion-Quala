//
//  myAnnotation.h
//  MapView
//
//  Created by Giovanny Suarez on 17/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface myAnnotation : NSObject <MKAnnotation>

@property NSString * title;
@property CLLocationCoordinate2D coordinate;

-(id) initWithCoordinate: (CLLocationCoordinate2D) coordinate title: (NSString *) title;

@end
