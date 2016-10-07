//
//  VideoViewController.m
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "VideoViewController.h"
#import "LoadDataService.h"
#import "VideoModel.h"
#import "VideoCell.h"


#define  NBAGETVIDEO  @"nba/getVideo"

@interface VideoViewController()

@end

@implementation VideoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"NBA视频";
        _data=[[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.refreshDelegate=self;
    
    [self initButton];
    
    self.tableView.hidden=YES;
    
    [self showLoading:YES];
    
    [self loadMatchData];
    
    //下拉刷新
    
//    __weak VideoViewController *this=self;
//    
//    self.tableView.finishBlock=^{
//        
//        __strong VideoViewController *strongself=this;
//        
//        if (strongself.matchButton.selected) {
//            [strongself loadMatchData];
//        }else if (strongself.recommendButton.selected){
//            [strongself loadRecData];
//        }
//    };
    

}

   //下拉刷新
-(void)pullDown:(BaseTableView *)tableView{
    
    if (self.matchButton.selected) {
        [self loadMatchData];
    }else if (self.recommendButton.selected){
        [self loadRecData];
    }

}

//初始化按钮
-(void)initButton{
    
    [self.matchButton setBackgroundImage:[UIImage imageNamed:@"rakingButtonGray@2x.png"] forState:UIControlStateNormal];
    [self.matchButton setBackgroundImage:[UIImage imageNamed:@"rakingButtonRed@2x.png"] forState:UIControlStateSelected];
    [self.matchButton setTitle:@"比赛视频" forState:UIControlStateNormal];
    self.matchButton.selected=YES;
    self.matchButton.userInteractionEnabled=NO;
    
    [self.recommendButton setBackgroundImage:[UIImage imageNamed:@"rakingButtonGray@2x.png"] forState:UIControlStateNormal];
    [self.recommendButton setBackgroundImage:[UIImage imageNamed:@"rakingButtonRed@2x.png"] forState:UIControlStateSelected];
    [self.recommendButton setTitle:@"推荐视频" forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    

}

//比赛视频按钮
- (IBAction)matchVButton:(UIButton *)button{
    
    self.recommendButton.userInteractionEnabled=YES;
    self.recommendButton.selected=!self.recommendButton.selected;
    button.selected=!button.selected;
    if (button.selected) {
        button.userInteractionEnabled=NO;
    }
    
    [self loadMatchData];
    self.tableView.hidden=YES;
    [self showLoading:YES];

    
}

//推荐视频按钮
- (IBAction)recommendVButon:(UIButton *)button{
    
    self.matchButton.userInteractionEnabled=YES;
    self.matchButton.selected=!self.matchButton.selected;
    
    button.selected=!button.selected;
    if (button.selected) {
        button.userInteractionEnabled=NO;
    }
    
    [self loadRecData];
    self.tableView.hidden=YES;
    [self showLoading:YES];
    
}

#pragma mark - 加载比赛视频
-(void)loadMatchData{
    
    NSString *num=@"20";
    NSString *vid=@"0";
    
    NSMutableDictionary *params=[NSMutableDictionary dictionaryWithObjectsAndKeys:Client,@"client",@"game",@"type",num,@"num",vid,@"vid", nil];
    
    __weak VideoViewController *this=self;
    
    [LoadDataService requestWithURL:NBAGETVIDEO params:params httpMethod:@"GET" block:^(id result) {
        
        __strong VideoViewController *strongSelf=this;
        
        [strongSelf afterLoadData:result];
        
    }];
    
}

#pragma mark - 加载推荐视频

-(void)loadRecData{
   
    NSString *num=@"20";
    NSString *vid=@"0";
    NSMutableDictionary *params=[NSMutableDictionary dictionaryWithObjectsAndKeys:Client,@"client",@"rec",@"type",num,@"num",vid,@"vid",nil];
    
    __weak VideoViewController *this=self;
    [LoadDataService requestWithURL:NBAGETVIDEO params:params httpMethod:@"GET" block:^(id result) {
        __strong VideoViewController *strongSelf=this;
        [strongSelf afterLoadData:result];
    }];
   
}

-(void)afterLoadData:(NSDictionary *)result{
    
    NSArray *tabsDic=[[result objectForKey:@"result"] objectForKey:@"tabs"];
    
    NSDictionary *gameDic=[tabsDic objectAtIndex:0];
    NSDictionary *recDic=[tabsDic objectAtIndex:1];
    
    if ([gameDic objectForKey:@"on"]) {
        NSArray *resultData=[[result objectForKey:@"result"] objectForKey:@"data"];
        
        if (resultData.count==0) {
            return;
        }
        
        [self.data removeAllObjects];
        
        for (NSDictionary *gameDic in resultData) {
            
            VideoModel *game=[[VideoModel alloc] initWithDataDic:gameDic];
            [self.data addObject:game];
            
        }
        self.tableView.data=self.data;
        [self.tableView reloadData];
        self.tableView.hidden=NO;
        [self showLoading:NO];
        
        [self.tableView doneLoadingTableViewData];

    }
    
    if ([recDic objectForKey:@"on"]) {
        
        NSArray *resultData=[[result objectForKey:@"result"] objectForKey:@"data"];
        
        if (resultData.count==0) {
            return;
        }
        
        [self.data removeAllObjects];
        
        for (NSDictionary *gameDic in resultData) {
            
            VideoModel *game=[[VideoModel alloc] initWithDataDic:gameDic];
            [self.data addObject:game];
            
        }
        
        self.tableView.data=self.data;
        [self.tableView reloadData];
        self.tableView.hidden=NO;
        [self showLoading:NO];

        [self.tableView doneLoadingTableViewData];

    }
    
}

#pragma mark - 加载更多视频

-(void)loadMoreData{
    
    VideoModel *video=[self.tableView.data lastObject];
    NSString *vid=video.vid;
    NSString *num=@"20";
    
    NSString *type=nil;
    
    if (self.matchButton.selected) {
        type=@"game";
    }else{
        type=@"rec";
    }
    
    NSMutableDictionary *params=[NSMutableDictionary dictionaryWithObjectsAndKeys:Client,@"client",type,@"type",vid,@"vid",num,@"num", nil];
    
    __weak VideoViewController *this=self;
    
    [LoadDataService requestWithURL:NBAGETVIDEO params:params httpMethod:@"GET" block:^(id result) {
        
        __strong VideoViewController *strongSelf=this;
        
        [strongSelf afterMoreLoadData:result];
        
    }];
    
}

-(void)afterMoreLoadData:(NSDictionary *)result{
    
    NSArray *tabsDic=[[result objectForKey:@"result"] objectForKey:@"tabs"];
    
    NSDictionary *gameDic=[tabsDic objectAtIndex:0];
    NSDictionary *recDic=[tabsDic objectAtIndex:1];
    
   // NSMutableArray *array=[NSMutableArray array];
    
    if ([gameDic objectForKey:@"on"]) {
        NSArray *resultData=[[result objectForKey:@"result"] objectForKey:@"data"];
        
        if (resultData.count==0) {
            return;
        }
        
       // [self.data removeAllObjects];
        
        for (NSDictionary *gameDic in resultData) {
            
            VideoModel *game=[[VideoModel alloc] initWithDataDic:gameDic];
            [self.data addObject:game];
            
        }
        self.tableView.data=self.data;
        [self.tableView reloadData];
    }
    
    if ([recDic objectForKey:@"on"]) {
        
        NSArray *resultData=[[result objectForKey:@"result"] objectForKey:@"data"];
        
        if (resultData.count==0) {
            return;
        }
        
      //  [self.data removeAllObjects];
        
        for (NSDictionary *gameDic in resultData) {
            
            VideoModel *game=[[VideoModel alloc] initWithDataDic:gameDic];
            [self.data addObject:game];
            
        }
        
        self.tableView.data=self.data;
        [self.tableView reloadData];
        
    }
}

//上拉加载数据

-(void)pullUp:(BaseTableView *)tableView{
    
    [self loadMoreData];
   
}


@end
