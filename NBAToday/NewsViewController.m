//
//  NewsViewController.m
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsCell.h"
#import "NewsModel.h"
#import "LoadDataService.h"
#import "DetailNewsViewController.h"
#import "DetailModel.h"
#import "MMDrawerController.h"
#import "UIViewController+MMDrawerController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      self.title=@"NBA新闻";
      _data=[[NSMutableArray alloc] init];
      //self.hidesBottomBarWhenPushed=YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self showLoading:YES];
    self.tableView.hidden=YES;
    [self loadData];
}

//1.视图将要出现，开启左右菜单手势
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //开启左右菜单手势
    MMDrawerController *mmCtrl = self.mm_drawerController;
    [mmCtrl setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [mmCtrl setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
}

//2.视图将要消失，关闭左右菜单手势
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //关闭左右菜单手势
    MMDrawerController *mmCtrl = self.mm_drawerController;
    [mmCtrl setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    [mmCtrl setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeNone];
    
}


-(void)loadData{
    
     NSString *urlstring=@"nba/getNews";
    
     NSMutableDictionary *params=[NSMutableDictionary dictionaryWithObjectsAndKeys:Client,@"client", nil];
    
    __weak NewsViewController *this=self;
    
    [LoadDataService requestWithURL:urlstring params:params httpMethod:@"GET" block:^(id result) {
        
        __strong NewsViewController *strongSelf=this;
        
        [strongSelf afterLoadData:result];
        
    }];
    
}

-(void)afterLoadData:(NSDictionary *)result{
    
    NSArray *newsArray=[[result objectForKey:@"result"] objectForKey:@"data"];
    if (newsArray.count==0) {
        return;
    }
    
    for (NSDictionary *newsDic in newsArray) {
        NewsModel *newsModel=[[NewsModel alloc] initWithDataDic:newsDic];
        [self.data addObject:newsModel];
    }
    
   // self.tableView.data=self.data;
    [self.tableView reloadData];
    [self showLoading:NO];
    self.tableView.hidden=NO;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identify=@"cellid";
    NewsCell *cell=[tableView dequeueReusableCellWithIdentifier:identify];
    if (cell==Nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:nil options:nil] lastObject];
    }
    
    cell.newsModel=[self.data objectAtIndex:indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailModel *deatil=[self.data objectAtIndex:indexPath.row];
    
    DetailNewsViewController *detailCon=[[DetailNewsViewController alloc] init];
    
    detailCon.newsId=deatil.nid;
    
    [self.navigationController  pushViewController:detailCon animated:YES];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
