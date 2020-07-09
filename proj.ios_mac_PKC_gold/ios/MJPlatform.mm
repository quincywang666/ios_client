//
//  MJPlatform.m
//  MJClient
//
//  Created by lanc on 2017/5/24.
//
//

#import "MJPlatform.h"
#include "WeChatDelegete.h"
#include "cocos2d.h"
#include "CCLuaEngine.h"
#include "CCLuaBridge.h"
#import "IAPHelper.h"
#import "Constant-IOS.h"
#import "MJGDLocation.h"
//#import "KeyChainStore.h"
#import <AdSupport/AdSupport.h>
#import "DeviceUID.h"
#import "AppController.h"
#import "JPUSHService.h"
#import <sys/utsname.h>



static NSString* CHANNELID = @"yiyo.apk.com";
//NSString* CHANNELID = @"888.bzj555.com";
//NSString* CHANNELID = @"jinbaili.apk.com";
//NSString* CHANNELID = @"jinshihao.apk.com";
static int SCREEN_TYPE=11;
static CGFloat WIN_WIDTH = 0;
static CGFloat WIN_HEIGHT = 0;
static NSString* JPUSH_EXTRASTRING = @"";

__strong NSMutableDictionary* callDic=[[NSMutableDictionary alloc] init];
__strong NSMutableDictionary* dataDic=[[NSMutableDictionary alloc] init];
@implementation MJPlatform

+(int)getCurrScreenType{
    return SCREEN_TYPE;
}

/*
 *@method 微信自动登录
 */
+(void)autoLogin{
    NSUserDefaults * defaul=[NSUserDefaults standardUserDefaults];
    NSString* refresh_token=[defaul valueForKey:@"refresh_token"];
    if(refresh_token){
        [[WeChatDelegete sharedDelegate]requestRefreshToken:refresh_token];
    }
}

+(void)loginWX{
    [[WeChatDelegete sharedDelegate] requestNormalLogin];
}

+(void)logoutWX{
    NSUserDefaults * defaul=[NSUserDefaults standardUserDefaults];
    [defaul removeObjectForKey:@"refresh_token"];
}

//分享文本到微信聊天
+(void)shareTextToWeChatSession:(NSDictionary*)dic{
    
    NSString* text=[dic objectForKey:@"text"];
    
    SendMessageToWXReq* req=[[SendMessageToWXReq alloc]init];
    req.text=text;
    req.scene=WXSceneSession;
    req.bText=YES;
    
    
    [WXApi sendReq:req];
}

//分享文本到微信朋友圈
+(void)shareTextToWeChatTimeLine:(NSDictionary*)dic{
    NSString* text=[dic objectForKey:@"text"];
    SendMessageToWXReq* req=[[SendMessageToWXReq alloc]init];
    req.text=text;
    req.scene=WXSceneTimeline;
    req.bText=YES;
}

//分享图片到微信聊天
+(void)shareImgToWeChatSession:(NSDictionary*)dic{
    NSString* imgpath=[dic objectForKey:@"imgpath"];
    [MJPlatform shareImgToWeChat:imgpath scene:WXSceneSession];
}

//分享图片到微信朋友圈
+(void)shareImgToWeChatTimeLine:(NSDictionary*)dic{
    NSString* imgpath=[dic objectForKey:@"imgpath"];
    [MJPlatform shareImgToWeChat:imgpath scene:WXSceneTimeline];
}

//分享图片到微信
//@param scene 界面标记
+(void)shareImgToWeChat:(NSString*)fullpath scene:(int)scene{
    WXMediaMessage* message=[[WXMediaMessage alloc]init];
    WXImageObject* obj=[[WXImageObject alloc]init];
    NSString* filePath=fullpath;
    
    obj.imageData=[NSData dataWithContentsOfFile:filePath];
    message.mediaObject=obj;
    
    if(scene==WXSceneSession){
        UIImage* image=[UIImage imageWithContentsOfFile:fullpath];
        image=[MJPlatform compressImage:image toByte:32*1000];
        NSData *data = UIImageJPEGRepresentation(image, 0.1);
        message.thumbData=data;
    }
    
    
    
    

    SendMessageToWXReq *req=[[SendMessageToWXReq alloc]init];
    req.bText=NO;
    req.message=message;
    req.scene=scene;
    [WXApi sendReq:req];
}

+ (UIImage *)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength {
    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    if (data.length < maxLength) return image;
    
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    UIImage *resultImage = [UIImage imageWithData:data];
    if (data.length < maxLength) return resultImage;
    
    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
    }
    
    return resultImage;
}





