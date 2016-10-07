//
//  CommentModel.h
//  今日NBA
//
//  Created by ios on 13-10-27.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseModel.h"

/*
 "light_comments": [
 {
 "ncid": "1555873",
 "light_count": "25",
 "user_name": "无敌的绿军",
 "content": "@詹姆斯亲爸是裁判 觉得他是杂种的请亮我",
 "from": "0",
 "create_time": "1382864687"
 }
 */

@interface CommentModel : BaseModel

@property(nonatomic,copy)NSString *ncid;
@property(nonatomic,copy)NSString *light_count;
@property(nonatomic,copy)NSString *user_name;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *from;
@property(nonatomic,strong)NSNumber *create_time;

@end
