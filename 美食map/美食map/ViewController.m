//
//  ViewController.m
//  美食map
//
//  Created by tarena on 15/11/4.
//  Copyright © 2015年 qinxi. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<BMKMapViewDelegate>
@property (nonatomic,strong) BMKMapView* mapView;
@property (nonatomic,strong) CLLocationManager *manager;
@end
@implementation ViewController

-(CLLocationManager *)manager{
    if (!_manager) {
        _manager = [CLLocationManager new];
        if ([UIDevice currentDevice].systemVersion.floatValue>8.0) {
            [_manager requestAlwaysAuthorization];
        }
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.view = _mapView;
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;
}
-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}

-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}

-(void)updateLocationData:(BMKUserLocation *)userLocation{
    
    BMKCoordinateSpan span = {0.01,0.01};
    BMKCoordinateRegion region = {userLocation.location,span};
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
