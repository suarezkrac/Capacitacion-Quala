//
//  QuartzView.m
//  Quartz
//
//  Created by Giovanny Suarez on 23/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import "QuartzView.h"
#import "UIColor+Random.h"

@implementation QuartzView

@synthesize firstTouch, lastTouch, currentColor, drawImage, useRandomColor, shapeType, redrawRect, currentRect;

-(CGRect)currentRect{
    return CGRectMake(firstTouch.x,
                      firstTouch.y,
                      lastTouch.x - firstTouch.x,
                      lastTouch.y - firstTouch.y);
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    if( self = [super initWithCoder:aDecoder]){
        currentColor = [UIColor redColor];
        useRandomColor = NO;
        self.drawImage = [UIImage imageNamed:@"iphone.png"];
    }
    return self;
}
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0f);
    CGContextSetStrokeColorWithColor(context, currentColor.CGColor);
    CGContextSetFillColorWithColor(context, currentColor.CGColor);
    
    switch (shapeType) {
        case kLineShape:
            CGContextMoveToPoint(context, firstTouch.x, firstTouch.y);
            CGContextAddLineToPoint(context, lastTouch.x, lastTouch.y);
            CGContextStrokePath(context);
            break;
        case kRectShape:
            CGContextAddRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        case kEllipseShape:
            CGContextAddEllipseInRect(context, self.currentRect);
             CGContextDrawPath(context, kCGPathFillStroke);
            break;
        case kImageShape:{
            CGFloat horizontalOffset = drawImage.size.width /2;
            CGFloat verticalOffset = drawImage.size.height /2;
            CGPoint drawPoint = CGPointMake(lastTouch.x - horizontalOffset, lastTouch.y - verticalOffset);
            
            [drawImage drawAtPoint:drawPoint];
             break;
            }
           
            
        default:
            break;
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (useRandomColor) {
        self.currentColor = [UIColor randomColor];
    }
    UITouch * touch = [touches anyObject];
    firstTouch = [touch locationInView:self];
    lastTouch = [touch locationInView:self];
    [self setNeedsDisplay];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    lastTouch = [touch locationInView:self];
    redrawRect = CGRectUnion(redrawRect, self.currentRect);
    [self setNeedsDisplayInRect:redrawRect];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    lastTouch = [touch locationInView:self];
    redrawRect = CGRectUnion(redrawRect, self.currentRect);
    redrawRect = CGRectInset(redrawRect, -2.0, -2.0);
    [self setNeedsDisplayInRect:redrawRect];
}














@end
