//
//  ViewController.m
//  JSON
//
//  Created by Giovanny Suarez on 26/09/13.
//  Copyright (c) 2013 Giovanny Suarez. All rights reserved.
//

#define kJsonLoadURL [NSURL URLWithString: @"http://api.kivaws.org/v1/loans/search.json?status=fundraising"]
#define kQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#import "ViewController.h"

@interface ViewController ()
+(NSDictionary *)dictionaryWithContentsOfJSONURLString: (NSString *)urlAddress;
-(NSData * )toJSON;

@end

@implementation ViewController

+(NSDictionary *)dictionaryWithContentsOfJSONURLString: (NSString *)urlAddress{
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlAddress]];
    NSError * error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if(error != nil)
    {
        return nil;
    }
    return result;
}

-(NSData * )toJSON{
    NSError * error = nil;
    id result = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
    if(error != nil)
    {
        return nil;
    }
    return result;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    dispatch_async(kQueue, ^{
        NSData * data = [NSData dataWithContentsOfURL:kJsonLoadURL];
        [self performSelectorOnMainThread:@selector(fetchData:) withObject:data waitUntilDone:YES];
    });
}

-(void)fetchData:(NSData *)responseData{
    NSError * error;
    NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    NSArray * lastRegister = [json objectForKey:@"loans"];
    
    NSDictionary * registro = [lastRegister objectAtIndex:0];
    
    NSNumber * registro_id = [registro objectForKey:@"id"];
    NSString * registro_nombre = [registro objectForKey:@"name"];
    NSString * registro_actividad = [registro objectForKey:@"activity"];
    NSString * registro_fecha = [registro objectForKey:@"posted_date"];
    
    humanReadble.text = [NSString stringWithFormat:@"El registro %@, asigano al cliente %@ tiene a cargo un %@ y su ultimo acceso fue %@", registro_id, registro_nombre, registro_actividad, registro_fecha];
    
    NSDictionary * info = [NSDictionary dictionaryWithObjectsAndKeys:[registro objectForKey:@"id"], @"id",
                           [registro objectForKey:@"name"], @"nombre",
                           [registro objectForKey:@"activity"], @"actividad",
                           [registro objectForKey:@"posted_date"], @"fecha",  nil];
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:info options:kNilOptions error:&error];
    
    jsonSummary.text = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
