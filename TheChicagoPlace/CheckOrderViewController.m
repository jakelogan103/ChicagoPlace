//
//  CheckOrderViewController.m
//  TheChicagoPlace
//
//  Created by Jake Logan on 4/26/13.
//  Copyright (c) 2013 The Chicago Place, LLC. All rights reserved.
//

#import "CheckOrderViewController.h"

@interface CheckOrderViewController ()

@end

@implementation CheckOrderViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.orderArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [self.orderArray objectAtIndex:indexPath.row];
    
    return cell;
}
- (void)viewWillAppear:(BOOL)animated {
    NSMutableArray *initCars = [[NSMutableArray alloc] initWithObjects: nil];
    const char *dbpath = [@"/Users/jakelogan/carsdata.sqlite" UTF8String];
    sqlite3 *contactDB;
    sqlite3_stmt *statement;
    NSString *nickname;
    sqlite3_open(dbpath, &contactDB);
    NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT date FROM orders"];
    const char *query_stmt = [querySQL UTF8String];
    sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL);
    if (sqlite3_step(statement)==SQLITE_ROW)
    {
        do {
            nickname = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
            [initCars addObject:nickname];
        } while (sqlite3_step(statement)==SQLITE_ROW);
    }
    sqlite3_close(contactDB);
    self.orderArray = initCars;
    self.title=@"Order List";
    [super viewWillAppear:animated];
    self.navigationController.toolbarHidden = NO;
}

@end
