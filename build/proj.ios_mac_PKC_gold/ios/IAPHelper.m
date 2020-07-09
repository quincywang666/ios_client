//
//  IAPHelper.m
//  GameClient
//
//  Created by lanc on 2017/4/11.
//
//

#import "IAPHelper.h"
//#import "MJCallBack-IOS.h"
#import "MBProgressHUD.h"
#import "MJPlatform.h"


#define RootView [UIApplication sharedApplication].keyWindow.rootViewController.view

@implementation IAPHelper

+(instancetype)sharedInstance{
    static IAPHelper* instance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        
        instance = [[IAPHelper alloc] init];
    });
    return instance;
}

-(instancetype)init{
    self=[super init];
    
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    
    return self;
}

-(void)startPayWithProductId:(NSString*)productId{
    
    [self requestProducts:productId];
}

-(void)requestProducts:(NSString*)productId{
    [MBProgressHUD showHUDAddedTo:RootView animated:YES];
    NSSet *productIds = [NSSet setWithObject:productId];
    SKProductsRequest *productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:productIds];
    productsRequest.delegate = self;
    [productsRequest start];
}

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {
    
    [MBProgressHUD hideHUDForView:RootView animated:YES];
    NSArray* products=response.products;
    
    SKProduct *product = [products count] > 0 ? [products objectAtIndex:0] : nil;
    if (product) {
        [self startPayWithProduct:product];

    } else {
        //无法获取商品信息
        NSString* iden=[[response invalidProductIdentifiers] firstObject];
        NSLog(@"no product:%@",iden);
    }
}

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
    for (SKPaymentTransaction *transaction in transactions)
    {
        switch (transaction.transactionState)
        {
            case SKPaymentTransactionStatePurchased://交易完成
//                NSLog(@"transactionIdentifier = %@", transaction.transactionIdentifier);
                [self completeTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed://交易失败
                [self failedTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored://已经购买过该商品
                [self restoreTransaction:transaction];
                break;
            case SKPaymentTransactionStatePurchasing:      //商品添加进列表
                NSLog(@"商品添加进列表");
                break;
            default:
                break;
        }
    }
}


- (void)completeTransaction:(SKPaymentTransaction *)transaction {
    [MBProgressHUD hideHUDForView:RootView animated:YES];
    
    // Your application should implement these two methods.
    NSString * productIdentifier = transaction.payment.productIdentifier;
    // Remove the transaction from the payment queue.
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
    
    if ([productIdentifier length] > 0) {
        [MJPlatform iapSuccess:transaction.transactionIdentifier base64CheckCode:[transaction.transactionReceipt base64EncodedStringWithOptions:0]];

    }
    
}
- (void)failedTransaction:(SKPaymentTransaction *)transaction {
    [MBProgressHUD hideHUDForView:RootView animated:YES];
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
    [MJPlatform iapFailed:transaction.error];
   
    
}
- (void)restoreTransaction:(SKPaymentTransaction *)transaction {
    [MBProgressHUD hideHUDForView:RootView animated:YES];
    // 对于已购商品，处理恢复购买的逻辑
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}

-(void)startPayWithProduct:(SKProduct*)product{
    [MBProgressHUD showHUDAddedTo:RootView animated:YES];
    SKPayment *payment=[SKPayment paymentWithProduct:product];
    //添加付款请求到队列
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

@end
