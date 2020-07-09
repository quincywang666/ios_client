//
//  WeChatDelegete.h
//  GameClient
//
//  Created by lan on 2017/3/31.
//
//

#import <Foundation/Foundation.h>
#import "WXApi.h"

@interface WeChatDelegete : NSObject<WXApiDelegate>

+(WeChatDelegete*)sharedDelegate;

-(void)requestNormalLogin;

-(void)requestAccessToken:(NSString*)code;

-(void)requestRefreshToken:(NSString*)refreshToken;

-(void)requestUserInfo:(NSString*)access_token openid:(NSString*)openid;

@end
