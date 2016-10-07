//
//  LiveModel.h
//  今日NBA
//
//  Created by ios on 13-11-4.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseModel.h"

/*
 "event": "——大家上午好！我是虎扑看球直播员大叔，今天我为大家带来NBA常规赛纽约尼克斯主场对阵明尼苏达森林狼的比赛。",
 "end_time": "大叔",
 "team": 0
 */

@interface LiveModel : BaseModel

@property(nonatomic,copy)NSString *event;
@property(nonatomic,copy)NSString *end_time;
@property(nonatomic,copy)NSString *team;

@end
