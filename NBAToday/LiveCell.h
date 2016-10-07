//
//  LiveCell.h
//  今日NBA
//
//  Created by ios on 13-11-4.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "LiveModel.h"

@interface LiveCell : BaseTableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *backImg;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *separateLabel;
@property (strong, nonatomic) IBOutlet UILabel *boottomLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;

@property(nonatomic,strong)LiveModel *liveModel;

+(float)getLiveCellHeight:(LiveModel *)liveModel;

@end
