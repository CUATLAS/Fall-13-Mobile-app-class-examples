//
//  MADViewController.h
//  helloname
//
//  Created by Aileen Pierce on 9/1/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UILabel *messageField;
- (IBAction)textFieldDoneEditing:(UITextField *)sender;

@end
