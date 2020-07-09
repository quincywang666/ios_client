//
//  MJPlatformCall-IOS.hpp
//  GameClient
//
//  Created by lan on 2017/3/31.
//
//

#ifndef MJPlatformCall_IOS_HPP
#define MJPlatformCall_IOS_HPP

#include <string>
using std::string;

class MJPlatformCall{
public:
    static void loginWX();
    
    static void resetAutoLogin();
    
    static void autoLogin();
    
    //分享到微信聊天
    static void shareImgToSession(const char* path);
    
    static void shareTextToSession(const string& text);
    
    
    //分享到微信朋友圈
    static void shareImgToTimeLine(const char* path);
    
    static void shareImg(const char* path,int scene);
    
    static void copyText(const char* text);
    
    static void inviteWeiXin(std::string roomid, std::string roomround, std::string playType, std::string url);
    
    static void exitWeiXin();
    
    static void upDateVersion(const char* url);
    
    static void startPayment(const char* product);
   
    
};



#endif /* MJPlatformCall_IOS_hpp */
