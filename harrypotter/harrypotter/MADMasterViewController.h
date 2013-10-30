//
//  MADMasterViewController.h
//  harrypotter
//
//  Created by Aileen Pierce on 10/28/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MADDetailViewController;

@interface MADMasterViewController : UITableViewController

@property (strong, nonatomic) MADDetailViewController *detailViewController;
@property (copy, nonatomic) NSArray *characters;

@end
