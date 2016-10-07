//
//  DetailNewsViewController.m
//  今日NBA
//
//  Created by ios on 13-10-28.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "DetailNewsViewController.h"
#import "LoadDataService.h"
#import "DetailModel.h"
#import "CommentModel.h"
#import "LightView.h"
#import "CommenCell.h"
#import "NewsDetailTableView.h"


#define GETNEWSDETAIL @"nba/getNewsDetail"


@interface DetailNewsViewController ()

@end

@implementation DetailNewsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData];
}

#pragma mark - 请求新闻详细数据

-(void)loadData{
    
    NSString *nid=self.newsId;
    
    NSMutableDictionary *params=[NSMutableDictionary dictionaryWithObjectsAndKeys:Client,@"client",nid,@"nid", nil];
    
    __strong DetailNewsViewController *this=self;
    
    [LoadDataService requestWithURL:GETNEWSDETAIL params:params httpMethod:@"GET" block:^(id result) {
        
        __weak DetailNewsViewController *strongself=this;
        
        [strongself afterLoadData:result];
    }];
    
}

-(void)afterLoadData:(NSDictionary *)result{
    
    NSDictionary *responseData=[result objectForKey:@"result"];
    if (responseData==nil) {
        return;
    }
    
    DetailModel *detail=[[DetailModel alloc] initWithDataDic:responseData];
    
    if (detail==nil) {
        return;
    }
    
    self.tableView.detailModel=detail;
    [self.tableView reloadData];
}


#warning tableView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.tableView.commentData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identify=@"cellid";
    CommenCell *cell=[tableView dequeueReusableCellWithIdentifier:identify];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"CommenCell" owner:nil options:nil] lastObject];
    }
    cell.commentModel=[self.tableView.commentData objectAtIndex:indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CommentModel *commentModel=[self.tableView.commentData objectAtIndex:indexPath.row];
    float heigth=[CommenCell getCommenCellHeight:commentModel];
    
    return heigth;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
