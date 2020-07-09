//
//  MJPlatform.h
//  MJClient
//
//  Created by lanc on 2017/5/24.
//
//
// lua调用的oc接口，和oc逻辑结束之后回调lua的中间类

#import <Foundation/Foundation.h>





@interface MJPlatform : NSObject

+(int)getCurrScreenType;

/*
 *@method 微信自动登录
 */
+(void)autoLogin;

//微信登录
+(void)loginWX;

+(void)logoutWX;

//分享文本到微信聊天
+(void)shareTextToWeChatSession:(NSDictionary*)dic;

//分享文本到微信朋友圈
+(void)shareTextToWeChatTimeLine:(NSDictionary*)dic;

//分享图片到微信聊天
+(void)shareImgToWeChatSession:(NSDictionary*)dic;

//分享图片到微信朋友圈
+(void)shareImgToWeChatTimeLine:(NSDictionary*)dic;

//分享图片到微信
//@param scene 界面标记
+(void)shareImgToWeChat:(NSString*)fullpath scene:(int)scene;

/*
 *@method 分享网页到微信聊天
 *@param dic 数据字典
 */
+(void)shareWebpageToWeChatSession:(NSDictionary*)dic;



//注册lua函数，从lua端调用
+(void)registerScriptHandler:(NSDictionary *)dict;


//微信登录结果返回
+(void)WeChatLoginCallBack:(NSString*)uid nick:(NSString*)nick imgPath:(NSString*)imgPath sex:(NSString*)sex token:(NSString*)token;

//发起ios内购支付
+(void)startPayment:(NSDictionary*) dic;

/*
 *@method iap 购买失败的回调
 *@param error
 */
+(void)iapFailed:(NSError*)error;

/*
 *@mathod iap 购买成功的回调
 *@param product 商品id
 *@param base64CheckCode base64后的商品交易数据
 */
+(void)iapSuccess:(NSString*)product base64CheckCode:(NSString*)base64CheckCode;

/*
 *@method 复制文本到剪切板
 */
+(void)copyText:(NSDictionary*)dic;

/*
 *@method 计算定位距离
 */
+(NSString*)getLocationDistance:(NSDictionary*)dic;

/*
 *@method setScreenOrientationHorizontal设置横屏
 *@notice 基于初始状态竖屏设计实现
 */
+ (void)setScreenOrientationHorizontal;

/*
 *@method setScreenOrientationHorizontal设置竖屏
 *@notice 基于初始状态竖屏设计实现
 */
+ (void)setOrientationVertical;


+(void)openSystemWebView:(NSDictionary*)dic;

/*
 *@method 从微信启动的邀请返回
 */
+(void)inviteWeChatCall:(NSString*)roomid;


/*
 *@method 微信邀请加入俱乐部的回调
 */
+(void)onInvitedIntoClubCall:(NSString*)clubid;

/*
 *@method 牌局回放分享回调
 *@param roomid回放id
 */
+(void)onPlayBack:(NSString*)roomid;

/*
 *@method loadtion开始定位
 */
+(void)location;

/*
 *@method onLocationInfo获取到定位信息
 *@param latitude经度
 *@param longitude纬度
 */
+(void)onLocationInfo:(double)latitude longitude:(double)longitude;

/*
 *@method openAppSetting 打开App设置界面
 *@notice ios8 跳转正常，无返回App的按钮
 */
+(void)openAppSetting;

/*
 *@method onShareSuccess分享成功回调
 */
+(void)onShareSuccess;

/*
 *@method openOtherApp
 */
+(void)jumpToOtherApp:(NSDictionary*)dic;

+(NSString*)getAppVersion;

//流量信号强度
+(NSString*)getMobileSignalStrength;

//wifi信号强度
+(NSString*)getWifiSignalStrength;

//网络类型
+(NSString*)getNetworkType;

//获取电量强度
+(NSString*)getBatteryQuantity;

//获取唯一ID
+(NSString*)getDeviceOnlyID;

+(void)setWinSize:(NSDictionary*)dic;

+(int)getReq;
+(void)setJpushAlias:(NSDictionary*)dic;
+(void)resetTag;
+(void)addJpushTags:(NSDictionary*)dic;

+(void)setJpushExtraString:(NSString*)str;
+(NSString*)getJpushExtraString;

+(NSString*)getChannel;
+(void)setChannel:(NSString*)str;

+(NSString *)getSystemVersion;
+(NSString *)getSystemModel;
+(NSString *)getDeviceType;

@end
