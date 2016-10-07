//
//  DetailModel.h
//  今日NBA
//
//  Created by ios on 13-10-27.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseModel.h"

/*
 ult": {
 "nid": "1537411",
 "lights": 0,
 "replies": "10",
 "title": "魔术执行尼科尔森等四位球员的合同选项",
 "origin": "Magic Basketball",
 "img": "http://c1.hoopchina.com.cn/uploads/star/event/images/131027/thumbnail-62a59c594c984d87039e9e9a9e09a86b66214af5.jpg",
 "img_m": "http://c1.hoopchina.com.cn/uploads/star/event/images/131027/bmiddle-62a59c594c984d87039e9e9a9e09a86b66214af5.jpg",
 "content": "<p>魔术队今天正式宣布，球队已经正式执行了前锋莫里斯-哈克利斯、安德鲁-尼科尔森的第三年合同，同时他们还执行了托拜厄斯-哈里斯和尼古拉-武切维奇的第四年合同选项。</p>\r\n\r\n<p>至此，这四名球员的合同都被执行到2014-15赛季。</p>\r\n\r\n<p>菜鸟赛季，身高6英尺9英寸的哈克利斯打了76场比赛，场均可以贡献8.2分4.4个篮板。尼科尔森的身高同为6英尺9英寸，上赛季他场均可以贡献7.8分3.4个篮板。</p>\r\n\r\n<p>武切维奇身高7英尺，上赛季他场均可以贡献13.1分11.9个篮板，身高6英尺9英寸的哈里斯上赛季场均可以贡献11分5.2个篮板和1.3个助攻。</p>",
 "addtime": "1382828652",
 "league": "1",
 "replyurl": "http://m.hupu.com/nba/news/1537411.html?utm_source=2&utm_medium=games&utm_content=nbanews&utm_campaign=games#top_reply",
 "light_comments": []
 },
 "is_login": 0
 }
 
 */

@interface DetailModel : BaseModel

@property(nonatomic,copy)NSString *nid;
@property(nonatomic,copy)NSString *lights;
@property(nonatomic,copy)NSString *replies;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *origin;
@property(nonatomic,copy)NSString *img;
@property(nonatomic,copy)NSString *img_m;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,strong)NSNumber *addtime;
@property(nonatomic,copy)NSString *replyurl;
@property(nonatomic,strong)NSArray *light_comments;

@end