/*
 *@method 分享网页到微信聊天
 *@param dic 数据字典
 */
+(void)shareWebpageToWeChatSession:(NSDictionary*)dic{
    NSString* url=[dic objectForKey:@"url"];
    NSString* title=[dic objectForKey:@"title"];
    NSString* description=[dic objectForKey:@"description"];
    NSString* thumbFullPath=[dic objectForKey:@"thumbFullPath"];
    
    WXWebpageObject* webObj=[[WXWebpageObject alloc]init];
    webObj.webpageUrl=url;
    
    WXMediaMessage* mediaMessage=[[WXMediaMessage alloc]init];
    
    mediaMessage.title=title;
    
    mediaMessage.description=description;
    
    mediaMessage.mediaObject=webObj;
    
    UIImage* image = [UIImage imageWithContentsOfFile:thumbFullPath];
    
    [mediaMessage setThumbImage:image];
    
    SendMessageToWXReq* req=[[SendMessageToWXReq alloc]init];
    req.message=mediaMessage;
    
    [WXApi sendReq:req];
    
}

+(void)registerScriptHandler:(NSDictionary *)dict{
    [callDic addEntriesFromDictionary:dict];
}

+(void)WeChatLoginCallBack:(NSString*)uid nick:(NSString*)nick imgPath:(NSString*)imgPath sex:(NSString*)sex token:(NSString*)token{
    int scriptHandler = [[callDic valueForKey:@"WeChatLoginCallback"] intValue];
    if (scriptHandler)
    {
        cocos2d::LuaBridge::pushLuaFunctionById(scriptHandler);
        cocos2d::LuaStack *stack = cocos2d::LuaBridge::getStack();
                
        cocos2d::LuaValue value1,value2,value3,value4,value5;
        value1=cocos2d::LuaValue::stringValue([uid UTF8String]);
        value2=cocos2d::LuaValue::stringValue([nick UTF8String]);
        value3=cocos2d::LuaValue::stringValue([imgPath UTF8String]);
        value4=cocos2d::LuaValue::stringValue([sex UTF8String]);
        value5=cocos2d::LuaValue::stringValue([token UTF8String]);
        
        cocos2d::LuaValueDict luaDic;
        luaDic["uid"]=value1;
        luaDic["nick"]=value2;
        luaDic["imgpath"]=value3;
        luaDic["sex"]=value4;
        luaDic["token"]=value5;

        stack->pushLuaValueDict(luaDic);
        
        stack->executeFunction(1);
    }
    
    if(dataDic[MW_ENTERROOM_KEY]){
        [MJPlatform inviteWeChatCall:dataDic[MW_ENTERROOM_KEY]];
        
        [dataDic removeObjectForKey:MW_ENTERROOM_KEY];
    }else if(dataDic[MW_INVITEINTOGLUB_KEY]){
        [MJPlatform onInvitedIntoClubCall:dataDic[MW_INVITEINTOGLUB_KEY]];
        [dataDic removeObjectForKey:MW_INVITEINTOGLUB_KEY];
    }else if(dataDic[MW_PLAYBACK_KEY]){
        
        [MJPlatform onPlayBack:dataDic[MW_PLAYBACK_KEY]];
        [dataDic removeObjectForKey:MW_PLAYBACK_KEY];
    }
    
//    [MJPlatform location];
}

//发起ios内购支付
+(void)startPayment:(NSDictionary*) dic{
    NSString* product=[dic objectForKey:@"product"];
    if(product==nil){
        return;
    }
    dispatch_after(0.5, dispatch_get_main_queue(), ^(void){
        [[IAPHelper sharedInstance] startPayWithProductId:product];
    });
    
}

/*
 *@method iap 购买失败的回调
 *@param error
 */
+(void)iapFailed:(NSError*)error{
    int scriptHandler = [[callDic valueForKey:@"iapFailedCallback"] intValue];
    if (scriptHandler)
    {
        cocos2d::LuaBridge::pushLuaFunctionById(scriptHandler);
        cocos2d::LuaStack *stack = cocos2d::LuaBridge::getStack();
        
        cocos2d::LuaValue value1,value2;
        value1=cocos2d::LuaValue::intValue((int)error.code);
        value2=cocos2d::LuaValue::stringValue([error.description UTF8String]);
        
        cocos2d::LuaValueDict luaDic;
        luaDic["errcode"]=value1;
        luaDic["description"]=value2;
        
        stack->pushLuaValueDict(luaDic);
        
        stack->executeFunction(1);
    }
}

