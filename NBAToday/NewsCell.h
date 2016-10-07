//
//  NewsCell.h
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "NewsModel.h"

@interface NewsCell : BaseTableViewCell{
    
    UILabel *_titleLabel;
    UILabel *_contentLabel;
}

@property (strong, nonatomic) IBOutlet UIImageView *newsImg;
@property (strong, nonatomic) IBOutlet UILabel *replyCount;

@property(strong,nonatomic)NewsModel *newsModel;

@end
