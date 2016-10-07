//
//  RecapModel.h
//  今日NBA
//
//  Created by ios on 13-10-30.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseModel.h"

/*
 {
 "result": {
 "content": "<meta name=\"format-detection\" content=\"telephone=no\" /><style>*{font:17px/1.5 \\9ed1\\4f53,\"Arial\",sans-serif;color:#000;background-color:#eee;text-indent:2em;text-align:justify;word-wrap:break-word}a{color:#005eac;text-decoration:none}strong{font-weight:bold}</style><div style=\"min-height:480px\"><p>经历无数日夜的漫长等待，NBA终于重燃战火，本赛季第一场常规赛由印第安纳步行者队坐镇主场迎来奥兰多魔术队的登门挑战。夏天经过补强的步行者开场就展现了强大的攻击力打出12-0高潮，不过魔术很快就追近-哈里斯脚踝受伤双双缺席比赛......步行者队大将丹尼-格兰杰因左小腿拉伤缺席了本场比赛......步行者将自己对阵魔术的队史战绩提升至45胜44负&hellip;&hellip;步行者在赛前升起了他们上赛季的中部赛区冠军旗帜。</p>\r\n<p><strong>赛后声音</strong></p>\r\n<p>&ldquo;我们必须具备打硬仗，打苦战的能力，同时我们也必须赢下那些我们应该拿下的比赛。我们得早一点进入状态，而不是等到赛季尾声再发力，再好好打球。我们必须早点进入状态。&rdquo;&mdash;&mdash;保罗-乔治。</p>\r\n<p>&ldquo;包括过去三场季前赛和今天的比赛，我们的替补阵容都扮演了打破僵局的角色。我相信他们还会打得更好的，今晚的他们就向我们发出了这样的信号。&rdquo;&mdash;&mdash;步行者主帅沃格尔。</p>\r\n<p>&ldquo;球馆气氛很棒，这里来了很多我的大学球迷。当然要是赢球了就更好了，不过总的来说还是很赞的。&rdquo;&mdash;&mdash;魔术新秀奥拉迪波对自己的NBA首秀如是评价，他的大学就是在印第安纳波利斯度过的。</p></div>",
 "title": "步行者主力凶猛夺下揭幕战"
 },
 "is_login": 0
 }
 */

@interface RecapModel : BaseModel

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *content;

@end
