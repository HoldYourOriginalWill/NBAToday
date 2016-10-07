//
//  PerInfoView.h
//  今日NBA
//
//  Created by ios on 13-10-31.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoneScoreModel.h"

@interface PerInfoView : UIView

@property(nonatomic,strong)DoneScoreModel *doneScoreModel;

@property (strong, nonatomic) IBOutlet UIImageView *userImg;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *teamLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UIImageView *starImg;
@property (strong, nonatomic) IBOutlet UILabel *commScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *commCountLabel;
@property (strong, nonatomic) IBOutlet UIButton *mButton;

@end
