//
//  DetailViewController.h
//  FindMoviesNear
//
//  Created by Zachary Mallicoat on 4/2/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>
#import "Movies.h"
#import "Theatres.h"
#import "TheaterCommunicator.h"
#import "MovieTheatreManager.h"
#import "MovieBuilder.h"

@interface DetailViewController : UIViewController<MKMapViewDelegate>

@property (weak, nonatomic) Theatres *detailItemTheatre;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end

