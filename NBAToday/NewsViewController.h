//
//  NewsViewController.h
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseTableView.h"

@interface NewsViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property(strong,nonatomic)NSMutableArray *data;

@end
