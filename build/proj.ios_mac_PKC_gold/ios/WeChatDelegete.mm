//
//  WeChatDelegete.m
//  GameClient
//
//  Created by lan on 2017/3/31.
//
//

#import "WeChatDelegete.h"
#import "Constant-IOS.h"
//#import "PlatformInterface.h"
#import "MJPlatform.h"

@implementation WeChatDelegete

+(WeChatDelegete*)sharedDelegate{
    static dispatch_once_t onceToken;
    static WeChatDelegete *instance;
    dispatch_once(&onceToken, ^{
        instance = [[WeChatDelegete alloc] init];
    });
    return instance;
}


-(void) onReq:(BaseReq*)req{
    
}


-(void) onResp:(BaseResp*)resp{
    if([resp isKindOfClass:[SendAuthResp class]]) {
        
        SendAuthResp *authResp = (SendAuthResp *)resp;
        
        [self onAUthResp:authResp];
    }else if([resp isKindOfClass:[SendMessageToWXResp class]]){
        SendMessageToWXResp* toWXResp=(SendMessageToWXResp*)resp;
        if(toWXResp.errCode==0){
            [MJPlatform onShareSuccess];
        }
    }
}

-(NSDictionary*)decodeJSONStringByData:(NSData*)data{
    if(!data){
        return nil;
    }
    
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
    if(dic){
        return dic;
    }
    
    return nil;
}

-(void)onAUthResp:(SendAuthResp*)resp{
    if(resp.errCode){
        if(resp.errCode==-4){
            //用户拒绝授权
        }else if(resp.errCode==-2){
            //用户取消
        }else{
            //未知的错误
        }
        NSLog(@"%@",[NSString stringWithFormat:@"error code:%d:%@",resp.errCode,resp.errStr]);
    }else{
        [self requestAccessToken:resp.code];
    }
}

-(void)requestNormalLogin{
    SendAuthReq* req = [[SendAuthReq alloc] init];
    req.scope = WX_SCOPE;
    req.state = WX_STATE;
    
    [WXApi sendAuthReq:req viewController:[UIApplication sharedApplication].keyWindow.rootViewController delegate:self];
}

-(void)requestAccessToken:(NSString*)code{
    if(code==nil){
        return;
    }
    
    NSString* URLString=[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code",WX_APPID,WX_SECRECT,code];
    
    NSURL *URL = [NSURL URLWithString:URLString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:URL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    //创建同步连接
    NSError *error = nil;
    NSData *receivedData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if(error){
        //获取access_token失败
    }else{
        NSDictionary* dic=[self decodeJSONStringByData:receivedData];
        
        if(!dic){
            //decode jsonString failed
            return;
        }
        
        if([dic objectForKey:@"errcode"]){
            int errcode=[[dic objectForKey:@"errcode"] intValue];
            NSString* errmsg=[dic objectForKey:@"errmsg"];
            
            NSLog(@"requestAccessToken failed errcode:%d errmsg:%@",errcode,errmsg);
        }else{
            NSString* refreshToken=dic[@"refresh_token"];
            NSUserDefaults * defaul=[NSUserDefaults standardUserDefaults];
            [defaul setValue:refreshToken forKey:@"refresh_token"];
            [self requestRefreshToken:refreshToken];
        }
    }
}

-(void)requestRefreshToken:(NSString*)refreshToken{
    if(!refreshToken){
        return;
    }
    
    NSString* urlString= [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=%@&grant_type=refresh_token&refresh_token=%@",WX_APPID,refreshToken];
    
    NSURL *url=[NSURL URLWithString:urlString];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    //创建同步连接
    NSError *error = nil;
    NSData *receivedData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    if(error){
        NSLog(@"requestRefreshToken failed:");
        
        [self requestNormalLogin];
    }else{
        NSDictionary* dic=[self decodeJSONStringByData:receivedData];
        
        [self requestUserInfo:dic[@"access_token"] openid:dic[@"openid"]];
    }
}

-(void)requestUserInfo:(NSString*)access_token openid:(NSString*)openid{
    
    NSString* url=[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/userinfo?access_token=%@&openid=%@",access_token,openid];
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:URL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    //创建同步连接
    NSError *error = nil;
    NSData *receivedData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if(error){
        NSLog(@"requestUserInfo failed:");
        return;
    }else{
        NSDictionary* dic=[self decodeJSONStringByData:receivedData];
   
        NSString* nick=dic[@"nickname"];
        
        if(!nick){
            return;
        }
        
        NSString* headimgurl=dic[@"headimgurl"];
        headimgurl=[headimgurl stringByReplacingOccurrencesOfString:@"http://" withString:@"https://"];
        
        int sex=[dic[@"sex"] intValue];
        NSString* unionid=dic[@"unionid"];
        
        NSLog(@"unionid=================%@",unionid);
        
//        unionid=[NSString stringWithFormat:@"%@%@",unionid,@"3"];
        
        NSString* hashString=unionid;
        
        NSString *sexString=[NSString stringWithFormat:@"%d",sex];
        
        [MJPlatform WeChatLoginCallBack:hashString nick:nick imgPath:headimgurl sex:sexString token:@""];
        
    }
}




@end
