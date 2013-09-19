//
//  DisplayMap.h
//  Distancia Mapkit
//
//  Created by Giovanny Suarez on 19/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface DisplayMap : NSObject <MKAnnotation>

@property CLLocationCoordinate2D coordinate;
@property NSString * title;
@property NSString * subtitle;
@end