/*
 *@mathod iap 购买成功的回调
 *@param product 商品id
 *@param base64CheckCode base64后的商品交易数据
 */
+(void)iapSuccess:(NSString*)product base64CheckCode:(NSString*)base64CheckCode{
    int scriptHandler = [[callDic valueForKey:@"ipaSuccessCallback"] intValue];
    if (scriptHandler)
    {
        NSLog(@"product:%@",product);
        cocos2d::LuaBridge::pushLuaFunctionById(scriptHandler);
        cocos2d::LuaStack *stack = cocos2d::LuaBridge::getStack();
        
        cocos2d::LuaValue value1,value2;
        value1=cocos2d::LuaValue::stringValue([product UTF8String]);
        value2=cocos2d::LuaValue::stringValue([base64CheckCode UTF8String]);
        
        cocos2d::LuaValueDict luaDic;
        luaDic["product"]=value1;
        luaDic["base64CheckCode"]=value2;
        
        stack->pushLuaValueDict(luaDic);
        
        stack->executeFunction(1);
    }
}


/*
 *@method 复制文本到剪切板
 */
+(void)copyText:(NSDictionary*)dic{
    NSString* text=dic[@"text"];
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    if(!text){
        pasteboard.string=nil;
    }else{
        pasteboard.string = text;
    }
}

+(NSString*)getCopyText{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    if(pasteboard.string==nil){
        return @"";
    }else{
        return pasteboard.string;
    }

}

/*
 *@method setScreenOrientationHorizontal设置横屏
 */
+ (void)setScreenOrientationHorizontal{
    [AppController changeRootViewController:true openurl:@""];
    
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
    
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeRight] forKey:@"orientation"];
    
    UIViewController* controller= [UIApplication sharedApplication].keyWindow.rootViewController;
//    [AppController setRootViewDir:false];
    


    //初始设计是横屏时使用 0 ，初始设计是竖屏时使用M_PI_2

    controller.view.transform = CGAffineTransformMakeRotation(M_PI_2);
    

    CGRect  frame_v = controller.view.bounds;
    
    controller.view.bounds = CGRectMake(0, 0, frame_v.size.height, frame_v.size.width);

//    UIDeviceOrientationLandscapeLeft
    
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
    
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeRight] forKey:@"orientation"];
    
    
    
    
    SCREEN_TYPE=11;
    
}

/*
 *@method setOrientationVertical设置竖屏
 */
+ (void)setOrientationVertical{

    UIViewController* controller= [UIApplication sharedApplication].keyWindow.rootViewController;
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
    
//    UIEdgeInsets edge1 = controller.view.safeAreaInsets;
//    CGRect rect1 = controller.view.frame;

    controller.view.transform = CGAffineTransformMakeRotation(M_PI_2);

    CGRect  frame_v = controller.view.bounds;
    controller.view.bounds = CGRectMake(0, 0, frame_v.size.height, frame_v.size.width);
    
    NSLog(@"切换竖屏，，屏幕宽%f,屏幕高%f",frame_v.size.width,frame_v.size.height);
//    controller.view.bounds = CGRectMake(0, 0, WIN_WIDTH, WIN_HEIGHT);
    
//    CGRect s =CGRectMake(0,0,828,1792
//                         );
//    controller.view.frame = s;
    
//    UIEdgeInsets edge2 = controller.view.safeAreaInsets;
//    CGRect rect2 = controller.view.frame;
//
//    CGRect s =CGRectMake(34,0,
//    controller.view.frame.size.height,controller.view.frame.size.width);
//    NSLog(@"屏幕初始化，，屏幕宽%f,屏幕高%f，x=%f,y=%f",s.size.width,s.size.height,s.origin.x,s.origin.y);
//    controller.view.frame = s;
    
//    CGRect s = controller.view.frame;
//    NSLog(@"切换竖屏，，屏幕宽%f,屏幕高%f",s.size.width,s.size.height);
//    controller.view.frame = CGRectMake(0, 0, s.size.height, s.size.width);
        
    
    SCREEN_TYPE=10;
    
}




+(void)openSystemWebView:(NSDictionary *)dic{
    
    
    NSString* urlstr = dic[@"url"];
    [AppController changeRootViewController:false openurl:urlstr];
    
}

/*
 *@method 从微信启动的邀请返回
 */
