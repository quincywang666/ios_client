//
//  LocationController.h
//  MJClient
//
//  Created by lan on 2017/6/19.
//
//
//  定位管理

#import <Foundation/Foundation.h>


@interface LocationController : NSObject

+(LocationController*)getInstance;

+(void)release;

- (void)start;

@end
