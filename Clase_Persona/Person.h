//
//  Person.h
//  Clase_Persona
//
//  Created by Giovanny Suarez on 4/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString * name;
    int age;
}
-(NSString *)name;
-(void) setName:(NSString *)value;

-(int)age;
-(void) setAge:(int)value;

-(BOOL) usuarioLegalmentePuedeCasarse;

@end
