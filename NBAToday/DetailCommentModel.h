//
//  DetailCommentModel.h
//  今日NBA
//
//  Created by ios on 13-11-5.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseModel.h"

/*
 "coid": "738666",
 "cid": "1156646",
 "nickname": "特雷西麦格雷迪",
 "vip": "0",
 "rating": "10",
 "desc": "去告诉他们谁是后AI时代76人的领袖",
 "like": "53",
 "addtime": "1383618035",
 "liked": 0
 */

@interface DetailCommentModel : BaseModel

@property(nonatomic,copy)NSString *nickname;
@property(nonatomic,copy)NSString *rating;
@property(nonatomic,copy)NSString *desc;
@property(nonatomic,copy)NSString *like;
@property(nonatomic,copy)NSString *addtime;
@property(nonatomic,copy)NSString *liked;

@end
