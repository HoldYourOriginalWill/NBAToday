//
//  VideoCell.h
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "VideoModel.h"

@interface VideoCell : BaseTableViewCell

@property(nonatomic,strong)VideoModel *videoModel;

@property (strong, nonatomic) IBOutlet UIImageView *coverImg;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *playtimeLabel;

@end
