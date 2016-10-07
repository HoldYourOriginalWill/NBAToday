//
//  WXDataService.m
//  WXWeibo
//
//  Created by wei.chen on 13-10-16.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "LoadDataService.h"
#import "NSString+URLEncoding.h"

#define BASE_URL @"http://games.mobileapi.hupu.com/2/2.3.2/"
#define CLIENT @"client=a73c505477f4013582bb7600953d0d86f49ab705"

@implementation LoadDataService

//网络请求
+ (ASIHTTPRequest *)requestWithURL:(NSString *)urlstring
                            params:(NSMutableDictionary *)params
                        httpMethod:(NSString *)httpMethod
                             block:(CompletionLoadHandle)block {
    
    if (params == nil) {
        params = [NSMutableDictionary dictionary];
    }
    
    //http://games.mobileapi.hupu.com/2/2.3.2/nba/getNews?client=a73c505477f4013582bb7600953d0d86f49ab705&nid=0&direc=next&num=20
    
    //http://games.mobileapi.hupu.com/2/2.3.2/nba/getGames?client=a73c505477f4013582bb7600953d0d86f49ab705&date=1382371200
    
    //http://games.mobileapi.hupu.com/2/2.3.2/nba/getVideo?client=a73c505477f4013582bb7600953d0d86f49ab705&num=20&vid=0
    
    //http://games.mobileapi.hupu.com/2/2.3.2/nba/getStandings?client=a73c505477f4013582bb7600953d0d86f49ab705
    
    //http://games.mobileapi.hupu.com/2/2.3.2/nba/getNewsDetail?client=a73c505477f4013582bb7600953d0d86f49ab705&nid=1533607
    
    //http://games.mobileapi.hupu.com/2/2.3.2/nba/setIosClientToken?client=a73c505477f4013582bb7600953d0d86f49ab705&clienttoken=09aee6f1%206a2bd2c0%20bff5f2fb%20355fa35f%2098cc6a34%209c1b12ed%20af3b88f5%20d717ac99
    
    /*
     client	a73c505477f4013582bb7600953d0d86f49ab705
     nid	0
     direc	next
     num	20
     */
    // urlstring "nba/getNews"
    
    //3.如果是GET请求，将参数拼接到url后面
    
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@%@",BASE_URL,urlstring];
    if ([httpMethod isEqualToString:@"GET"] && params.count > 0) {
        
        //[url appendFormat:@"%@%@",@"?",CLIENT];
        [url appendString:@"?"];
        NSArray *allkeys = [params allKeys];
        for (int i=0; i<allkeys.count; i++) {
            NSString *key = [allkeys objectAtIndex:i];
            NSString *value = [params objectForKey:key];
            
            //url编码
            value = [value URLEncodedString];
            
            [url appendFormat:@"%@=%@",key,value];
            
            if (i<allkeys.count-1) {
                [url appendString:@"&"];
            }
        }
    }
    
    //4.创建request请求
    __block  ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:url]];
    [request setRequestMethod:httpMethod];
    [request setTimeOutSeconds:60];
    
    //5.判断是否为POST请求，向请求体中添加参数
    if ([httpMethod isEqualToString:@"POST"]) {
        for (NSString *key in params) {
            id value = [params objectForKey:key];
            //判断是否为文件数据
            if ([value isKindOfClass:[NSData class]]) {
                [request addData:value forKey:key];
            } else {
                [request addPostValue:value forKey:key];
            }
        }
    }
    
    //6.数据返回的处理
    
    [request setCompletionBlock:^{
        
       // NSString *responseString = request.responseString;
        
        NSData *jsonData = request.responseData;
        id result = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
        if (block != nil) {
            block(result);
        }
    }];
    
    //7.请求失败
    [request setFailedBlock:^{
     
        WXLog(@"请求失败:%@",request.error);
    }];
    
    //8.发送异步请求
    [request startAsynchronous];
    
    return request;
}



@end
