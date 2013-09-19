//
//  ViewController.h
//  Distancia Mapkit
//
//  Created by Giovanny Suarez on 19/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapVIew;
@property MKPolyline * routeLine;


@end
