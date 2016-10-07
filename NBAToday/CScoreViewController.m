//
//  CScoreViewController.m
//  今日NBA
//
//  Created by ios on 13-10-31.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "CScoreViewController.h"
#import "DoneScoreModel.h"

#define RATINGLIST  @"rating/list"
//http://games.mobileapi.hupu.com/1/4.0.0/rating/list?client=860310021927175&gid=23325&vertical=true&type=nba


@interface CScoreViewController ()

@end

@implementation CScoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"评分";
        _data=[[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.height-=49;
    
    [self loadData];
}

-(void)loadData{
    
    NSString *gid=self.gameModel.gid;
    NSString *vertical=@"ture";
    NSString *type=@"nba";
    
    NSMutableDictionary *parmas=[NSMutableDictionary dictionaryWithObjectsAndKeys:Client,@"client",gid,@"gid",vertical,@"vertical",type,@"type", nil];
    
    __weak CScoreViewController *this=self;
    [LoadDataService requestWithURL:RATINGLIST params:parmas httpMethod:@"GET" block:^(id result) {
        __strong CScoreViewController *strongself=this;
        
        [strongself afterLoadData:result];
    }];
    
}

-(void)afterLoadData:(NSDictionary *)result{
    
    NSArray *repontArray=[result objectForKey:@"result"];
    
    if (repontArray.count==0) {
        return;
    }
    
    for (NSDictionary *scoreComm in repontArray) {
        DoneScoreModel *doneScoreMo=[[DoneScoreModel alloc] initWithDataDic:scoreComm];
        [self.data addObject:doneScoreMo];
    }
    
    self.tableView.data=self.data;
    
    [self.tableView reloadData];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
