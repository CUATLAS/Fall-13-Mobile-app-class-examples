//
//  MADViewController.m
//  task
//
//  Created by Aileen Pierce on 11/30/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import "MADViewController.h"
#import "MADArchive.h"

@interface MADViewController ()

@end

@implementation MADViewController

#define kFilename @"archive" //archive file name
#define kDataKey @"Data" //key value for encoding

-(NSString *)dataFilePath{
    //locates the document directory
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory=[paths objectAtIndex:0];
    //creates the full path to our data file
    return [docDirectory stringByAppendingPathComponent:kFilename];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *filePath=[self dataFilePath];
    //check to see if the file exists
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        //create an instance from the archive file
        NSData *data=[[NSMutableData alloc] initWithContentsOfFile:[self dataFilePath]];
        //create an instance to decode the data
        NSKeyedUnarchiver *unarchiver=[[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        //read the objects from the unarchiver
        MADArchive *taskArchive=[unarchiver decodeObjectForKey:kDataKey];
        [unarchiver finishDecoding]; //tell the unarchiver we're finished
        _task1.text=taskArchive.taskone;
        _task2.text=taskArchive.tasktwo;
        _task3.text=taskArchive.taskthree;
        _task4.text=taskArchive.taskfour;
    }
    UIApplication *app=[UIApplication sharedApplication]; //application instance
    //subscribe to the UIApplicationWillResignActiveNotification notification
    [[NSNotificationCenter defaultCenter] addObserver:self //MADViewController should be notified
                                             selector:@selector(applicationWillResignActive:) //call applicationWillResignActive when the notification is received
                                                 name:UIApplicationWillResignActiveNotification //notification posted when the app is no longer active
                                               object:app]; //the object we're getting the notification from
}

//called when the UIApplicationWillResignActiveNotification notification is posted
//all notification methods take a single NSNotification instance as their argument
-(void)applicationWillResignActive:(NSNotification *)notification{
    MADArchive *taskArchive=[[MADArchive alloc]init];
    taskArchive.taskone=_task1.text;
    taskArchive.tasktwo=_task2.text;
    taskArchive.taskthree=_task3.text;
    taskArchive.taskfour=_task4.text;
    //create an instance to hold the encoded data
    NSMutableData *data=[[NSMutableData alloc]init];
    //create instance to archive objects
    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    //archive objects
    [archiver encodeObject:taskArchive forKey:kDataKey];
    [archiver finishEncoding]; //tell the archiver we're finished
    //write the contents of the array to our plist file
    [data writeToFile:[self dataFilePath] atomically:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
