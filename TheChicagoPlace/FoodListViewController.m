//
//  FoodListViewController.m
//  TheChicagoPlace
//
//  Created by Jake Logan on 4/27/13.
//  Copyright (c) 2013 The Chicago Place, LLC. All rights reserved.
//


#import "FoodListViewController.h"
#import "FoodSelectionViewController.h"

@interface FoodListViewController ()

@end

@implementation FoodListViewController

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
    if ([self.title isEqualToString:@"Sandwiches and Dogs"]){
        tableData = [NSArray arrayWithObjects:@"Chicago Hot Dog",@"Coney Island Dog",@"Double Dog",@"Maxwell Street Polish",@"Italian Beef",@"Pork Chop Sandwich",@"Chargrilled Cheeseburger",@"Grilled Chicken Sandwich",@"Buffalo Chicken Sandwich", nil];
    }else if ([self.title isEqualToString:@"Specials"]){
        tableData = [NSArray arrayWithObjects:@"Grease Bucket",@"Fat Boy",@"Twice Fried Dog", nil];
    }else if ([self.title isEqualToString:@"Pizzas"]){
        tableData = [NSArray arrayWithObjects:@"Buffalo Chicken",@"BBQ Chicken",@"Italian Beef", nil];
    }else if ([self.title isEqualToString:@"Sides"]){
        tableData = [NSArray arrayWithObjects:@"Fries",@"Onion Rings",@"Mozzarella Sticks",@"Jalapeno Poppers",@"Buffalo Chicken Bites", nil];
    }else if ([self.title isEqualToString:@"Brewskis"]){
        tableData = [NSArray arrayWithObjects:@"Bud Light",@"Coors Light",@"Goose Island Green Line",@"Goose Island 312 Urban Wheat", nil];
    }else if ([self.title isEqualToString:@"Pop"]){
        tableData = [NSArray arrayWithObjects:@"Lemonade",@"Fruit Punch",@"Coke Products", nil];
    }
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
    NSString *foodchoice= cell.textLabel.text;
    FoodSelectionViewController *foodselection = [[FoodSelectionViewController alloc] init];
    foodselection.title = foodchoice;
    [self.navigationController pushViewController:foodselection animated:YES];
}

@end
