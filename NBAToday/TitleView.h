//
//  titleView.h
//  今日NBA
//
//  Created by ios on 13-10-30.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameModel.h"

@interface TitleView : UIView

@property (strong, nonatomic) IBOutlet UIImageView *homeImg;
@property (strong, nonatomic) IBOutlet UIImageView *awayImg;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *homeNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *awayNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *processLabel;

@property(strong,nonatomic)GameModel *gameModel;


@end
