//
//  MapPoint.h
//  MapKit
//
//  Created by Giovanny Suarez on 16/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapPoint : NSObject <MKAnnotation>

//Obligatioria
@property CLLocationCoordinate2D coordinate;

//Opcional
@property NSString * title;

//Contructor Propio
-(id)initWithCoordinate : (CLLocationCoordinate2D)c title: (NSString *) t;


@end
