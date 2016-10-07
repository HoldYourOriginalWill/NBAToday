//
//  RankingCell.m
//  今日NBA
//
//  Created by ios on 13-10-25.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "RankingCell.h"

@implementation RankingCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    
}

-(void)setRankingModel:(RankingModel *)rankingModel{
    
    _rankingModel=rankingModel;
    
    [self setNeedsLayout];
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.tNameLabel.text=self.rankingModel.name;
    self.sucCountLabel.text=self.rankingModel.win;
    self.faiCountLabel.text=self.rankingModel.lost;
    NSString *difstring=[NSString stringWithFormat:@"%d",[self.rankingModel.gb intValue]];
    self.difLabel.text=difstring;
    self.currentLabel.text=self.rankingModel.strk;
    
}



@end
