//
//  RankingViewController.h
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseViewController.h"

@interface RankingViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
    
@property(nonatomic,assign)int seletedIndex;

@property(nonatomic,strong)NSMutableArray *wData;
@property(nonatomic,strong)NSMutableArray *eData;
@property(nonatomic,strong)NSArray *data;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIButton *westButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;

@end
