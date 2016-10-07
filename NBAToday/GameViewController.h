//
//  GameViewController.h
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseTableView.h"

@interface GameViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic)NSMutableArray *data;
@property(nonatomic,strong)NSMutableArray *yesterdayData;
@property(nonatomic,strong)NSMutableArray *tomorowData;
@property(nonatomic,strong)NSNumber *today;
@property(nonatomic,strong)NSMutableDictionary *dateDictionary;

@property(nonatomic,strong)NSMutableArray *dateArray;

@property (strong, nonatomic) IBOutlet BaseTableView *tableView;
@property (strong, nonatomic) IBOutlet UIButton *yestordayButton;
@property (strong, nonatomic) IBOutlet UIButton *todayButton;
@property (strong, nonatomic) IBOutlet UIButton *tomorrowButton;
- (IBAction)yestButton:(id)sender;
- (IBAction)tomoButton:(id)sender;

@end
