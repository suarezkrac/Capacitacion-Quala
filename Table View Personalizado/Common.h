//
//  Common.h
//  Table View Personalizado
//
//  Created by Giovanny Suarez on 24/09/13.
//  Copyright (c) 2013 Giovanny Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor);

void draw1PxStroke(CGContextRef context, CGPoint startpoint, CGPoint endpoint, CGColorRef color);

CGRect rectFor1pxStroke(CGRect rect);

void drawGlossAndGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor);

CGMutablePathRef createArcPathFormBottomOfRect(CGRect rect, CGFloat arcHeigth);

double radians (double degress) { return  degress * M_PI/180;};
/*@interface Common : NSObject

@end
*/