//
//  MADArchive.h
//  task
//
//  Created by Aileen Pierce on 12/1/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MADArchive : NSObject<NSCoding, NSCopying>
@property(copy, nonatomic)NSString *taskone;
@property(copy, nonatomic)NSString *tasktwo;
@property(copy, nonatomic)NSString *taskthree;
@property(copy, nonatomic)NSString *taskfour;

@end
