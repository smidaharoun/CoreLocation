//
//  ViewController.h
//  location
//
//  Created by odc on 07/03/2017.
//  Copyright © 2017 Haroun SMIDA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

