//
//  MADViewController.m
//  helloname
//
//  Created by Aileen Pierce on 9/1/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDoneEditing:(UITextField *)sender {
    [sender resignFirstResponder];
	NSString *message = [[NSString alloc] initWithFormat:@"Hello, %@", _nameField.text];
	_messageField.text=message;
}
@end
