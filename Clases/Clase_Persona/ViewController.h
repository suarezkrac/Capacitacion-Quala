//
//  ViewController.h
//  Clase_Persona
//
//  Created by Giovanny Suarez on 4/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface ViewController : UIViewController

@property Person * persona;
@property (strong, nonatomic) IBOutlet UILabel *Etiqueta;

@end
