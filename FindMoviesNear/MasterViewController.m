//
//  MasterViewController.m
//  FindMoviesNear
//
//  Created by Zachary Mallicoat on 4/2/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController () <MovieTheatreManagerDelegate> {
    MovieTheatreManager *_manager;
    NSArray *_movies;
}

@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _manager = [[MovieTheatreManager alloc] init];
    _manager.communicator = [[TheaterCommunicator alloc] init];
    
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    
    [self startFetchingMovies];
    // Do any additional setup after loading the view, typically from a nib.
    
}

-(void) startFetchingMovies {
    [_manager fetchMovies];
}
//-(void) fetchMoviesAtAddress {
//    [_manager fetchTheatresAtAddress:addresshere andMovie:movienamehere]
//}

- (void)didReceiveMovies:(NSArray *)movies
{
    // make sure movies are loaded
    _movies = movies;
    
    // Update tableview after asynchronous task is done fetching data
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        DetailViewController *detailVC = (DetailViewController *)segue.destinationViewController;
        TheatreViewController *theatreVC = (TheatreViewController *)segue.destinationViewController;
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        
        Movies *selectedMovie = _movies[indexPath.row];
        theatreVC.detailItem = selectedMovie;
     
    }
}




#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Movies *movie = _movies[indexPath.row];
    cell.textLabel.text = movie.movieName;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}





@end