//
//  AppDelegate.h
//  SQL Lite
//
//  Created by Giovanny Suarez on 30/09/13.
//  Copyright (c) 2013 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSString * databaseName;
    NSString * databasePath;
}

@property (nonatomic, retain) NSString *databaseName;
@property (nonatomic, retain) NSString *databasePath;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainViewController *viewController;

-(void)loadDB;


@end
