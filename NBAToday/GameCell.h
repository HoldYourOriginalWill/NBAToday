//
//  GameCell.h
//  爱看球
//
//  Created by ios on 13-10-23.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
#import "GameModel.h"

@interface GameCell : BaseTableViewCell

@property(nonatomic,strong)GameModel *game;

@property (strong, nonatomic) IBOutlet UILabel *homeNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *awayNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *homeImg;
@property (strong, nonatomic) IBOutlet UIImageView *awayImg;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *processLabel;

@end
