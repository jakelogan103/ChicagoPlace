//
//  FoodSelectionViewController.h
//  TheChicagoPlace
//
//  Created by Jake Logan on 4/27/13.
//  Copyright (c) 2013 The Chicago Place, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodSelectionViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView* tableView;
@property (strong, nonatomic) IBOutlet UIPickerView* pickerView;
@property (strong, nonatomic) NSMutableArray* tableData;
@property (strong, nonatomic) NSMutableArray* pickerData;


@end
