//
//  mapPoint.h
//  MapKit
//
//  Created by Estudiante on 16/09/13.
//  Copyright (c) 2013 QUALA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface mapPoint : NSObject <MKAnnotation>

//obligatoria
@property CLLocationCoordinate2D coordinate;

// opcional
@property NSString * title;

// constructor propio
- (id) initWithCoordinate:(CLLocationCoordinate2D)c title: (NSString *) t;

@end
