//
//  DetailViewController.h
//  countries_scratch
//
//  Created by Aileen Pierce on 10/22/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>
@property(strong,nonatomic)NSMutableArray *countryList;
@end
