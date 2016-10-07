//
//  GameViewController.m
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "GameViewController.h"
#import "TableHeadView.h"
#import "GameCell.h"
#import "GameModel.h"
#import "LoadDataService.h"
#import "PlayedTabBarController.h"
#import "MMDrawerController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title=@"NBA";
        //比赛结果
        _data=[[NSMutableArray alloc] init];
        //日期数组
        _dateArray=[[NSMutableArray alloc] init];
        //时间戳和日期字符串的映射字典
        _dateDictionary=[[NSMutableDictionary alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   // self.tableView.refreshHeader=NO;
    self.tableView.hidden=YES;
    [self showHUD:@"正在加载****"];
    [self loadTodayData];
    
}

#pragma mark - 初始化button上的显示
-(void)initButtonEvent{
    
    NSInteger index=[self.dateArray indexOfObject:self.today];
    NSNumber *tomorrow=[self.dateArray objectAtIndex:(index-1)];
    NSNumber *yestorday=[self.dateArray objectAtIndex:(index+1)];
    
    NSDate *today=[NSDate date];
    double todaytimein=[today timeIntervalSince1970];
    
    double tomoTime=[tomorrow doubleValue];
    double yesTime=[yestorday doubleValue];
    
    NSDateFormatter *formatter=[self formatteDate];
    
    NSDate *tomDdate=[NSDate dateWithTimeIntervalSince1970:tomoTime];
    NSString *tomo=[formatter stringFromDate:tomDdate];
    
    NSDate *yesDate=[NSDate dateWithTimeIntervalSince1970:yesTime];
    NSString *yes=[formatter stringFromDate:yesDate];
    
    
    [self.todayButton setTitle:@"今日" forState:UIControlStateNormal];
    
    [self.yestordayButton setTitle:yes forState:UIControlStateNormal];
    [self.tomorrowButton setTitle:tomo forState:UIControlStateNormal];
}

#pragma mark - 格式化日期函数
-(NSDateFormatter *)formatteDate{
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    NSLocale *local=[NSLocale currentLocale];
    [formatter setLocale:local];
    NSString *format=[NSString stringWithFormat:@"M月d日"];
    [formatter setDateFormat:format];

    return formatter;
}

#pragma mark - 请求今天的赛程数据
-(void)loadTodayData{
    
    NSString *urlstring=@"nba/getGames";
    NSMutableDictionary *params=[NSMutableDictionary dictionaryWithObjectsAndKeys:Client,@"client", nil];
    
    __weak GameViewController *this=self;
    
    [LoadDataService requestWithURL:urlstring params:params httpMethod:@"GET" block:^(id result) {
        
        __strong GameViewController *strongSelf=this;
        
        [strongSelf afterLoadData:result];
        
    }];
    
}

#pragma mark - 请求非今天的赛程数据
-(void)loadOtherDayData:(NSNumber *)timeinterval{
    
    NSString *urlstring=@"nba/getGames";
    
    NSString *datestring=[NSString stringWithFormat:@"%.0lf",[timeinterval doubleValue]];
    
    NSMutableDictionary *params=[NSMutableDictionary dictionaryWithObjectsAndKeys:Client,@"client",datestring,@"date",nil];
    
    __weak GameViewController *this=self;
    
    [LoadDataService requestWithURL:urlstring params:params httpMethod:@"GET" block:^(id result) {
        
        __strong GameViewController *strongSelf=this;
        
        [strongSelf afterLoadOtherDayData:result];
        
    }];

}

-(void)loadNextPrevData:(NSNumber *)timeinterval direc:(NSString *)direc{
    
    NSString *urlstring=@"nba/getGames";
    
    NSString *datestring=[NSString stringWithFormat:@"%.0lf",[timeinterval doubleValue]];
    
    NSMutableDictionary *params=[NSMutableDictionary dictionaryWithObjectsAndKeys:Client,@"client",datestring,@"date",direc,@"direc", nil];
    __weak GameViewController *this=self;
    
    [LoadDataService requestWithURL:urlstring params:params httpMethod:@"GET" block:^(id result) {
        
        __strong GameViewController *strongSelf=this;
        
        [strongSelf afterLoadNextPrevDayData:result];
        
    }];
    
}

#pragma mark - 请求完今天的数据调用的方法
-(void)afterLoadData:(NSDictionary *)result{
    
    NSDictionary *responseData=[result objectForKey:@"result"];
    
    NSArray *resultData=[responseData objectForKey:@"this"];
    
    NSNumber *today=[responseData objectForKey:@"today"];
    if (today!=Nil) {
        [self.dateArray removeAllObjects];
        self.today=today;
        [self.dateArray addObject:today];
    }
    
    
    NSArray *prev=[responseData objectForKey:@"prev"];
    
    if (prev.count!=0) {
       
        for (NSNumber *time in prev) {
            [self.dateArray addObject:time];
        }
    }
    
    NSArray *next=[responseData objectForKey:@"next"];
    if (next.count!=0) {
        for (NSNumber *time in next) {
            [self.dateArray insertObject:time atIndex:0];
        }
    }
    
    if (resultData.count==0) {
        return;
    }
    
    for (NSDictionary *gameDic in resultData) {
        
        GameModel *game=[[GameModel alloc] initWithDataDic:gameDic];
        [self.data addObject:game];
        
    }
    
    
    [self initButtonEvent];
    
    [self formDateDictionary];
    
    [self.tableView reloadData];
    self.tableView.hidden=NO;
    [self hideHUD];
    
}

#pragma mark - 请求完其他天的赛程数据

-(void)afterLoadOtherDayData:(NSDictionary *)result{
    
    [self.data removeAllObjects];
    
    NSArray *responseData=[result objectForKey:@"result"];
    
    if (responseData.count==0) {
        return;
    }
    
    for (NSDictionary *gameDic in responseData) {
        
        GameModel *game=[[GameModel alloc] initWithDataDic:gameDic];
        [self.data addObject:game];
       
    }
    
    [self.tableView reloadData];
    
}

#pragma mark - 请求完next或pre数据之后的处理
-(void)afterLoadNextPrevDayData:(NSDictionary *)result{
    
    NSDictionary *responseData=[result objectForKey:@"result"];
    
    NSArray *resultData=[responseData objectForKey:@"this"];
    
    if (resultData.count==0) {
        return;
    }
    
    NSArray *prev=[responseData objectForKey:@"prev"];
    
    if (prev.count!=0) {
        for (NSNumber *time in prev) {
            [self.dateArray addObject:time];
        }
        
        [self formDateDictionary];
        
    }
    
    NSArray *next=[responseData objectForKey:@"next"];
    
    if (next.count!=0) {
        for (NSNumber *time in next) {
            [self.dateArray insertObject:time atIndex:0];
        }
        
        [self formDateDictionary];
    }
}


#pragma mark - 建立时间戳和字符串日期的映射字典
-(void)formDateDictionary{
    
    [self.dateDictionary removeAllObjects];
    
    NSDateFormatter *formatter=[self formatteDate];
    
    for (NSNumber *timeNum in self.dateArray) {
        
        if ([timeNum doubleValue] == [self.today doubleValue]) {
            [self.dateDictionary setObject:timeNum forKey:@"今日"];
        }else{
            double timeinterval=[timeNum doubleValue];
            NSDate *date=[NSDate dateWithTimeIntervalSince1970:timeinterval];
            NSString *dateString=[formatter stringFromDate:date];
            
            [self.dateDictionary setObject:timeNum forKey:dateString];
        }
    }
    
}

#pragma mark - UItableView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.data.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identify=@"cellid";
    GameCell *cell=[tableView dequeueReusableCellWithIdentifier:identify];
    if (cell==Nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"GameCell" owner:Nil options:nil] lastObject];
    }
    
    cell.game=[self.data objectAtIndex:indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 76.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GameModel *game=[self.data objectAtIndex:indexPath.row];
    
    PlayedTabBarController *played=[[PlayedTabBarController alloc] init];
    played.gameModel=game;
    
    //发微博窗口关闭之后，关闭右侧控制器
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    if ([keyWindow.rootViewController isKindOfClass:[MMDrawerController class]]) {
        MMDrawerController *mmDrawer = (MMDrawerController *)keyWindow.rootViewController;
        mmDrawer.centerViewController=played;
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 获得前一天的比赛结果
- (IBAction)yestButton:(UIButton *)button{
    
    NSString *title=button.currentTitle;
    NSNumber  *yesNum=[self.dateDictionary objectForKey:title];
    NSInteger index=[self.dateArray indexOfObject:yesNum];

    if ((index+2)==self.dateArray.count) {
        
        [self loadNextPrevData:[self.dateDictionary objectForKey:title] direc:@"prev"];
    }
    
    [self.tomorrowButton setTitle:self.todayButton.currentTitle forState:UIControlStateNormal];

    [self.todayButton setTitle:title forState:UIControlStateNormal];
    
    NSNumber *yestNum=[self.dateArray objectAtIndex:(index+1)];
    
    NSString *yesstring=[[self.dateDictionary allKeysForObject:yestNum] lastObject];
    [button setTitle:yesstring forState:UIControlStateNormal];

    [self loadOtherDayData:[self.dateDictionary objectForKey:title]];

}

#pragma mark - 获得上一天的比赛结果
- (IBAction)tomoButton:(UIButton *)button{
    
    NSString *title=button.currentTitle;
    NSNumber *tomNum=[self.dateDictionary objectForKey:title];
    NSInteger index =[self.dateArray indexOfObject:tomNum];
    
    if ((index-1)==0) {
        
        NSNumber *timer=[self.dateArray objectAtIndex:0];
        [self loadNextPrevData:timer direc:@"next"];
    }
    
    [self.yestordayButton setTitle:self.todayButton.currentTitle forState:UIControlStateNormal];
    [self.todayButton setTitle:title forState:UIControlStateNormal];
   
  
    
    NSNumber *tomoNum=[self.dateArray objectAtIndex:(index-1)];
    
    NSString *tomoString=[[self.dateDictionary allKeysForObject:tomoNum] lastObject];
    [button setTitle:tomoString forState:UIControlStateNormal];
    
    [self loadOtherDayData:[self.dateDictionary objectForKey:title]];

}


@end
