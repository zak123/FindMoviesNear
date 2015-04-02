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

@property (strong, nonatomic) Theatres *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end

