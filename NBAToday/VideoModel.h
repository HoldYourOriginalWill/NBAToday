//
//  VideoModel.h
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseModel.h"

/*
 "vid": "381427",
 "gid": "1",
 "title": "10月22日十佳球：T-罗斯救命三分，火箭熊高难度表演",
 "fromurl": "http://you.video.sina.com.cn/b/117435240-1290074964.html#myflashBox",
 "playtime": "00:00",
 "cover": "http://v1.hoopchina.com.cn/nba/4a/24/381427_647.jpg"
 */


@interface VideoModel : BaseModel

@property(nonatomic,copy)NSString *vid;
@property(nonatomic,copy)NSString *gid;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *fromurl;
@property(nonatomic,copy)NSString *playtime;
@property(nonatomic,copy)NSString *cover;

@end
