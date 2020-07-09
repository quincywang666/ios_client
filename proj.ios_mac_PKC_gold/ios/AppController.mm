/****************************************************************************
 Copyright (c) 2010-2013 cocos2d-x.org
 Copyright (c) 2013-2016 Chukong Technologies Inc.
 
 http://www.cocos2d-x.org
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ****************************************************************************/

#import "AppController.h"
#import "cocos2d.h"
#import "platform/ios/CCEAGLView-ios.h"
#import "AppDelegate.h"
#import "WeChat_SDK/OpenSDK1.7.7/WXApi.h"
#import "Constant-IOS.h"
#import "WeChatDelegete.h"
#import "MJPlatformCall-IOS.hpp"
#import "MWApi.h"
#import "MJPlatform.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import "RootViewController.h"
#import "RootViewControllerShuPing.h"
#import "MNFloatBtn/MNFloatBtn.h"
@implementation AppController

@synthesize window;

#pragma mark -
#pragma mark Application lifecycle

int currType=0;

// cocos2d application instance
static AppDelegate s_sharedApplication;
static AppController *s_self;
static Boolean isCurLandspace = false;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    s_self = self;
        
    //regist wexin api
    [WXApi registerApp:WX_APPID];
    [MWApi registerApp:MW_APPID];
    [AMapServices sharedServices].apiKey =GD_APIKey;
    
    cocos2d::Application *app = cocos2d::Application::getInstance();
    
    // Initialize the GLView attributes
    app->initGLContextAttrs();
    cocos2d::GLViewImpl::convertAttrs();
    
    // Override point for customization after application launch.

    // Add the view controller's view to the window and display.
    window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    if(rect.size.width>rect.size.height){
        self->_smallbouns = rect.size.height;
        self->_largebouns = rect.size.width;
    }else{
        self->_smallbouns = rect.size.width;
        self->_largebouns = rect.size.height;
    }
   
    // Use RootViewController to manage CCEAGLView
    _viewController = [[RootViewController alloc]init];
//    _viewController.wantsFullScreenLayout = YES;
    _viewController.automaticallyAdjustsScrollViewInsets = NO; // 建议手工设置
    _viewController.extendedLayoutIncludesOpaqueBars = NO;
    _viewController.edgesForExtendedLayout = UIRectEdgeAll;
    _viewController.wantsFullScreenLayout = YES;
//    [window setRootViewController:_viewController];
    
    
    _viewController2 = [[RootViewControllerShuPing alloc]init];
    _viewController.wantsFullScreenLayout = YES;
    _viewController2.automaticallyAdjustsScrollViewInsets = NO; // 建议手工设置
    _viewController2.extendedLayoutIncludesOpaqueBars = NO;
    _viewController2.edgesForExtendedLayout = UIRectEdgeAll;
    _viewController2.wantsFullScreenLayout = YES;
    

    // Set RootViewController to window
    if ( [[UIDevice currentDevice].systemVersion floatValue] < 6.0)
    {
        // warning: addSubView doesn't work on iOS6
        [window addSubview: _viewController2.view];
    }
    else
    {
        // use this method on ios6
        [window setRootViewController:_viewController2];
    }
    
    [window makeKeyAndVisible];
    
    [[UIApplication sharedApplication] setStatusBarHidden:true];
    
