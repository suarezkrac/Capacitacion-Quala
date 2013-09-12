//
//  ViewController.h
//  ResizeImagen
//
//  Created by Giovanny Suarez on 5/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectedObjectViewController.h"

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>
{
    NSMutableArray * addObjectArray;
    
    UIImageView * dotBlueArea1, * dotBlueArea2, * dotBlueArea3, * dotBlueArea4, * dotBlueArea5, * dotBlueArea6, * dotBlueArea7, * dotBlueArea8;
    
    BOOL isDotBlueAreatouch1, isDotBlueAreatouch2, isDotBlueAreatouch3, isDotBlueAreatouch4, isDotBlueAreatouch5, isDotBlueAreatouch6, isDotBlueAreatouch7, isDotBlueAreatouch8;
    
    BOOL isSelectOjectMove, isObjectSelect, isGroup, isTouchDotArea, isSelecteObjectRemove;
    
    CGPoint touch1, touch2;
    
}
- (IBAction)tapGroup:(id)sender;
- (IBAction)tapUngroup:(id)sender;
- (IBAction)tapAdd:(id)sender;
@end
