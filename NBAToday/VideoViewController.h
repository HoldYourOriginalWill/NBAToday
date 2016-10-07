//
//  VideoViewController.h
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseTableView.h"
#import "VideoTableIView.h"

@interface VideoViewController : BaseViewController<BaseTableViewDelegate>

@property(nonatomic,strong)NSMutableArray *data;

@property (strong, nonatomic) IBOutlet VideoTableIView *tableView;
@property (strong, nonatomic) IBOutlet UIButton *matchButton;
@property (strong, nonatomic) IBOutlet UIButton *recommendButton;


- (IBAction)matchVButton:(id)sender;
- (IBAction)recommendVButon:(id)sender;


@end
