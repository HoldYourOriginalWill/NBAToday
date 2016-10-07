//
//  DoneScoreModel.h
//  今日NBA
//
//  Created by ios on 13-10-30.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseModel.h"

/*
 "oid": "1549328",
 "name": "保罗-乔治",
 "header_img": "http://nba.hupu.com/players/images/paulgeorge_3458.jpg",
 "content": "24分6板5助，1抢3盖4误，投篮8-16三分3-6罚球5-7，+11",
 "memo": "步行者",
 "ratings": "8.5",
 "user_num": "346",
 "my_rating": 0
 */

@interface DoneScoreModel : BaseModel

@property(nonatomic,copy)NSString *oid;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *header_img;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *memo;
@property(nonatomic,copy)NSString *ratings;
@property(nonatomic,copy)NSString *user_num;
@property(nonatomic,copy)NSString *my_rating;

@end
