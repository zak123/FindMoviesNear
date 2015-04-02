//
//  MovieBuilder.m
//  FindMoviesNear
//
//  Created by Zachary Mallicoat on 4/2/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "MovieBuilder.h"
#import "Movies.h"
#import "Theatres.h"

@implementation MovieBuilder


// Builds NSArray out of data parsed by communicator, formatting each cell with the name of the theater and the address of the theater

+ (NSArray *)moviesFromJSON:(NSData *)objectNotation error:(NSError **)error {
    
    NSError *parseError = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&parseError];
    
    if (parseError != nil) {
        *error = parseError;
        return nil;
    }
    
    NSMutableArray *movies = [[NSMutableArray alloc]init];
    
    NSArray *results = dataDictionary[@"movies"];
    
    
    NSLog(@"%lu", (unsigned long)results.count);
    
    for (NSDictionary *movieDic in results) {
        Movies *movie = [[Movies alloc]init];
        
        movie.movieName = movieDic[@"title"];
        movie.movieSynposis = movieDic[@"synopsis"];
        
        [movies addObject:movie];
    }
    
    return movies;
}

+ (NSArray *)theatresFromJSON:(NSData *)theatreNotation error:(NSError **)error {
    
    NSError *parseError = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:theatreNotation options:0 error:&parseError];
    
    if (parseError != nil) {
        *error = parseError;
        return nil;
    }
    
    NSMutableArray *theatres = [[NSMutableArray alloc]init];
    
    NSArray *results = dataDictionary[@"theatres"];
    
    
    NSLog(@"%lu", (unsigned long)results.count);
    
    for (NSDictionary *theatreDic in results) {
        Theatres *theatre = [[Theatres alloc]init];
        
        theatre.theatreName = theatreDic[@"name"];
        theatre.theatreAddress = theatreDic[@"address"];
//        theatre.theatreLocation = [[CLLocation alloc] initWithLatitude:*(CLLocationDegrees*)theatreDic[@"lat"] longitude:*(CLLocationDegrees*)theatreDic[@"lng"]];
        theatre.theatreLattitude = theatreDic[@"lat"];
        theatre.theatreLongitude = theatreDic[@"lng"];
        
        [theatres addObject:theatre];
    }
    
    return theatres;
}

@end
