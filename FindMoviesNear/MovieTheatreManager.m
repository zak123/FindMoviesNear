//
//  MovieTheatreManager.m
//  FindMoviesNear
//
//  Created by Zachary Mallicoat on 4/2/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "MovieTheatreManager.h"
#import "MovieBuilder.h"
#import "TheaterCommunicator.h"

@implementation MovieTheatreManager

-(void)fetchMovies {
    [_communicator listMovies];
    
    // Delegate out a way to list all movies from json that are in theatres
}


-(void)fetchTheatresAtAddress:(NSString*)address andMovie:(NSString*)movie {
    [_communicator listTheatresAtAddress:address andMovie:movie];
    
    // Delegate out to list all theatres from converted address for selected movie
}


// Know when received movies

-(void)receivedMoviesJSON:(NSData *)objectNotation {
    
    NSError *error = nil;
    
    NSArray *movies = [MovieBuilder moviesFromJSON:objectNotation error:&error];
    
    // tell we did received movies
    [self.delegate didReceiveMovies:movies];
    
}

-(void)receivedTheatresJSON:(NSData *)theatreNotation {
    
    NSError *error = nil;
    
    NSArray *theatres = [MovieBuilder theatresFromJSON:theatreNotation error:&error];
    [self.delegate didReceiveTheatres:theatres];
    // maybe second delegate to receive theatre data? idk yet.
    
    
}
@end
