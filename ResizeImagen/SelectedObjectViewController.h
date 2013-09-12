//
//  SelectedObjectViewController.h
//  ResizeImagen
//
//  Created by Giovanny Suarez on 5/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectedObjectViewController : UIImageView
{
    BOOL isObjectSelected;
    BOOL isObjectGrouped;
}
@property BOOL isObjectSelected, isObjectGrouped;

/*
@property BOOL isObjectSelected;
@property BOOL isObjectGrouped;
*/
@end
