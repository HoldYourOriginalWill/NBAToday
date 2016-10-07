//
//  BaseModel.h
//  爱看球
//
//  Created by ios on 13-10-23.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject<NSCoding>

-(id)initWithDataDic:(NSDictionary *)data;
-(NSDictionary *)attributeMapDictionary;
-(void)setAttributes:(NSDictionary *)dataDic;
-(NSString *)customDescription;
-(NSString *)description;
-(NSData *)getArchivedData;

-(NSString *)cleanString:(NSString *)str;   //清除\n和\r的字符串

@end
