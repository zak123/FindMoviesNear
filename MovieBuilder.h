//
//  MovieBuilder.h
//  FindMoviesNear
//
//  Created by Zachary Mallicoat on 4/2/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieBuilder : NSObject

+ (NSArray *)moviesFromJSON:(NSData *)objectNotation error:(NSError **)error;
+ (NSArray *)theatresFromJSON:(NSData *)theatreNotation error:(NSError **)error;

@end
