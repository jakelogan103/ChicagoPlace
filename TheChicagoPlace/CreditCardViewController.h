//
//  CreditCardViewController.h
//  TheChicagoPlace
//
//  Created by Jake Logan on 4/27/13.
//  Copyright (c) 2013 The Chicago Place, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface CreditCardViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (nonatomic, retain) IBOutlet UILabel *numberLabel;
@property (nonatomic, retain) IBOutlet UILabel *date1Label;
@property (nonatomic, retain) IBOutlet UILabel *date2Label;

@end
