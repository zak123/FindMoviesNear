//
//  TheaterCommunicatorDelegate.h
//  FindMoviesNear
//
//  Created by Zachary Mallicoat on 4/2/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TheaterCommunicatorDelegate

-(void)receivedMoviesJSON:(NSData*)objectNotation;
-(void)receivedTheatresJSON:(NSData *)theatreNotation;


@end
