//
//  MJCallBack-IOS.m
//  GameClient
//
//  Created by lanc on 2017/4/11.
//
//

#import "MJCallBack-IOS.h"
#import <StoreKit/StoreKit.h>
//#include "PlatformInterface.h"



@implementation MJCallBack_IOS

+(void)iapCanNotMakePayments{
    NSLog(@"MJCallBack_IOS iapCanNotMakePayments ");
}

+(void)iapNoProduct:(NSString*)productId{
    NSLog(@"MJCallBack_IOS iapNoProduct :%@",productId);
}

+(void)iapSuccess:(NSData*)transactionReceipt transactionIdentifier:(NSString *)transactionIdentifier{
    // 向自己的服务器验证购买凭证
//    NSLog(@"MJCallBack_IOS iapSuccess receipt:%@",[transactionReceipt base64Encoding]);
    
//    int uid=CPlatformInterface::GetInstance()->getMyUserId();
    int uid=1000;
    NSString* base64Recpt=[transactionReceipt base64EncodedStringWithOptions:0];
    
//    NSDictionary *requestContents = @{@"receipt-data": base64Recpt};
    NSDictionary *requestContents=@{@"base64Recpt":base64Recpt,@"uid":[NSString stringWithFormat:@"%d",uid]};
    
    NSError *error = nil;
    NSData *requestData = [NSJSONSerialization dataWithJSONObject:requestContents options:0 error:&error];
    
    if (!requestData) {
    }
    
    // Create a POST request with the receipt data.
//    NSURL *storeURL = [NSURL URLWithString:@"https://sandbox.itunes.apple.com/verifyReceipt"];
    NSURL *url=[NSURL URLWithString:@"http://211.159.153.221/qipai/Pay/appStoreNotify"];
//    NSMutableURLRequest *storeRequest = [NSMutableURLRequest requestWithURL:storeURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:requestData];
    
    // Make a connection to the iTunes Store on a background queue.
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            /* ... Handle error ... */
        } else {
            NSError *error;
            NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (!jsonResponse) {
                
            }else{
                NSLog(@"%@",[NSString stringWithFormat:@"%@",jsonResponse]);
            }
            
        }
    }];

    
    
    
//
//    // 1.设置请求路径
//    NSURL *URL=[NSURL URLWithString:@"http://211.159.153.221/qipai/Pay/appStoreNotify"];//不需要传递参数
//    
//    //    2.创建请求对象
//    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:URL];//默认为get请求
//    request.timeoutInterval=5.0;//设置请求超时为5秒
//    request.HTTPMethod=@"POST";//设置请求方法
//    
//    //设置请求体
//    NSString *param=[NSString stringWithFormat:@"base64Recpt=%@&uid=%d",base64Recpt,uid];
//    //把拼接后的字符串转换为data，设置请求体
//    request.HTTPBody=[param dataUsingEncoding:NSUTF8StringEncoding];
//    
//    //创建同步连接
//    NSError *error = nil;
//    NSData *receivedData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
}

+(void)iapFailed:(NSError*)error{
    if(error.code != SKErrorPaymentCancelled) {
//        NSLog(@"MJCallBack_IOS iapFailed error.code:%d des:%@",error.code,error.description);
        NSLog(@"购买失败");
    } else {
        NSLog(@"用户取消交易");
    }
}

@end
