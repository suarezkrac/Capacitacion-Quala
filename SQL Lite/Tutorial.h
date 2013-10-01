//
//  Tutorial.h
//  SQL Lite
//
//  Created by Giovanny Suarez on 30/09/13.
//  Copyright (c) 2013 Giovanny Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tutorial : NSObject
{
    
}

@property(nonatomic) int id_tutorial;
@property(nonatomic, retain) NSString *sistema;
@property(nonatomic, retain) NSString *nombre;
@property(nonatomic) bool terminado;

@end
