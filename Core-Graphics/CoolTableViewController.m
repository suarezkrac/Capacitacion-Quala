//
//  CoolTableViewController.m
//  CoolTable
//
//  Created by Edward on 13-6-16.
//  Copyright (c) 2013年 Lihang. All rights reserved.
//

#import "CoolTableViewController.h"
#import "CustomCellBackground.h"
#import "CustomHeader.h"
#import "CustomFooter.h"
@interface CoolTableViewController ()
@property (copy) NSArray *array;
@property (copy) NSMutableArray *thingsToLearn;
@property (copy) NSMutableArray *thingsLearned;

@end

@implementation CoolTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Core Graphics";
    self.thingsToLearn = [@[@"Drawing Rects",@"Drawing Gradients",@"Drawing Arcs"]mutableCopy];
    self.thingsLearned = [@[@"Table Views",@"UIKit",@"Objective-C"]mutableCopy];
    
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"main_bg.jpg"]];
    self.tableView.backgroundView = background;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CustomHeader *header = [[CustomHeader alloc] init];
    
    //获取section的Header Title
    header.titleLabel.text = [self tableView: tableView titleForHeaderInSection:section];
    
    if (section == 1) {
        header.lightColor = [UIColor colorWithRed:0.591 green:0.500 blue:0.847 alpha:1.000];
        header.darkColor = [UIColor colorWithRed:72/255.0 green:22/255.0 blue:137/255.0 alpha:1.0];
    }
    return header;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[CustomFooter alloc] init];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 15.0f;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.thingsToLearn.count;
    } else {
        return self.thingsLearned.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (![cell.backgroundView isKindOfClass:[CustomCellBackground class]]) {
        CustomCellBackground *backgroundCell = [[CustomCellBackground alloc] init];
        cell.backgroundView = backgroundCell;
    }
    
    if (![cell.selectedBackgroundView isKindOfClass:[CustomCellBackground class]]) {
        CustomCellBackground *selectedBackgroundCell = [[CustomCellBackground alloc] init];
        selectedBackgroundCell.selected = YES;
        cell.selectedBackgroundView = selectedBackgroundCell;
    }
    NSString *entry;
    
    if (indexPath.section == 0) {
        entry = self.thingsToLearn[indexPath.row];
        ((CustomCellBackground *) cell.backgroundView).lastCell = indexPath.row == self.thingsToLearn.count - 1;
        ((CustomCellBackground *)cell.selectedBackgroundView).lastCell = indexPath.row == self.thingsToLearn.count - 1;
    } else {
        entry = self.thingsLearned[indexPath.row];
        ((CustomCellBackground *)cell.backgroundView).lastCell = indexPath.row == self.thingsLearned.count - 1;
        ((CustomCellBackground *)cell.selectedBackgroundView).lastCell = indexPath.row == self.thingsLearned.count - 1;
    }

    cell.textLabel.text = entry;
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.highlightedTextColor = [UIColor blackColor];
    
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Things We'll Learn";
    } else {
        return @"Things Already Covered";
    }
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
