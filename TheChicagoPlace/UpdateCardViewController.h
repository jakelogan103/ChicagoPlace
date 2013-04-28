//
//  UpdateCardViewController.h
//  TheChicagoPlace
//
//  Created by Jake Logan on 4/27/13.
//  Copyright (c) 2013 The Chicago Place, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface UpdateCardViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *cardnumber;
@property (weak, nonatomic) IBOutlet UITextField *securitycode;
@property (weak, nonatomic) IBOutlet UITextField *datemonth;
@property (weak, nonatomic) IBOutlet UITextField *dateyear;
@property (copy, nonatomic) NSString *oldName;
- (IBAction)ChangeButtonPressed:(id)sender;

@end
