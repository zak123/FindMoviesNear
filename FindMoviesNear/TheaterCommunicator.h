//
//  TheaterCommunicator.h
//  FindMoviesNear
//
//  Created by Zachary Mallicoat on 4/2/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TheaterCommunicatorDelegate;

@interface TheaterCommunicator : NSObject

@property (weak, nonatomic) id<TheaterCommunicatorDelegate> delegate;

-(void)listMovies;
-(void)listTheatresAtAddress:(NSString *)address andMovie:(NSString *)movie;


@end