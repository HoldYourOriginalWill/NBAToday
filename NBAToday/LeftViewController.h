//
//  LeftViewController.h
//  今日NBA
//
//  Created by ios on 13-11-5.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseViewController.h"

@interface LeftViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
