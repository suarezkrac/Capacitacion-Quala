//
//  HelloQuartzView.m
//  Quartz
//
//  Created by Giovanny Suarez on 23/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import "HelloQuartzView.h"



@implementation HelloQuartzView

CGColorRef THRandomColor() {
	CGFloat red = (arc4random() % 256) / 255.0f;
	CGFloat green = (arc4random() % 256) / 255.0f;
	CGFloat blue = (arc4random() % 256) / 255.0f;
	return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f].CGColor;
}

-(void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, THRandomColor());
    CGContextFillRect(context, rect);
    

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
