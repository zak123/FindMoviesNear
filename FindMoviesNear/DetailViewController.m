//
//  DetailViewController.m
//  FindMoviesNear
//
//  Created by Zachary Mallicoat on 4/2/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController {
    CLLocationCoordinate2D *_center;
}

#pragma mark - Managing the detail item



- (void)configureView {
    // Update the user interface for the detail item.
    
}

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    _mapView.delegate = self;

    MKPointAnnotation *theatreMarker = [[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D theatreLocation;
    theatreLocation.longitude = [self.detailItemTheatre.theatreLongitude doubleValue];
    theatreLocation.latitude = [self.detailItemTheatre.theatreLattitude doubleValue];
    theatreMarker.coordinate = theatreLocation;
    theatreMarker.title = self.detailItemTheatre.theatreName;
    
    MKCoordinateRegion startingRegion;
    startingRegion.center = theatreLocation;
    
    
    [self.mapView addAnnotation:theatreMarker];
    [self.mapView setRegion:startingRegion];

    
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
