//
//  DetailCommentViewController.m
//  今日NBA
//
//  Created by ios on 13-11-4.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "DetailCommentViewController.h"
#import "DoneScoreModel.h"
#import "DetailCommentModel.h"

#define   RATINGDETAIL @"rating/detail"

@interface DetailCommentViewController ()

@end

@implementation DetailCommentViewController

static int i=1;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       self.title=@"评分";
        _commData=[[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.refreshDelegate=self;
    
    [self initView];
    
    [self loadData];
}

//自定义返回按钮
-(void)initView{
    
    UIButton *lbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    lbutton.frame=CGRectMake(0, 0, 50, 30);
    [lbutton setTitle:@"返回" forState:UIControlStateNormal];
    [lbutton setBackgroundImage:[UIImage imageNamed:@"naviBack@2x.png"] forState:UIControlStateNormal];
    [lbutton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    lbutton.tag=111;
    lbutton.titleLabel.font=[UIFont systemFontOfSize:14];
    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithCustomView:lbutton];
    self.navigationItem.leftBarButtonItem=item;

}

//返回上一控制器
-(void)buttonAction:(UIButton *)button{
    
    [self.navigationController popViewControllerAnimated:YES];
}

//请求数据
-(void)loadData{
    
    NSString *oid=self.doneScoreModel.oid;
    NSString *page=[NSString stringWithFormat:@"%d",1];
    
    NSMutableDictionary *parmas=[NSMutableDictionary dictionaryWithObjectsAndKeys:Client,@"client",page,@"page",TYPE,@"type",oid,@"oid", nil];
    
    __weak DetailCommentViewController *this=self;
    
    [LoadDataService requestWithURL:RATINGDETAIL params:parmas httpMethod:@"GET" block:^(id result) {
        
        __strong DetailCommentViewController *strongself=this;
        
        [strongself afterLoadData:result];
        
    }];
    
}

//请求完数据的处理方法
-(void)afterLoadData:(NSDictionary *)result{
    
    NSDictionary *responseData=[result objectForKey:@"result"];
    
    NSDictionary *dic=[responseData objectForKey:@"profile"];
    
    if (dic!=nil) {
        DoneScoreModel *donescor=[[DoneScoreModel alloc] initWithDataDic:dic];
        self.tableView.doneScore=donescor;
    }
    
    NSArray *data=[responseData objectForKey:@"data"];
    if (data.count==0) {
        return;
    }
    
    [self.commData removeAllObjects];
    for (NSDictionary *detailDic in data) {
        DetailCommentModel *detail=[[DetailCommentModel alloc] initWithDataDic:detailDic];
        [self.commData addObject:detail];
    }
    
    NSString *nextdataexites=[responseData objectForKey:@"nextDataExists"];
    if ([nextdataexites intValue]) {
        i++;
    }else{
        
        i=0;
        self.tableView.isMore=NO;
    }
    
    self.tableView.data=self.commData;
    [self.tableView reloadData];
    
    [self.tableView doneLoadingTableViewData];
}

-(void)pullDown:(BaseTableView *)tableView{
    
    [self loadData];
}

-(void)pullUp:(BaseTableView *)tableView{
    
    [self loadMoreData];
    
}

-(void)loadMoreData{
    
    if (i==0) {
        return;
    }
    
    NSString *oid=self.doneScoreModel.oid;
    NSString *page=[NSString stringWithFormat:@"%d",i];
    
    NSMutableDictionary *parmas=[NSMutableDictionary dictionaryWithObjectsAndKeys:Client,@"client",page,@"page",TYPE,@"type",oid,@"oid", nil];
    
    __weak DetailCommentViewController *this=self;
    
    [LoadDataService requestWithURL:RATINGDETAIL params:parmas httpMethod:@"GET" block:^(id result) {
        
        __strong DetailCommentViewController *strongself=this;
        
        [strongself afterLoadMoreData:result];
        
    }];
    
}

-(void)afterLoadMoreData:(NSDictionary *)result{
    
    NSDictionary *responseData=[result objectForKey:@"result"];
    
    NSDictionary *dic=[responseData objectForKey:@"profile"];
    
    if (dic!=nil) {
        DoneScoreModel *donescor=[[DoneScoreModel alloc] initWithDataDic:dic];
        self.tableView.doneScore=donescor;
    }
    
    NSArray *data=[responseData objectForKey:@"data"];
    if (data.count==0) {
        return;
    }
    
    for (NSDictionary *detailDic in data) {
        DetailCommentModel *detail=[[DetailCommentModel alloc] initWithDataDic:detailDic];
        [self.commData addObject:detail];
    }
    
    NSString *nextdataexites=[responseData objectForKey:@"nextDataExists"];
    if ([nextdataexites intValue]) {
        i++;
    }else{
        
        self.tableView.isMore=NO;
    }
    
    self.tableView.data=self.commData;
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
