//
//  MADViewController.h
//  helloworld2c
//
//  Created by Aileen Pierce on 9/3/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *messageText;
- (IBAction)buttonPressed:(UIButton *)sender;

@end
