//
//  CountryViewController.h
//  countries_scratch
//
//  Created by Aileen Pierce on 10/25/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface CountryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *countryTextfield;
@property (copy, nonatomic) NSString *addedCountry;

@end
