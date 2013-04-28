//
//  UpdateCardViewController.m
//  TheChicagoPlace
//
//  Created by Jake Logan on 4/27/13.
//  Copyright (c) 2013 The Chicago Place, LLC. All rights reserved.
//

#import "UpdateCardViewController.h"


@interface UpdateCardViewController ()

@end

@implementation UpdateCardViewController

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
    self.name.tag=1;
    self.cardnumber.tag=2;
    self.dateyear.tag=3;
    self.datemonth.tag=4;
    self.securitycode.tag=5;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    if(touch.phase==UITouchPhaseBegan){
        //find first response view
        for (UIView *view in [self.view subviews]) {
            if ([view isFirstResponder]) {
                [view resignFirstResponder];
                break;
            }
        }
    }
}

- (IBAction)ChangeButtonPressed:(id)sender
{
    self.title = @"Credit Card Info";
    const char *dbpath =[@"/Users/jakelogan/chicagoplace.sqlite" UTF8String];
    sqlite3_stmt *statement;
    sqlite3* contactDB;
    NSString* querySQL=[NSString stringWithFormat:@"UPDATE creditcards SET name = \"%@\", number = \"%@\", code = \"%@\", expiredate = \"%@-01-%@\" WHERE name = \"%@\"", self.name.text, self.cardnumber.text, self.securitycode.text, self.datemonth.text, self.dateyear.text, self.oldName];
    const char *query_stmt = [querySQL UTF8String];
    sqlite3_open(dbpath, &contactDB);
    sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL);
    sqlite3_step(statement);
    sqlite3_finalize(statement);
    sqlite3_close(contactDB);
    [self.navigationController popViewControllerAnimated:YES];
}
@end
