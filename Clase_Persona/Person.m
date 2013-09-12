//
//  Person.m
//  Clase_Persona
//
//  Created by Giovanny Suarez on 4/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import "Person.h"

@implementation Person

-(NSString *)name{
    return name;
}
-(void) setName:(NSString *)value{
    name = value;
}

-(int)age{
    return  age;
}
-(void) setAge:(int)value{
    age = value;
}

-(BOOL) usuarioLegalmentePuedeCasarse{
    if (age>=18) {
        return YES;
    }
    
    return NO;
}
@end
