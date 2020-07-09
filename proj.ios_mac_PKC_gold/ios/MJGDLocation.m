//
//  MJGDLocation.m
//  MJClient
//
//  Created by lan on 2017/6/30.
//
//

#import "MJGDLocation.h"
#import <AMapLocationKit/AMapLocationKit.h>
#import <MAMapKit/MAMapKit.h>
#import "MJPlatform.h"

#define DefaultLocationTimeout 10
#define DefaultReGeocodeTimeout 5

@interface MJGDLocation ()<AMapLocationManagerDelegate>

@property(nonatomic,strong) AMapLocationManager* locationManager;

@property (nonatomic, copy) AMapLocatingCompletionBlock completionBlock;

@end


static MJGDLocation *instance=nil;

@implementation MJGDLocation

+(instancetype)getInstance{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[MJGDLocation alloc] init];
    });
    return instance;
}

+(double)distahce:(double)x1 y1:(double)y1 x2:(double)x2 y2:(double)y2{
    
    //1.将两个经纬度点转成投影点
    
    MAMapPoint point1 = MAMapPointForCoordinate(CLLocationCoordinate2DMake(x1,y1));
    
    MAMapPoint point2 = MAMapPointForCoordinate(CLLocationCoordinate2DMake(x2,y2));
    
    //2.计算距离
    
    CLLocationDistance distance = MAMetersBetweenMapPoints(point1,point2);
    
    return distance;
}

-(instancetype)init{
    self=[super init];
    
    [self initCompleteBlock];
    [self configLocationManager];
    
    return self;
}

-(void)start{
    [self locAction];
   
}


- (void)configLocationManager
{
    self.locationManager = [[AMapLocationManager alloc] init];
    
    [self.locationManager setDelegate:self];
    
    //设置期望定位精度
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    //设置不允许系统暂停定位
    [self.locationManager setPausesLocationUpdatesAutomatically:NO];
    
    //设置允许在后台定位
//    [self.locationManager setAllowsBackgroundLocationUpdates:YES];
    
    //设置定位超时时间
    [self.locationManager setLocationTimeout:DefaultLocationTimeout];
    
    //设置逆地理超时时间
    [self.locationManager setReGeocodeTimeout:DefaultReGeocodeTimeout];
}

- (void)cleanUpAction
{
    //停止定位
    [self.locationManager stopUpdatingLocation];
    
    [self.locationManager setDelegate:nil];
    
}

- (void)locAction
{
    //进行单次定位请求
    [self.locationManager requestLocationWithReGeocode:NO completionBlock:self.completionBlock];
}

#pragma mark - Initialization

- (void)initCompleteBlock
{
    
    
    self.completionBlock = ^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error)
    {
        if (error != nil && error.code == AMapLocationErrorLocateFailed)
        {
            //定位错误：此时location和regeocode没有返回值，不进行annotation的添加
            NSLog(@"定位错误:{%ld - %@};", (long)error.code, error.localizedDescription);
            return;
        }
        
        else if (error != nil
                 && (error.code == AMapLocationErrorReGeocodeFailed
                     || error.code == AMapLocationErrorTimeOut
                     || error.code == AMapLocationErrorCannotFindHost
                     || error.code == AMapLocationErrorBadURL
                     || error.code == AMapLocationErrorNotConnectedToInternet
                     || error.code == AMapLocationErrorCannotConnectToHost))
        {
            //逆地理错误：在带逆地理的单次定位中，逆地理过程可能发生错误，此时location有返回值，regeocode无返回值，进行annotation的添加
            NSLog(@"逆地理错误:{%ld - %@};", (long)error.code, error.localizedDescription);
        }
        else if (error != nil && error.code == AMapLocationErrorRiskOfFakeLocation)
        {
            //存在虚拟定位的风险：此时location和regeocode没有返回值，不进行annotation的添加
            NSLog(@"存在虚拟定位的风险:{%ld - %@};", (long)error.code, error.localizedDescription);
            return;
        }
        else
        {
            [MJPlatform onLocationInfo:location.coordinate.latitude longitude:location.coordinate.longitude];
            [self cleanUpAction];
        }
        
      
    };
}



@end
