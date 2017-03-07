//
//  ViewController.m
//  location
//
//  Created by odc on 07/03/2017.
//  Copyright © 2017 Haroun SMIDA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property CLLocationManager* locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupLocationManager];
    [self.mapView setShowsUserLocation:YES];
    [self checkLocationPermission];
}

- (void)setupLocationManager {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 10;
}

- (void)checkLocationPermission {
    if ([CLLocationManager locationServicesEnabled]) {
        if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined){
            [self.locationManager requestAlwaysAuthorization];
        } else {
            [self.locationManager startUpdatingLocation];
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation* currentLocation = [locations lastObject];
    if (currentLocation != nil){
        NSLog(@"The latitude value is - %@",[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude]);
        NSLog(@"The logitude value is - %@",[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude]);
    } else {
        NSLog(@"Current location is nil");
    }
}


- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusNotDetermined) {
        [self.locationManager startUpdatingLocation];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
