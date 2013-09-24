//
//  QuartzView.h
//  Quartz
//
//  Created by Giovanny Suarez on 23/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface QuartzView : UIView

@property CGPoint firstTouch;
@property CGPoint lastTouch;

@property UIColor * currentColor;
@property ShapeType shapeType;

@property UIImage * drawImage;
@property BOOL useRandomColor;

@property CGRect currentRect;
@property CGRect redrawRect;

@end
