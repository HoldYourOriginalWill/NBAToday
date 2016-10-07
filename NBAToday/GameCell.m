//
//  GameCell.m
//  爱看球
//
//  Created by ios on 13-10-23.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "GameCell.h"

@implementation GameCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.homeNameLabel.text=self.game.homeName;
    self.awayNameLabel.text=self.game.awayName;
    
    NSString *homeImageName=[NSString stringWithFormat:@"%@%@",self.game.homeTid,@"@2x.png"];
    UIImage *homeImage=[UIImage imageNamed:homeImageName];
    self.homeImg.image=homeImage;
    
    NSString *awayImageName=[NSString stringWithFormat:@"%@%@",self.game.awayTid,@"@2x.png"];
    UIImage *awayImage=[UIImage imageNamed:awayImageName];
    self.awayImg.image=awayImage;
    
    self.processLabel.text=self.game.process;
    //[self.processLabel sizeToFit];
    
    NSString *scores=[NSString stringWithFormat:@"%d-%d",[self.game.homeScore intValue] ,[self.game.awayScore intValue]];
    self.scoreLabel.text=scores;
    
}


@end
