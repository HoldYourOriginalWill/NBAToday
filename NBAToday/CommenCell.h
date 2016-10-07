//
//  CommenCell.h
//  今日NBA
//
//  Created by ios on 13-10-28.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "CommentModel.h"

@interface CommenCell : BaseTableViewCell

@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *createTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *lightCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UIImageView *separateImg;

@property(strong,nonatomic)CommentModel *commentModel;

+(float)getCommenCellHeight:(CommentModel *)commentModel;

@end
