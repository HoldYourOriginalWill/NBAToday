//
//  UIUtils.m
//  今日NBA
//
//  Created by ios on 13-10-29.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "UIUtils.h"

@implementation UIUtils

+(float)getLabelHeightWithText:(NSString *)text Font:(UIFont *)font Size:(CGSize)size{
    
    CGSize newSize=[text sizeWithFont:font constrainedToSize:size];
    
    return newSize.height;
}

+(NSString *)labelTime:(NSNumber *)addtime{
    
    double sendTime=[addtime doubleValue];
    NSDate *date=[NSDate date];
    NSTimeInterval nowTime=[date timeIntervalSince1970];
    
    double f=nowTime-sendTime;
    //60*60*24
    if(f<60) {
        return @"刚刚";
    }else if (60<=f && f<60*60){
        int d=f/60;
        NSString *timeString=[NSString stringWithFormat:@"%d分钟前",d];
        
        return timeString;
    }else if (60*60<=f && f<60*60*24){
        
        int d=f/(60*60);
        NSString *hourstring=[NSString stringWithFormat:@"%d小时前",d];
        
        return hourstring;
    }else if(60*60*24<=f && f<60*60*24*30){
        
        int d=f/60*60*24;
        NSString *daystring=[NSString stringWithFormat:@"%d天前",d];
        
        return daystring;
    }else{
        
        NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
        NSLocale *local=[NSLocale currentLocale];
        [formatter setLocale:local];
        NSString *format=[NSString stringWithFormat:@"M月d日"];
        [formatter setDateFormat:format];
        
        NSDate *date=[NSDate dateWithTimeIntervalSince1970:sendTime];
        NSString *datestring=[formatter stringFromDate:date];
        
        return datestring;
        
    }
    
}




@end