//    if (@available(iOS 11.0, *))
//    {
//        CGRect rect = [[UIScreen mainScreen] bounds];
//        CGSize size = rect.size;
//        CGFloat width = size.width;
//        CGFloat height = size.height;
//        CGFloat scale_screen = [UIScreen mainScreen].scale;
//        //通过分辨率判断是否是iPhoneX手机
//        if (width*scale_screen ==2436 and height*scale_screen ==1125)
//        {
//            UIView *viewLeft = [[UIView alloc] initWithFrame:CGRectMake(0,0,31,_viewController.view.frame.size.height)];
//            UIImageView* imageViewL = [[UIImageView alloc] initWithFrame:viewLeft.bounds];
//            imageViewL.image = [UIImage imageNamed:@"biankuang1.png"];
//            [viewLeft addSubview:imageViewL];
//            [window addSubview:viewLeft];
//            [window sendSubviewToBack:viewLeft];
//            UIView *viewRight = [[UIView alloc]initWithFrame:CGRectMake(_viewController.view.frame.size.width + 31,0,31,_viewController.view.frame.size.height)];
//            UIImageView* imageView = [[UIImageView alloc]initWithFrame:viewRight.bounds];
//            imageView.image = [UIImage imageNamed:@"biankuang2.png"];
//            [viewRight addSubview:imageView];
//            [window addSubview:viewRight];
//            [window sendSubviewToBack:viewRight];
//        }
//    }
    
    
    // IMPORTANT: Setting the GLView should be done after creating the RootViewController
    cocos2d::GLView *glview = cocos2d::GLViewImpl::createWithEAGLView((__bridge void *)_viewController.view);
    cocos2d::Director::getInstance()->setOpenGLView(glview);
    
    //run the cocos2d-x game scene
    app->run();
    
    //设置整个游戏周期，手机不休眠
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    [self registerMlink];
     
//    [AppController changeRootViewController:false];
    
    
    
    //Required
    //notice: 3.0.0 及以后版本注册可以这样写，也可以继续用之前的注册方式
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound|JPAuthorizationOptionProvidesAppNotificationSettings;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
    // 可以添加自定义 categories
    // NSSet<UNNotificationCategory *> *categories for iOS10 or later
    // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];


    // Optional
    // 获取 IDFA
    // 如需使用 IDFA 功能请添加此代码并在初始化方法的 advertisingIdentifier 参数中填写对应值
    NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];

    // Required
    // init Push
    // notice: 2.1.5 版本的 SDK 新增的注册方法，改成可上报 IDFA，如果没有使用 IDFA 直接传 nil
    [JPUSHService setupWithOption:launchOptions appKey:@"2c934b9532c99a9322768b47"
                        channel:@"channel1"
               apsForProduction:1
          advertisingIdentifier:nil];

    //配置设置渠道号
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sourceid" ofType:@"dat"];
    NSString* contentstr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"NSString类方法读取的内容是：\n%@",contentstr);
    [MJPlatform setChannel:contentstr];
    
    
    return YES;
}




+(void)changeRootViewController:(Boolean)isLandspace openurl:(NSString*)urlstr{
    if(isLandspace==isCurLandspace){
        return ;
    }
    isCurLandspace = isLandspace;
    
    if(isLandspace){
//        CCEAGLView *__glView = (CCEAGLView *)s_self->_viewController2.view;
//        s_self->_viewController2.view = nil;
//        s_self->_viewController.view = __glView;
        s_self->_viewController.view.bounds = CGRectMake(0, 0,s_self->_largebouns, s_self->_smallbouns);
        if ([[UIDevice currentDevice].systemVersion floatValue] < 6.0)
        {
            [s_self->window addSubview:s_self->_viewController.view];
        }else{
            [s_self->window setRootViewController:s_self->_viewController];
        }
        [s_self->_viewController resetGLView];
        
    }else{
        
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationPortrait] forKey:@"orientation"];
        
//        CCEAGLView *__glView = (CCEAGLView *)s_self->_viewController.view;
//        s_self->_viewController.view = nil;
//        s_self->_viewController2.view = __glView;
        s_self->_viewController2.view.bounds = CGRectMake(0, 0,s_self->_smallbouns, s_self->_largebouns);
        if ([[UIDevice currentDevice].systemVersion floatValue] < 6.0)
        {
            [s_self->window addSubview:s_self->_viewController2.view];
        }else{
            [s_self->window setRootViewController:s_self->_viewController2];
        }
        
        [s_self->_viewController2 openWebView:urlstr];
        
        [MNFloatBtn show];

        [MNFloatBtn sharedBtn].btnClick = ^(UIButton *sender){
            [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];

            [MNFloatBtn hidden];
            [AppController changeRootViewController:true openurl:@""];

            [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
            [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeRight] forKey:@"orientation"];
        };
        
    }
    
    
    
