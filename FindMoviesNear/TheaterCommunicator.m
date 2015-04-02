//
//  TheaterCommunicator.m
//  FindMoviesNear
//
//  Created by Zachary Mallicoat on 4/2/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "TheaterCommunicator.h"
#import "TheaterCommunicatorDelegate.h"
#import "Movies.h"

#define API_KEY @"2ckft9dtnazuw4ks5qq3uhzu"

@implementation TheaterCommunicator

// fetch list of currently playing movies in theatres

-(void) listMovies {
    
    NSString *apiURLString = [NSString stringWithFormat:@"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=%@", API_KEY];
    
    NSURL *url = [[NSURL alloc] initWithString:apiURLString];
    NSLog(@"%@", apiURLString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if (error) {
             NSLog(@"Error fetching data");
         }
         
         else {
             [self.delegate receivedMoviesJSON:data];
             
         }
         
     }];
}



// searchMoviesAtAddress takes in converted address string, and movie property of what movie they are looking for and fetches the json data.


-(void) listTheatresAtAddress:(NSString *)address andMovie:(NSString *)movie {
    NSString *apiURLString = [NSString stringWithFormat:@"http://lighthouse-movie-showtimes.herokuapp.com/theatres.json?address=%@&movie=%@", address, movie];
    
    NSURL *url = [[NSURL alloc] initWithString:apiURLString];
    NSLog(@"%@", apiURLString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if (error) {
             NSLog(@"Error fetching data");
         }
         
         else {
             
             [self.delegate receivedTheatresJSON:data];
             //return data
         }
         
     }];
}

@end
