//
//  MADAnnotation.h
//  location
//
//  Created by Aileen Pierce on 11/20/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MADAnnotation : NSObject<MKAnnotation>
@property (nonatomic, readonly)CLLocationCoordinate2D coordinate;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coor;
-(void)moveAnnotation:(CLLocationCoordinate2D)newCoordinate;

@end
