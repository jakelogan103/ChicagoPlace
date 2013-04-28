//
//  NewOrderViewController.m
//  TheChicagoPlace
//
//  Created by Jake Logan on 4/26/13.
//  Copyright (c) 2013 The Chicago Place, LLC. All rights reserved.
//

#import "NewOrderViewController.h"
#import "FoodListViewController.h"

@interface NewOrderViewController ()

@end

@implementation NewOrderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.title=@"New Order";
    self.navigationController.toolbarHidden = YES;
    tableData = [NSArray arrayWithObjects:@"Sandwiches and Dogs",@"Specials",@"Pizzas",@"Sides",@"Pop",@"Brewskis", nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *foodcategory = cell.textLabel.text;
    FoodListViewController *foodlist = [[FoodListViewController alloc] init];
    foodlist.title = foodcategory;
    [self.navigationController pushViewController:foodlist animated:YES];
}



@end
