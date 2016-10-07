//
//  RankingModel.h
//  今日NBA
//
//  Created by ios on 13-10-25.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseModel.h"

/*
 "tid": "5",
 "name": "魔术",
 "win": "0",
 "lost": "0",
 "win_rate": "0.0",
 "strk": "0连败",
 "gb": 0
 */

@interface RankingModel : BaseModel

@property(nonatomic,copy)NSString *tid;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *win;
@property(nonatomic,copy)NSString *lost;
@property(nonatomic,copy)NSString *winRate;
@property(nonatomic,copy)NSString *strk;     //近况
@property(nonatomic,strong)NSNumber *gb;       //胜场差

@end
