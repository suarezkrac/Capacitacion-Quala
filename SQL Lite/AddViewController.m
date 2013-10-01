//
//  AddViewController.m
//  SQL Lite
//
//  Created by Giovanny Suarez on 30/09/13.
//  Copyright (c) 2013 Giovanny Suarez. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addTutorial:(id)sender {
    if(![nombreTextField.text isEqualToString:@""])
    {
        
        if(auxTutorial == nil)
        {
            auxTutorial = [[Tutorial alloc]init];
            
        }
        
        auxTutorial.nombre = nombreTextField.text;
        
        switch (sistemaSegControl.selectedSegmentIndex) {
            case 0:
                auxTutorial.sistema = @"iOS";
                break;
            case 1:
                auxTutorial.sistema = @"Android";
            default:
                break;
        }
        
        auxTutorial.terminado = [terminadoSwitch isOn];
        
        
        sqlite3 *database;
        
        sqlite3_stmt *compiledStatement;
        
        
        if(sqlite3_open([appDelegate.databasePath UTF8String], &database) == SQLITE_OK) {

            
            NSString *sqlStatement = [NSString stringWithFormat:@"Insert into Tutoriales (\"sistema\",\"nombre\", \"terminado\") VALUES (\"%@\",\"%@\",\"%d\")",
                                      auxTutorial.sistema,
                                      auxTutorial.nombre,
                                      auxTutorial.terminado
                                      ];
            
            
            
            
            if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
                
                while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                    NSLog(@"ok");
                }
                
            } else {
                                    NSLog(@"erorr");
            }
            
            sqlite3_finalize(compiledStatement);
            
        }
        
        sqlite3_close(database);
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)esconderTeclado:(id)sender {
    [nombreTextField resignFirstResponder];
}
@end
