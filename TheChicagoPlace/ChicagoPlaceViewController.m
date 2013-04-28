//
//  ChicagoPlaceViewController.m
//  TheChicagoPlace
//
//  Created by Jake Logan on 4/26/13.
//  Copyright (c) 2013 The Chicago Place, LLC. All rights reserved.
//

#import "ChicagoPlaceViewController.h"
#import "NewOrderViewController.h"
#import "CheckOrderViewController.h"
#import "OptionsViewController.h"

@interface ChicagoPlaceViewController ()

@end

@implementation ChicagoPlaceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)newOrderButtonPressed:(id)sender
{
    NewOrderViewController *addOrder=[[NewOrderViewController alloc] init];
    [self.navigationController pushViewController:addOrder animated:YES];
}

-(IBAction)CheckOrdersButtonPressed:(id)sender
{
    CheckOrderViewController *checkOrders=[[CheckOrderViewController alloc] init];
    [self.navigationController pushViewController:checkOrders animated:YES];
}

-(IBAction)OptionsButtonPressed:(id)sender
{
    OptionsViewController *addOrder=[[OptionsViewController alloc] init];
    [self.navigationController pushViewController:addOrder animated:YES];
}

@end
