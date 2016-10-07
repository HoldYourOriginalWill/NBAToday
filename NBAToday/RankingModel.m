//
//  RankingModel.m
//  今日NBA
//
//  Created by ios on 13-10-25.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "RankingModel.h"

@implementation RankingModel

/*
 "tid": "5",
 "name": "魔术",
 "win": "0",
 "lost": "0",
 "win_rate": "0.0",
 "strk": "0连败",
 "gb": 0
 */


-(NSDictionary *)attributeMapDictionary{
    
    NSDictionary *mapAtt=@{@"tid": @"tid",
                           @"name": @"name",
                           @"win": @"win",
                           @"lost": @"lost",
                           @"winrate": @"win_rate",
                           @"strk": @"strk",
                           @"gb": @"gb",
                           };
    return mapAtt;
}

@end
