//
//  CommScoreCell.h
//  今日NBA
//
//  Created by ios on 13-10-30.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "DoneScoreModel.h"
#import "PerInfoView.h"

@interface CommScoreCell : BaseTableViewCell{
    
    PerInfoView *_perInfoView;
    UIImageView *_backImg;
}

@property(nonatomic,strong)DoneScoreModel *doneScoreModel;

@end
