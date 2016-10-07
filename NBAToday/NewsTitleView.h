//
//  NewsTitleView.h
//  今日NBA
//
//  Created by ios on 13-10-27.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailModel.h"

@interface NewsTitleView : UIView

@property (strong, nonatomic) IBOutlet UILabel *newsTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *originLabel;
@property (strong, nonatomic) IBOutlet UIImageView *separateImg;

@property(nonatomic,strong)DetailModel *detailModel;

@end
