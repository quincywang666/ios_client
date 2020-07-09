//
//  MJGDLocation.h
//  MJClient
//
//  Created by lan on 2017/6/30.
//
//

//高德地图定位模块

#import <Foundation/Foundation.h>

@interface MJGDLocation : NSObject

+(instancetype)getInstance;

+(double)distahce:(double)x1 y1:(double)y1 x2:(double)x2 y2:(double)y2;

-(void)start;

@end
