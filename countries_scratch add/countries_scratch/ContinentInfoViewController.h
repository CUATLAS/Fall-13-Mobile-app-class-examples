//
//  ContinentInfoViewController.h
//  countries_scratch
//
//  Created by Aileen Pierce on 10/25/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContinentInfoViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *continentName;
@property (weak, nonatomic) IBOutlet UILabel *countryNumber;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *number;

@end
