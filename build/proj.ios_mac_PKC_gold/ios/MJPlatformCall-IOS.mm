//
//  MJPlatformCall-IOS.cpp
//  GameClient
//
//  Created by lan on 2017/3/31.
//
//

#include "MJPlatformCall-IOS.hpp"
#include "WXApi.h"
#include "IAPHelper.h"
#include "Constant-IOS.h"
#include "WeChatDelegete.h"
#include <string>

static bool autoLoginTag=false;

void MJPlatformCall::loginWX(){
    [[WeChatDelegete sharedDelegate] requestNormalLogin];
}

void MJPlatformCall::resetAutoLogin(){
    autoLoginTag=false;
}

void MJPlatformCall::autoLogin(){
    
    if(autoLoginTag){
        return;
    }
    autoLoginTag=true;
    
    NSUserDefaults * defaul=[NSUserDefaults standardUserDefaults];
    NSString* refresh_token=[defaul valueForKey:@"refresh_token"];
    if(refresh_token){
        [[WeChatDelegete sharedDelegate]requestRefreshToken:refresh_token];
    }
}

//分享到微信聊天
void MJPlatformCall::shareImgToSession(const char* path){
    MJPlatformCall::shareImg(path,WXSceneSession);
}

void MJPlatformCall::shareTextToSession(const string& text){
    //WXWebpageObject* webObj=[[WXWebpageObject alloc]init];
    
    
    //WXMediaMessage* mediaMessage=[[WXMediaMessage alloc]init];
    
    //mediaMessage.title=[NSString stringWithUTF8String:title.c_str()];
    //mediaMessage.description=[NSString stringWithUTF8String:text.c_str()];
    
    //mediaMessage.mediaObject=webObj;
    
    //NSString *iconPath = [[NSBundle mainBundle] pathForResource:@"Icon-57.png" ofType:@""];
    //UIImage* image = [UIImage imageWithContentsOfFile:iconPath];
    
    //[mediaMessage setThumbImage:image];
    
    SendMessageToWXReq* req=[[SendMessageToWXReq alloc]init];
   // req.message=mediaMessage;
    req.text=[NSString stringWithUTF8String:text.c_str()];
    req.scene=WXSceneSession;
    req.bText=YES;
    
    
    [WXApi sendReq:req];
}



//分享到微信朋友圈
void MJPlatformCall::shareImgToTimeLine(const char* path){
    MJPlatformCall::shareImg(path,WXSceneTimeline);
}


void MJPlatformCall::shareImg(const char* path,int scene){
    
    if(!path){
        return;
    }
    
    WXMediaMessage* message=[[WXMediaMessage alloc]init];
    WXImageObject* obj=[[WXImageObject alloc]init];
    NSString* filePath=[NSString stringWithUTF8String:path];
//    NSString* filePath=[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%s",path] ofType:@""];
    
    obj.imageData=[NSData dataWithContentsOfFile:filePath];
    message.mediaObject=obj;
    
    SendMessageToWXReq *req=[[SendMessageToWXReq alloc]init];
    req.bText=NO;
    req.message=message;
    req.scene=scene;
    [WXApi sendReq:req];
}


void MJPlatformCall::copyText(const char* text){
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    if(!text){
        pasteboard.string=nil;
    }else{
        pasteboard.string = [NSString stringWithUTF8String:text];
    }
}

void MJPlatformCall::inviteWeiXin(std::string roomid, std::string roomround, std::string playType, std::string urlpath){
   
    WXWebpageObject* webObj=[[WXWebpageObject alloc]init];
    webObj.webpageUrl=[NSString stringWithUTF8String:urlpath.c_str()];
    
    WXMediaMessage* mediaMessage=[[WXMediaMessage alloc]init];
    
    mediaMessage.title=[NSString stringWithFormat:@"喜喜斗地主,房号:%@ (%@局)",[NSString stringWithUTF8String:roomid.c_str()],[NSString stringWithUTF8String:roomround.c_str()]];
    mediaMessage.description=[NSString stringWithUTF8String:playType.c_str()];
    
    mediaMessage.mediaObject=webObj;
    
    NSString *iconPath = [[NSBundle mainBundle] pathForResource:@"Icon-57.png" ofType:@""];
    
    
    UIImage* image = [UIImage imageWithContentsOfFile:iconPath];
    
    [mediaMessage setThumbImage:image];
    
    SendMessageToWXReq* req=[[SendMessageToWXReq alloc]init];
    req.message=mediaMessage;
    
    [WXApi sendReq:req];
    
}

//打开appstore下载地址就可以，
//https://itunes.apple.com/cn/app/wei/id414478124 微信的appstore下载地址，可以用来测试
void MJPlatformCall::upDateVersion(const char* urlpath){
    if(urlpath==nullptr){
        return;
    }
    
    NSURL* URL=[[NSURL alloc]initWithString:[NSString stringWithUTF8String:urlpath]];
    [[UIApplication sharedApplication] openURL:URL];
}

void MJPlatformCall::exitWeiXin(){
    NSUserDefaults * defaul=[NSUserDefaults standardUserDefaults];
    [defaul removeObjectForKey:@"refresh_token"];
    
}

void MJPlatformCall::startPayment(const char* product){
    if(!product){
        return;
    }
    
    [[IAPHelper sharedInstance] startPayWithProductId:[NSString stringWithUTF8String:product]];
}




