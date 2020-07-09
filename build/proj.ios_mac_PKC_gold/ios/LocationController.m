//
//  LocationController.m
//  MJClient
//
//  Created by lan on 2017/6/19.
//
//

#import "LocationController.h"
#import <CoreLocation/CoreLocation.h>
#import "MJPlatform.h"

@interface LocationController()<CLLocationManagerDelegate>

@property(nonatomic,strong) CLLocationManager* locationManager;

@property(atomic,assign) BOOL bLocation;

@end

static LocationController *instance=nil;

@implementation LocationController

+(LocationController*)getInstance{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[LocationController alloc] init];
    });
    return instance;
}

+(void)release{
    if (instance !=nil) {
        instance=nil;
    }
}

-(instancetype)init{
    self=[super init];
    
    [self createLocationMgr];
    
    _bLocation=NO;
    
    return self;
}

-(void)createLocationMgr{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
}

- (void)start
{
    
    if(_bLocation){
        return;
    }
    
    _bLocation=YES;
    
    /** 由于IOS8中定位的授权机制改变 需要进行手动授权
     * 获取授权认证，两个方法：
     * [self.locationManager requestWhenInUseAuthorization];
     * [self.locationManager requestAlwaysAuthorization];
     */
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        NSLog(@"requestAlwaysAuthorization");
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    //开始定位，不断调用其代理方法
    [self.locationManager startUpdatingLocation];
    NSLog(@"start gps");
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    // 1.获取用户位置的对象
    CLLocation *location = [locations lastObject];
    CLLocationCoordinate2D coordinate = location.coordinate;
    NSLog(@"纬度:%f 经度:%f", coordinate.latitude, coordinate.longitude);
    
    // 2.停止定位
    [manager stopUpdatingLocation];
    
    [MJPlatform onLocationInfo:coordinate.latitude longitude:coordinate.longitude];
    manager.delegate=nil;
    instance=nil;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if (error.code == kCLErrorDenied) {
        // 提示用户出错原因，可按住Option键点击 KCLErrorDenied的查看更多出错信息，可打印error.code值查找原因所在
    }
}

@end