+(void)inviteWeChatCall:(NSString*)roomid{
    int scriptHandler = [[callDic valueForKey:@"inviteWeChatCB"] intValue];
    if (scriptHandler)
    {
        cocos2d::LuaBridge::pushLuaFunctionById(scriptHandler);
        cocos2d::LuaStack *stack = cocos2d::LuaBridge::getStack();
        
        stack->pushString([roomid UTF8String]);
        
        stack->executeFunction(1);
    }else{
        dataDic[MW_ENTERROOM_KEY]=roomid;
    }
}

/*
 *@method 微信邀请加入俱乐部的回调
 */
+(void)onInvitedIntoClubCall:(NSString*)clubid{
    int scriptHandler = [[callDic valueForKey:@"onInviteIntoClubCB"] intValue];
    if (scriptHandler)
    {
        cocos2d::LuaBridge::pushLuaFunctionById(scriptHandler);
        cocos2d::LuaStack *stack = cocos2d::LuaBridge::getStack();
        
        stack->pushString([clubid UTF8String]);
        
        stack->executeFunction(1);
    }else{
        dataDic[MW_INVITEINTOGLUB_KEY]=clubid;
    }
}

/*
 *@method 牌局回放分享回调
 *@param roomid回放id
 */
+(void)onPlayBack:(NSString*)roomid{
    
    int scriptHandler = [[callDic valueForKey:@"onPlayBackRoom"] intValue];
    if (scriptHandler)
    {
        cocos2d::LuaBridge::pushLuaFunctionById(scriptHandler);
        cocos2d::LuaStack *stack = cocos2d::LuaBridge::getStack();
        
        stack->pushString([roomid UTF8String]);
        
        stack->executeFunction(1);
    }else{
        dataDic[MW_PLAYBACK_KEY]=roomid;
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"registerMLinkHandlerWithKey" message:[NSString stringWithFormat:@"url=++++++动态参数=%@",roomid] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
    }

}

/*
 *@method loadtion开始定位
 */
+(void)location{
    [[MJGDLocation getInstance] start];
}


/*
 *@method onLocationInfo获取到定位信息
 *@param latitude经度
 *@param longitude纬度
 */
+(void)onLocationInfo:(double)latitude longitude:(double)longitude{
    
    int scriptHandler = [[callDic valueForKey:@"onLocationInfo"] intValue];
    if (scriptHandler)
    {
        cocos2d::LuaBridge::pushLuaFunctionById(scriptHandler);
        cocos2d::LuaStack *stack = cocos2d::LuaBridge::getStack();
        
        NSString* strLatitude=[NSString stringWithFormat:@"%f",latitude];
        NSString* strLongitude=[NSString stringWithFormat:@"%f",longitude];
        
        cocos2d::LuaValue value1,value2;
        value1=cocos2d::LuaValue::stringValue([strLatitude UTF8String]);
        value2=cocos2d::LuaValue::stringValue([strLongitude UTF8String]);
        
        cocos2d::LuaValueDict luaDic;
        luaDic["latitude"]=value1;
        luaDic["longitude"]=value2;
        
        stack->pushLuaValueDict(luaDic);
        
        stack->executeFunction(1);
    }
}

/*
 *@method openAppSetting 打开App设置界面
 */
+(void)openAppSetting{
    
    NSURL*url=[NSURL URLWithString:UIApplicationOpenSettingsURLString];
    
    [[UIApplication sharedApplication]openURL:url];
    
//    NSString* bundleId=[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
//    NSString* urlString=[NSString stringWithFormat:@"prefs:root=%@&&path=%@",bundleId,bundleId];
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlString]];
   
}

/*
 *@method onShareSuccess分享成功回调
 */
+(void)onShareSuccess{
    int scriptHandler = [[callDic valueForKey:@"onShareSuccess"] intValue];
    if (scriptHandler)
    {
        cocos2d::LuaBridge::pushLuaFunctionById(scriptHandler);
        cocos2d::LuaStack *stack = cocos2d::LuaBridge::getStack();
        stack->pushNil();
        stack->executeFunction(1);
    }
}

+(NSString*)getLocationDistance:(NSDictionary*)dic {
    double x1=[dic[@"x1"] doubleValue];
    double y1=[dic[@"y1"] doubleValue];
    double x2=[dic[@"x2"] doubleValue];
    double y2=[dic[@"y2"] doubleValue];
    double distance=[MJGDLocation distahce:x1 y1:y1 x2:x2 y2:y2];
    return [NSString stringWithFormat:@"%f",distance];
}