//    [__glView alignmentRectForFrame:__glView.frame];
//    [__glView alignmentRectForFrame:__glView.frame];
//    [__glView setTransform:CGAffineTransformMakeRotation(M_PI_2)];
//    CGRect  frame_v = __glView.bounds;
//        __glView.bounds = CGRectMake(frame_v.origin.x, frame_v.origin.y, frame_v.size.width, frame_v.size.height);
//
//    [__glView initWithFrame:__glView.frame];
//    __glView.bounds = CGRectMake(0,0, frame_v.size.height*2, frame_v.size.width*2);

}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
    // We don't need to call this method any more. It will interrupt user defined game pause&resume logic
    /* cocos2d::Director::getInstance()->pause(); */
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    // We don't need to call this method any more. It will interrupt user defined game pause&resume logic
    /* cocos2d::Director::getInstance()->resume(); */
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
//    currType=[MJPlatform getCurrScreenType];
//    if(currType==11){
//       [MJPlatform setOrientationVertical];
//    }
    
    cocos2d::Application::getInstance()->applicationDidEnterBackground();
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
    
//    if(currType==11){
//        [MJPlatform setScreenOrientationHorizontal];
//    }
    cocos2d::Application::getInstance()->applicationWillEnterForeground();
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    if([url.scheme isEqualToString:WX_APPID]){
        [WXApi handleOpenURL:url delegate:[WeChatDelegete sharedDelegate]];
    }else if([url.scheme isEqualToString:[MW_SCHEME lowercaseString] ]){
        [MWApi routeMLink:url];
    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler
{
    return [MWApi continueUserActivity:userActivity];
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    
    if([url.scheme isEqualToString:WX_APPID]){
        
        [WXApi handleOpenURL:url delegate:[WeChatDelegete sharedDelegate]];
        
    }else if([url.scheme isEqualToString:[MW_SCHEME lowercaseString]]){
        [MWApi routeMLink:url];
    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    NSLog(@"url.scheme:%@",url.scheme);
    
    
    if([url.scheme isEqualToString:WX_APPID]){
        
        return [WXApi handleOpenURL:url delegate:[WeChatDelegete sharedDelegate]];
        
    }else if([url.scheme isEqualToString:[MW_SCHEME lowercaseString]]){
        
        [MWApi routeMLink:url];
    }
    
    return YES;
}

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
//    UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
//    UIInterfaceOrientation statusBarOrientation =[UIApplication sharedApplication].statusBarOrientation;
//    if(deviceOrientation == UIDeviceOrientationPortrait || deviceOrientation == UIDeviceOrientationPortraitUpsideDown){
//        if(statusBarOrientation != UIInterfaceOrientationPortrait ||statusBarOrientation != UIInterfaceOrientationPortraitUpsideDown){
//            return 0;
//        }
//    }
//    // otherwise
//    return UIInterfaceOrientationMaskLandscape;
//
    // UIInterfaceOrientationMaskAll
    // it is the safest way of doing it:
    // - GameCenter and some other services might have portrait-only variant
    //     and will throw exception if portrait is not supported here
    // - When you change allowed orientations if you end up forbidding current one
    //     exception will be thrown
    // Anyway this is intersected with values provided from UIViewController, so we are good
    //return   (1 << UIInterfaceOrientationPortrait) | (1 << UIInterfaceOrientationPortraitUpsideDown)
    //| (1 << UIInterfaceOrientationLandscapeRight) | (1 << UIInterfaceOrientationLandscapeLeft);

    if(isCurLandspace){
        return  UIInterfaceOrientationMaskLandscapeRight;
    }else{
        return UIInterfaceOrientationMaskPortrait;
    }
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

  /// Required - 注册 DeviceToken
  [JPUSHService registerDeviceToken:deviceToken];
}


- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
  //Optional
  NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}
