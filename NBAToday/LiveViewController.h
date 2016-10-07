//
//  LiveViewController.h
//  今日NBA
//
//  Created by ios on 13-11-4.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseViewController.h"
#import "TitleView.h"
#import "LiveTableView.h"

@interface LiveViewController : BaseViewController{
    
    TitleView *_titleView;
}

@property(nonatomic,strong)NSMutableArray *data;

@property (strong, nonatomic) IBOutlet LiveTableView *tableView;

@end
