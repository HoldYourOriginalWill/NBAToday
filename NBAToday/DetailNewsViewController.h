//
//  DetailNewsViewController.h
//  今日NBA
//
//  Created by ios on 13-10-28.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseViewController.h"
#import "NewsDetailTableView.h"

@interface DetailNewsViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet NewsDetailTableView *tableView;

@property(nonatomic,copy)NSString *newsId;

@end
