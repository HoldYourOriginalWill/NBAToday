//
//  GameModel.h
//  爱看球
//
//  Created by ios on 13-10-23.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseModel.h"

/*
 "gid": "24638",
 "date_time": "1382371200",
 "begin_time": "1382396400",
 "home_tid": "15",
 "home_name": "猛龙",
 "home_score": "123",
 "away_tid": "4",
 "away_name": "尼克斯",
 "away_score": "120",
 "match_type": "PRESEASON",
 "process": "已结束",
 "status": "1",
 "live": "2",
 "follow": 0
 */

@interface GameModel : BaseModel

@property(nonatomic,copy)NSString *gid;           //id
@property(nonatomic,copy)NSString *dateTime;    //日期
@property(nonatomic,copy)NSString *beginTime;   //开始时间
@property(nonatomic,copy)NSString *homeTid;     //主队id
@property(nonatomic,copy)NSString *homeName;      //主队名字
@property(nonatomic,copy)NSString *homeScore;   //主队分数
@property(nonatomic,copy)NSString *awayTid;     //客队id
@property(nonatomic,copy)NSString *awayName;      //客队名字
@property(nonatomic,copy)NSString *awayScore;   //客队分数
@property(nonatomic,copy)NSString *matchType;     //比赛类型
@property(nonatomic,copy)NSString *process;       //比赛情况

@end
