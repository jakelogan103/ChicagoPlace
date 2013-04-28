//
//  OptionsViewController.m
//  TheChicagoPlace
//
//  Created by Jake Logan on 4/26/13.
//  Copyright (c) 2013 The Chicago Place, LLC. All rights reserved.
//

#import "OptionsViewController.h"
#import "CreditCardViewController.h"
#import "DirectionsViewController.h"

@interface OptionsViewController ()

@end

@implementation OptionsViewController

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
    self.title=@"Options";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)CreditCardButtonPressed:(id)sender
{
    CreditCardViewController *creditcard=[[CreditCardViewController alloc] init];
    [self.navigationController pushViewController:creditcard animated:YES];
}

-(IBAction)DirectionsButtonPressed:(id)sender
{
    DirectionsViewController *directions=[[DirectionsViewController alloc] init];
    [self.navigationController pushViewController:directions animated:YES];
}

-(IBAction)callPhone:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:2057895163"]];
}


@end
