//
//  DetailCommentViewController.h
//  今日NBA
//
//  Created by ios on 13-11-4.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseViewController.h"
#import "DetailTableView.h"
#import "DoneScoreModel.h"

@interface DetailCommentViewController : BaseViewController<BaseTableViewDelegate>

@property (strong, nonatomic) IBOutlet DetailTableView *tableView;
@property(nonatomic,strong)DoneScoreModel *doneScoreModel;
@property(nonatomic,strong)NSMutableArray *commData;

@end
