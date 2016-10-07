//
//  NewsModel.h
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseModel.h"

/*
 {
 "nid": "1533456",
 "title": "罗伊斯-怀特17分钟内六犯离场",
 "summary": "在今天76人与骑士的比赛中，76人前锋罗伊斯-怀特在17分钟的上场时间内六犯...",
 "img": "http://c2.hoopchina.com.cn/uploads/star/event/images/131022/thumbnail-ac9dfff03600a5f773ba815a96972cb27b8c1fd3.jpg",
 "lights": 0,
 "replies": "132"
 },
 */

@interface NewsModel : BaseModel

@property(nonatomic,copy)NSString *nid;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *summary;
@property(nonatomic,copy)NSString *img;
@property(nonatomic,copy)NSString *replies;

@end
