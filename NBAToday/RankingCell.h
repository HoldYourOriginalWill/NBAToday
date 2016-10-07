//
//  RankingCell.h
//  今日NBA
//
//  Created by ios on 13-10-25.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "RankingModel.h"

@interface RankingCell : BaseTableViewCell

@property(nonatomic,strong)RankingModel *rankingModel;

@property (strong, nonatomic) IBOutlet UIImageView *rankingCellbg;
@property (strong, nonatomic) IBOutlet UILabel *rankLabel;
@property (strong, nonatomic) IBOutlet UILabel *tNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *sucCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *faiCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *difLabel;
@property (strong, nonatomic) IBOutlet UILabel *currentLabel;


@end
