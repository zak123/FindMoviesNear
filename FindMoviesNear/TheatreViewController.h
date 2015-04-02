//
//  TheatreViewController.h
//  FindMoviesNear
//
//  Created by Zachary Mallicoat on 4/2/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Movies.h"
#import "Theatres.h"
#import "TheaterCommunicator.h"
#import "MovieTheatreManager.h"
#import "MovieBuilder.h"
#import <CoreLocation/CoreLocation.h>

@interface TheatreViewController : UITableViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) Movies *detailItem;
@property (strong, nonatomic) NSArray *theatres;



@end
