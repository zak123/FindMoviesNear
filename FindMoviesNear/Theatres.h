//
//  Theatres.h
//  FindMoviesNear
//
//  Created by Zachary Mallicoat on 4/2/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Theatres : NSObject


@property (nonatomic, strong) NSString *theatreAddress;
@property (nonatomic, strong) NSString *theatreName;
//@property (nonatomic, strong) CLLocation *theatreLocation;
@property (nonatomic, assign) NSNumber *theatreLongitude;
@property (nonatomic, assign) NSNumber *theatreLattitude;



@end
