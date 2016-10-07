//
//  UIUtils.h
//  今日NBA
//
//  Created by ios on 13-10-29.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIUtils : NSObject

//获得标签的文本高度
+(float)getLabelHeightWithText:(NSString *)text Font:(UIFont *)font Size:(CGSize)size;


//获取离现在的时间的差
+(NSString *)labelTime:(NSNumber *)addtime;

@end
