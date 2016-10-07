//
//  CScoreViewController.h
//  今日NBA
//
//  Created by ios on 13-10-31.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseViewController.h"
#import "CommTableView.h"

@interface CScoreViewController : BaseViewController

@property(nonatomic,strong)NSMutableArray *data;

@property (strong, nonatomic) IBOutlet CommTableView *tableView;


@end
