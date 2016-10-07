//
//  GameModel.m
//  爱看球
//
//  Created by ios on 13-10-23.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

-(NSDictionary *)attributeMapDictionary{
    
    NSDictionary *mapAtt=@{@"gid": @"gid",
                           @"dataTime":@"date_time",
                           @"beginTime":@"begin_time",
                           @"homeTid":@"home_tid",
                           @"homeName":@"home_name",
                           @"homeScore":@"home_score",
                           @"awayTid":@"away_tid",
                           @"awayName":@"away_name",
                           @"awayScore":@"away_score",
                           @"matchType":@"match_type",
                           @"process":@"process"};
    
    return mapAtt;
}

@end
