//
//  ViewController.h
//  Camara
//
//  Created by Giovanny Suarez on 25/09/13.
//  Copyright (c) 2013 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePhoto:(id)sender;
- (IBAction)selectPhoto:(id)sender;
@end
