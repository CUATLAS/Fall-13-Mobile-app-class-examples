//
//  Scene2ViewController.h
//  favorites
//
//  Created by Aileen Pierce on 10/9/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Favorite.h"

@interface Scene2ViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userBook;
@property (weak, nonatomic) IBOutlet UITextField *userAuthor;
@property (strong, nonatomic) Favorite *userInfo;

@end
