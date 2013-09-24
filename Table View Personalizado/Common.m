//
//  Common.m
//  Table View Personalizado
//
//  Created by Giovanny Suarez on 24/09/13.
//  Copyright (c) 2013 Giovanny Suarez. All rights reserved.
//

#import "Common.h"
void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor){
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0.0, 1.0};
    
    NSArray * colors = @[(__bridge_transfer id)startColor, (__bridge_transfer id)endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge_retained CFArrayRef)colors, locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    
    CGContextRestoreGState(context);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
}
void draw1PxStroke(CGContextRef context, CGPoint startpoint, CGPoint endpoint, CGColorRef color){
    CGContextSaveGState(context);
    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextSetStrokeColorWithColor(context, color);
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, startpoint.x + 0.5, startpoint.y +0.5);
    CGContextAddLineToPoint(context, endpoint.x +0.5, endpoint.y + 0.5);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
}

CGRect rectFor1pxStroke(CGRect rect){
    return CGRectMake(rect.origin.x + 0.5, rect.origin.y + 0.5, rect.size.width-1, rect.size.height-1);
}
void drawGlossAndGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor){
    
    drawLinearGradient(context, rect, startColor, endColor);
    UIColor * glossColor1 = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.35];
    UIColor * glossColor2 = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.1];
    
    CGRect tophalf = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height/2);
    
    drawLinearGradient(context, tophalf, glossColor1.CGColor, glossColor2.CGColor);
}

CGMutablePathRef createArcPathFormBottomOfRect(CGRect rect, CGFloat arcHeigth)
{
    CGRect arcRect = CGRectMake(rect.origin.x, rect.origin.y + rect.size.height - arcHeigth, rect.size.width, arcHeigth);
    
    CGFloat arcRadius = (arcRect.size.height/2)+ (pow(arcRect.size.width, 2)/(8*arcRect.size.height));
    
    CGPoint arcCenter = CGPointMake(arcRect.origin.x + arcRect.size.width/2, arcRect.origin.y+ arcRadius);
    
    CGFloat angle = acos(arcRect.size.width/(2*arcRadius));
    
    CGFloat startAngle = radians(180) + angle;
    CGFloat endAngle = radians(360) - angle;
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddArc(path, NULL, arcCenter.x, arcCenter.y, arcRadius, startAngle, endAngle, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMinY(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMaxY(rect));
    
    return  path;
}

/*
@implementation Common

@end
*/