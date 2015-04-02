//
//  MovieTheatreManager.h
//  FindMoviesNear
//
//  Created by Zachary Mallicoat on 4/2/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "MovieTheatreManagerDelegate.h"
#import "TheaterCommunicatorDelegate.h"
#import "TheaterCommunicator.h"


@class MovieTheaterCommunicator;


@interface MovieTheatreManager : NSObject<TheaterCommunicatorDelegate>

@property (strong, nonatomic) TheaterCommunicator *communicator;
@property (weak, nonatomic) id<MovieTheatreManagerDelegate> delegate;


-(void)fetchMovies;
-(void)fetchTheatresAtAddress:(NSString*)address andMovie:(NSString*)movie;


@end
