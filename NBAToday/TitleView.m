//
//  titleView.m
//  今日NBA
//
//  Created by ios on 13-10-30.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "titleView.h"
#import "GameModel.h"

@implementation TitleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
}

-(void)setGameModel:(GameModel *)gameModel{
    
    if (_gameModel!=gameModel) {
        _gameModel=gameModel;
    }
    
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    self.homeNameLabel.text=[NSString stringWithFormat:@"%@(主)",self.gameModel.homeName];
    self.awayNameLabel.text=[NSString stringWithFormat:@"%@(客)",self.gameModel.awayName];
    
    NSString *homeImageName=[NSString stringWithFormat:@"%@%@",self.gameModel.homeTid,@"@2x.png"];
    UIImage *homeImage=[UIImage imageNamed:homeImageName];
    self.homeImg.image=homeImage;
    
    NSString *awayImageName=[NSString stringWithFormat:@"%@%@",self.gameModel.awayTid,@"@2x.png"];
    UIImage *awayImage=[UIImage imageNamed:awayImageName];
    self.awayImg.image=awayImage;
    
    self.processLabel.text=self.gameModel.process;
    
    NSString *scores=[NSString stringWithFormat:@"%d-%d",[self.gameModel.homeScore intValue] ,[self.gameModel.awayScore intValue]];
    self.scoreLabel.text=scores;

}


@end
