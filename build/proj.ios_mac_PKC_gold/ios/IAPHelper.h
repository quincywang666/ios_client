//
//  IAPHelper.h
//  GameClient
//
//  Created by lanc on 2017/4/11.
//
//

#import <StoreKit/StoreKit.h>

@interface IAPHelper : NSObject<SKProductsRequestDelegate,SKPaymentTransactionObserver>

+(instancetype)sharedInstance;

-(void)startPayWithProductId:(NSString*)productId;

//-(void)requestProducts:(NSString*)productId;

//-(void)getCardsProducts;

@end
