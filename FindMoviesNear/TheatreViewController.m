//
//  TheatreViewController.m
//  FindMoviesNear
//
//  Created by Zachary Mallicoat on 4/2/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "TheatreViewController.h"
#import "MasterViewController.h"
#import "DetailViewController.h"
#import "NSString+URLEncoding.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface TheatreViewController () <MovieTheatreManagerDelegate> {
    MovieTheatreManager *_manager;
    CLLocationManager *_locationManager;
    CLLocation *_currentLocation;
    NSString *_currentPostalCode;
}

@end

@implementation TheatreViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self CurrentLocationIdentifier];

    _manager = [[MovieTheatreManager alloc] init];
    _manager.communicator = [[TheaterCommunicator alloc] init];
    
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    


    // Do any additional setup after loading the view, typically from a nib.
    
}

-(void) startFetchingTheatres {
//    NSString *mockAddress = @"V6B1E6";
    


 
    
    NSString *movieNameRaw = self.detailItem.movieName;
    NSString *postalCodeRaw = _currentPostalCode;
    NSString *postalCodeEncoded = [NSString stringWithFormat:@"%@", [postalCodeRaw urlEncodeUsingEncoding:NSUTF8StringEncoding]];
    NSString *movieURLEncoded = [NSString stringWithFormat:@"%@",
                                 [movieNameRaw urlEncodeUsingEncoding:NSUTF8StringEncoding]];
    
    
    [_manager fetchTheatresAtAddress:postalCodeEncoded andMovie:movieURLEncoded];


    
}

- (void)didReceiveTheatres:(NSArray *)theatres
{
    // make sure movies are loaded
    
    self.theatres = theatres;
    // Update tableview after asynchronous task is done fetching data
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

//- (void)locationManager:(CLLocationManager *)manager
//didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
//    
//    if (status == kCLAuthorizationStatusAuthorizedWhenInUse){
//        NSLog(@"We got permission yo");
//    } else if (status == kCLAuthorizationStatusDenied ){
//        NSLog(@"the user is not a fan of being stalked");
//    }
//    
//}

-(void)CurrentLocationIdentifier 
{
    //---- For getting current gps location
    _locationManager = [CLLocationManager new];
    _locationManager.delegate = self;
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [_locationManager startUpdatingLocation];
    //------
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    _currentLocation = [locations objectAtIndex:0];
    [_locationManager stopUpdatingLocation];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
    [geocoder reverseGeocodeLocation:_currentLocation completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (!(error))
         {
             CLPlacemark *placemark = [placemarks objectAtIndex:0];
             NSLog(@"\nCurrent Location Detected\n");
             NSLog(@"placemark %@",placemark);
             
             
             _currentPostalCode = [[NSString alloc]initWithString:placemark.postalCode];
             
             [self startFetchingTheatres];

         }
         else
         {
             NSLog(@"Geocode failed with error %@", error);
             NSLog(@"\nCurrent Location Not Detected\n");
             
         }
         
     }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
        if ([[segue identifier] isEqualToString:@"showDetail"]) {
            
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            DetailViewController *detailVC = (DetailViewController *)segue.destinationViewController;
            detailVC.detailItem = self.theatres[indexPath.row];;
    }
    
}




#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.theatres.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"theatreCell" forIndexPath:indexPath];
    
    Theatres *theatre = self.theatres[indexPath.row];
    cell.textLabel.text = theatre.theatreName;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}





@end