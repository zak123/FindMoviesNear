//
//  MovieTheatreManagerDelegate.h
//  FindMoviesNear
//
//  Created by Zachary Mallicoat on 4/2/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MovieTheatreManagerDelegate

@optional
-(void)didReceiveMovies:(NSArray *)movies;
-(void)didReceiveTheatres:(NSArray *)theatres;


@end
