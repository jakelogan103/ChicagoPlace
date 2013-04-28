//
//  CreditCardViewController.m
//  TheChicagoPlace
//
//  Created by Jake Logan on 4/27/13.
//  Copyright (c) 2013 The Chicago Place, LLC. All rights reserved.
//

#import "CreditCardViewController.h"
#import "UpdateCardViewController.h"

@interface CreditCardViewController ()

@end

@implementation CreditCardViewController

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
    self.title = @"Credit Card Info";
    const char *dbpath =[@"/Users/jakelogan/chicagoplace.sqlite" UTF8String];
    sqlite3_stmt *statement;
    sqlite3* contactDB;
    NSString* querySQL=[NSString stringWithFormat:@"SELECT number, expiredate, name FROM creditcards"];
    const char *query_stmt = [querySQL UTF8String];
    sqlite3_open(dbpath, &contactDB);
    sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL);
    if(sqlite3_step(statement)==SQLITE_ROW)
    {
        NSString* name = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
        self.nameLabel.text = name;
        NSString* number = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
        number=[number substringFromIndex:12];
        self.numberLabel.text = number;
        NSString* date = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
        date = [date substringToIndex:7];
        NSString* year = [date substringToIndex:4];
        NSString* month = [date substringFromIndex:5];
        self.date1Label.text = month;
        self.date2Label.text = year;
    }
   sqlite3_close(contactDB);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)EditInfoButtonPressed:(id)sender
{
    UpdateCardViewController *updateCard=[[UpdateCardViewController alloc] init];
    updateCard.oldName=self.nameLabel.text;
    [self.navigationController pushViewController:updateCard animated:YES];
}

@end