//跳转到其他app
+(void)jumpToOtherApp:(NSDictionary*)dic{
    
    NSString* appinfo=[dic objectForKey:@"appinfo"];
    NSString* downloadUrl=[dic objectForKey:@"downloadurl"];
    
    NSURL *appUrl = [NSURL URLWithString:appinfo];
    
    //判断手机中是否安装了应用程序
    if ( [[UIApplication sharedApplication] canOpenURL:appUrl]){
        [[UIApplication sharedApplication] openURL:appUrl];
    }else
    {
        NSURL *downUrl = [NSURL URLWithString:downloadUrl];
        [[UIApplication sharedApplication]openURL:downUrl];
    }
}

+(NSString*)getAppVersion{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    return app_Version;
}


+(NSString*)getChannel{
    NSLog(@"获取到渠道号");
    return CHANNELID;
}

+(void)setChannel:(NSString*)str{
    CHANNELID = [str copy];
    
    NSLog(@"设置渠道号：%@",CHANNELID);
}

//流量信号强度
+(NSString*)getMobileSignalStrength{
//        NSLog(@"获取流量信号强度");
    UIApplication *app = [UIApplication sharedApplication];
//    NSArray *subviews = [[[app valueForKey:@"statusBar"] valueForKey:@"foregroundView"] subviews];
    UIView* statusBar = [app valueForKey:@"statusBar"];
    
    UIView* foregroundView = [statusBar valueForKey:@"_foregroundView"];
    //
    NSArray *subviews = [foregroundView subviews];

    NSString *dataNetworkItemView = nil;
    
    for (id subview in subviews) {
        if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            dataNetworkItemView = subview;
            break;
        }
    }
    
    int signalStrength = [[dataNetworkItemView valueForKey:@"_wifiStrengthBars"] intValue];
    
    NSString* result = [NSString stringWithFormat:@"%d",signalStrength];
    return result;
}

//wifi信号强度
+(NSString*)getWifiSignalStrength{
//        NSLog(@"获取wifi信号强度");
    UIApplication *app = [UIApplication sharedApplication];
    UIView* statusBar = [app valueForKey:@"statusBar"];
    UIView* foregroundView = [statusBar valueForKey:@"_foregroundView"];
//
    NSArray *subviews = [foregroundView subviews];
    

//    NSArray *subviews = [[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];

    NSString *dataNetworkItemView = nil;
   
    for (id subview in subviews) {
        if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            dataNetworkItemView = subview;
            break;
        }
    }

    int signalStrength = [[dataNetworkItemView valueForKey:@"_wifiStrengthBars"] intValue];
    NSString* result = [NSString stringWithFormat:@"%d",signalStrength];
    return result;
}

//网络类型
+(NSString*)getNetworkType{
//        NSLog(@"获取网络类型");
    UIApplication *app = [UIApplication sharedApplication];
//    NSArray *subviews = [[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    UIView* statusBar = [app valueForKey:@"statusBar"];
    
    UIView* foregroundView = [statusBar valueForKey:@"_foregroundView"];
    //
    NSArray *subviews = [foregroundView subviews];

    int networkType = 0;
    for (id subview in subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            networkType = [[subview valueForKeyPath:@"dataNetworkType"] intValue];
            switch (networkType) {
                case 0:
                    NSLog(@"NONE");
                    break;
                case 1:
                    NSLog(@"2G");
                    break;
                case 2:
                    NSLog(@"3G");
                    break;
                case 3:
                    NSLog(@"4G");
                    break;
                case 5:
                {
                    NSLog(@"WIFI");
                }
                    break;
                default:
                    break;
            }
            break;
        }
    }
    NSString* result = [NSString stringWithFormat:@"%d",networkType];
    return result;
}

//获取电量强度
+(NSString*)getBatteryQuantity{
//        NSLog(@"获取电量强度");
//    UIApplication *app = [UIApplication sharedApplication];
//    NSArray *subviews = [[[app valueForKey:@"statusBar"] valueForKey:@"foregroundView"] subviews];
//    NSString *dataNetworkItemView = nil;
//
//    for (id subview in subviews) {
//        if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarBatteryItemView") class]]) {
//            dataNetworkItemView = subview;
//            break;
//        }
//    }
//
//    int signalStrength = [[dataNetworkItemView valueForKey:@"_capacity"] intValue];
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    float signalStrength = [[UIDevice currentDevice] batteryLevel];
    NSString* result = [NSString stringWithFormat:@"%.2f",signalStrength];
    return result;
}