#pragma mark- JPUSHRegisterDelegate

// iOS 12 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification{
  if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    //从通知界面直接进入应用
      NSLog(@"jpush jin ru youxi");
//              UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ios12support" message:@"从通知界面直接进入应用" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//              [alert show];

  }else{
    //从通知设置界面进入应用
      NSLog(@"jpush jin ru youxi2");
//      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ios12support" message:@"从通知界面进入应用" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//      [alert show];
  }
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
  // Required
  NSDictionary * userInfo = notification.request.content.userInfo;
  if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    NSLog(@"jpush support101");
    [JPUSHService handleRemoteNotification:userInfo];
  }
  completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有 Badge、Sound、Alert 三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
  // Required
  NSDictionary * userInfo = response.notification.request.content.userInfo;
  if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    NSLog(@"jpush support102");
    [JPUSHService handleRemoteNotification:userInfo];
      
    //如果后续需要，这样获取值
//    NSString* openid = [userInfo valueForKey:@"openview"];
      
      [MJPlatform setJpushExtraString:@"jpush"];
      
  }
  completionHandler();  // 系统要求执行这个方法
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
NSLog(@"jpush support7");
  // Required, iOS 7 Support
  [JPUSHService handleRemoteNotification:userInfo];
  completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
NSLog(@"jpush support6");
  // Required, For systems with less than or equal to iOS 6
  [JPUSHService handleRemoteNotification:userInfo];
}



- (void)registerMlink
{
    [MWApi registerMLinkDefaultHandler:^(NSURL * _Nonnull url, NSDictionary * _Nullable params) {
        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"registerMLinkDefaultHandler" message:[NSString stringWithFormat:@"url=%@++++++动态参数=%@",url,params] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
        NSString* str = [url absoluteString];
        NSArray* arrStr = [str componentsSeparatedByString:@"?"];
        
        if(arrStr.count !=2){
            return;
        }
        
        NSArray* keys = [arrStr[1] componentsSeparatedByString:@"="];
        if(keys.count !=2){
            return;
        }
        
        if([keys[0] isEqualToString:@"playbackroomid"]){
            [MJPlatform onPlayBack:keys[1]];
        }else if ([keys[0] isEqualToString:@"enterroomid"]){
            [MJPlatform inviteWeChatCall:keys[1]];
        }else if ([keys[0] isEqualToString:@"joinclubid"]){
            [MJPlatform onInvitedIntoClubCall:keys[1]];
        }
    }];
    
    [MWApi registerMLinkHandlerWithKey:@"enterroom" handler:^(NSURL * _Nonnull url, NSDictionary * _Nullable params) {
        
        [MJPlatform inviteWeChatCall:params[@"enterroomid"]];
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"registerMLinkHandlerWithKey" message:[NSString stringWithFormat:@"url=%@++++++动态参数=%@",url,params] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
    }];
    
    [MWApi registerMLinkHandlerWithKey:@"inviteIntoGlub" handler:^(NSURL * _Nonnull url, NSDictionary * _Nullable params) {
        [MJPlatform onInvitedIntoClubCall:params[@"joinclubid"]];
        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"registerMLinkHandlerWithKey" message:[NSString stringWithFormat:@"url=%@++++++动态参数=%@",url,params] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [alert show];
    }];
    
    [MWApi registerMLinkHandlerWithKey:@"playback" handler:^(NSURL * _Nonnull url, NSDictionary * _Nullable params) {
        [MJPlatform onPlayBack:params[@"playbackroomid"]];
        
        
    }];
}


#if __has_feature(objc_arc)
#else
- (void)dealloc {
    [window release];
    [_viewController release];
    [super dealloc];
}
#endif


@end
