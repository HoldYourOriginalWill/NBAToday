//
//  LiveViewController.m
//  今日NBA
//
//  Created by ios on 13-11-4.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "LiveViewController.h"
#import "LiveModel.h"

#define  PLAYBYPLAY  @"nba/getPlaybyplay"

@interface LiveViewController ()

@end

@implementation LiveViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _data=[[NSMutableArray alloc] init];
        
        self.title=@"直播";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   self.tableView.refreshHeader=NO;
    
    [self initView];
    
    [self loadData];
}

-(void)initView{
    
    _titleView=[[[NSBundle mainBundle] loadNibNamed:@"TitleView" owner:nil options:nil] lastObject];
    _titleView.frame=CGRectMake(0, 0, kScreenWidth, 62);
    
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 61, kScreenWidth, 1)];
    label.backgroundColor=[UIColor redColor];
    [_titleView addSubview:label];

    [self.view addSubview:_titleView];
    
    _titleView.gameModel=self.gameModel;

}

-(void)loadData{
    
    NSString *sort=@"asc";
    NSString *pid=@"0";
    NSString *gid=self.gameModel.gid;
    
    NSMutableDictionary *parmas=[NSMutableDictionary dictionaryWithObjectsAndKeys:Client,@"client",pid,@"pid",sort,@"sort",gid,@"gid",nil];
    
    __weak LiveViewController *this=self;
    
    [LoadDataService requestWithURL:PLAYBYPLAY params:parmas httpMethod:@"GET" block:^(id result) {
        
        __strong LiveViewController *strongself=this;
        
        [strongself afterLoadData:result];
        
    }];
    
}

-(void)afterLoadData:(NSDictionary *)result{
    
    NSDictionary *responseData=[result objectForKey:@"result"];
    NSArray *data=[responseData objectForKey:@"data"];
    if (data.count==0) {
        return;
    }
    
    [self.data removeAllObjects];
    
    for (NSDictionary *liveDic in data) {
        LiveModel *liveModel=[[LiveModel alloc] initWithDataDic:liveDic];
        [self.data addObject:liveModel];
    }
    
    self.tableView.data=self.data;
    
    [self.tableView reloadData];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

@end
