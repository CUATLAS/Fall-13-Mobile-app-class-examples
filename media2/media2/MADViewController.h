//
//  MADViewController.h
//  media2
//
//  Created by Aileen Pierce on 11/17/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface MADViewController : UIViewController<UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)cameraButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)actionButonTapped:(UIBarButtonItem *)sender;

@end
