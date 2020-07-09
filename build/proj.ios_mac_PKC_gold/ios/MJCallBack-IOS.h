//
//  MJCallBack-IOS.h
//  GameClient
//
//  Created by lanc on 2017/4/11.
//
//

//ios 各种操作回调之后反调c++的中间类

#import <Foundation/Foundation.h>

@interface MJCallBack_IOS : NSObject

+(void)iapCanNotMakePayments;

+(void)iapNoProduct:(NSString*)productId;

+(void)iapSuccess:(NSData*)transactionReceipt transactionIdentifier:(NSString*)transactionIdentifier;

+(void)iapFailed:(NSError*)error;

@end