//获取唯一id
+(NSString*)getDeviceOnlyID{
//    NSString *macaddress = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
//
//    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
//    return [NSString stringWithFormat:@"%@%@",macaddress,bundleIdentifier];

//    // 这个key的前缀最好是你的BundleID
//    NSString*strUUID = (NSString*)[KeyChainStore load:@"com.mmosdog.pkcgame.yiyou"];
//    //首次执行该方法时，uuid为空
//    if([strUUID isEqualToString:@""]|| !strUUID)
//    {
//        // 获取UUID 这个是要引入<AdSupport/AdSupport.h>的
//        strUUID = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
//
//        if(strUUID.length ==0 || [strUUID isEqualToString:@"00000000-0000-0000-0000-000000000000"])
//        {
//            //生成一个uuid的方法
//            CFUUIDRef uuidRef= CFUUIDCreate(kCFAllocatorDefault);
//            strUUID = (NSString*)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault,uuidRef));
//            CFRelease(uuidRef);
//        }
//
//        //将该uuid保存到keychain
//        [KeyChainStore save:@"com.mmosdog.pkcgame.yiyou" data:strUUID];
//    }
//
//    return strUUID;
    return [DeviceUID uid];
}

// +(NSString *)getIOSUUID:(NSString *)chainkey
// {
//     //获取项目的bundle ID
//     NSString *bundleId = chainkey;
//     //根据bundle ID拼接一个自定义的key用来作为keychain里面的唯一标示
//     //NSString *keyUUid = [NSString stringWithFormat:@"%@.uuid",bundleId];
//     //将bundle ID作为唯一key在keychain里面获取保存的uuid
//     NSString * strUUID = (NSString *)[KeyChainStore load:bundleId];

//     //首次执行该方法时，uuid为空
//     if ([strUUID isEqualToString:@""] || !strUUID)
//     {
//         //生成一个uuid的方法
//         CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
//         strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
//         //将该uuid保存到keychain
//         [KeyChainStore save:bundleId data:strUUID];
//     }
//     return strUUID;
// }


+(void)setWinSize:(NSDictionary*)dic{
    WIN_WIDTH = [dic[@"width"] floatValue];
    WIN_HEIGHT = [dic[@"height"] floatValue];
}

static int reqindex = 0;

+(int)getReq{
    return ++reqindex;
}
+(void)setJpushAlias:(NSDictionary *)dic{
    NSString* alias = dic[@"alias"];
    [JPUSHService setAlias:alias completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
    } seq:[MJPlatform getReq]];
}

+(void)resetTag{
    [JPUSHService cleanTags:^(NSInteger iResCode, NSSet *iTags, NSInteger seq) {
        
    } seq:[MJPlatform getReq]];
}

+(void)addJpushTags:(NSDictionary *)dic{
    NSString* tag = dic[@"tag"];
    NSMutableSet * tags = [[NSMutableSet alloc] init];
    [tags addObject:tag];
    [JPUSHService addTags:tags completion:^(NSInteger iResCode, NSSet *iTags, NSInteger seq) {
        
    } seq:[MJPlatform getReq]];
}

+(void)setJpushExtraString:(NSString*)str{

    JPUSH_EXTRASTRING = str;
}
+(NSString *)getJpushExtraString{
    NSString* str = [JPUSH_EXTRASTRING copy];
    JPUSH_EXTRASTRING = @"";
    return str;
}

+(NSString *)getSystemVersion{
    NSString *strSysVersion = [[UIDevice currentDevice] systemVersion];
    NSLog(@"strSysVersion: %@",strSysVersion);
    return strSysVersion;
}

+(NSString *)getSystemModel{
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString *iOSDeviceModelsPath = [[NSBundle mainBundle] pathForResource:@"iOSDeviceModelMapping" ofType:@"plist"];
    NSDictionary *iOSDevices = [NSDictionary dictionaryWithContentsOfFile:iOSDeviceModelsPath];
    NSString* deviceModel = [NSString stringWithCString:systemInfo.machine
                                               encoding:NSUTF8StringEncoding];
    NSString* model = deviceModel;
    if ([iOSDevices valueForKey:deviceModel]) {
        model = [iOSDevices valueForKey:deviceModel];
    }
    return model;
}

+(NSString *)getDeviceType{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        return @"iPhone";
    } else {
        return @"iPad";
    }
}

@end
