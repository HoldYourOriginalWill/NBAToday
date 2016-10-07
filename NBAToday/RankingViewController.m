//
//  RankingViewController.m
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "RankingViewController.h"
#import "RankingModel.h"
#import "RankingCell.h"
#import "LoadDataService.h"

@interface RankingViewController ()

@end

@implementation RankingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"NBA排行";
        _eData=[[NSMutableArray alloc] init];
        _wData=[[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initButton];
    
    [self loadData];
}

-(void)initButton{
    
    [self.westButton setBackgroundImage:[UIImage imageNamed:@"rakingButtonGray@2x.png"] forState:UIControlStateNormal];
    [self.westButton setBackgroundImage:[UIImage imageNamed:@"rakingButtonRed@2x.png"] forState:UIControlStateSelected];
    [self.westButton setTitle:@"西部" forState:UIControlStateNormal];
    self.westButton.tag=10;
    self.seletedIndex=self.westButton.tag;
    self.westButton.selected=YES;
    self.westButton.userInteractionEnabled=NO;
    [self.westButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.eastButton setBackgroundImage:[UIImage imageNamed:@"rakingButtonGray@2x.png"] forState:UIControlStateNormal];
    [self.eastButton setBackgroundImage:[UIImage imageNamed:@"rakingButtonRed@2x.png"] forState:UIControlStateSelected];
    [self.eastButton setTitle:@"东部" forState:UIControlStateNormal];
    self.eastButton.tag=11;
    [self.eastButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonAction:(UIButton *)button{
    
    if (button.tag!=self.seletedIndex) {
        UIButton *lastbutton=(UIButton *)[self.view viewWithTag:self.seletedIndex];
        lastbutton.userInteractionEnabled=YES;
        button.selected=lastbutton.selected;
        button.userInteractionEnabled=NO;
        lastbutton.selected=!lastbutton.selected;
        
        self.seletedIndex=button.tag;
        
        if (button.tag==10) {
            self.data=self.wData;
        }else if(button.tag==11){
            self.data=self.eData;
        }
        [self.tableView reloadData];

    }
    
    
    
}

-(void)loadData{
    
    NSString *urlstring=@"nba/getStandings";
    
    NSMutableDictionary *params=[NSMutableDictionary dictionaryWithObjectsAndKeys:Client,@"client", nil];
    
    __weak RankingViewController *this=self;
    
    [LoadDataService requestWithURL:urlstring params:params httpMethod:@"GET" block:^(id result) {
        
        __strong RankingViewController *strongSelf=this;
        
        [strongSelf afterLoadData:result];
        
    }];

    
}

-(void)afterLoadData:(NSDictionary *)result{
    
    NSArray *eastArray=[[result objectForKey:@"result"] objectForKey:@"east"];
    NSArray *westArray=[[result objectForKey:@"result"] objectForKey:@"west"];
    
    if (eastArray.count==0&&westArray.count==0) {
        return;
    }
    
    for (NSDictionary *rankingDic in eastArray) {
        RankingModel *rankingModel=[[RankingModel alloc] initWithDataDic:rankingDic];
        [self.eData addObject:rankingModel];
    }
    
    for (NSDictionary *rankingDic in westArray) {
        RankingModel *rankingModel=[[RankingModel alloc] initWithDataDic:rankingDic];
        [self.wData addObject:rankingModel];
    }
    
    self.data=self.wData;
    [self.tableView reloadData];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identify=@"cellid";
    RankingCell *cell=[tableView dequeueReusableCellWithIdentifier:identify];
    if (cell==Nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"RankingCell" owner:nil options:nil] lastObject];
    }
    
    UILabel *label=(UILabel *)[cell viewWithTag:111];
    label.text=[NSString stringWithFormat:@"%d",indexPath.row];
    
    UIImageView *bgimg=(UIImageView *)[cell viewWithTag:112];
    if (indexPath.row<9) {
        
        UIImage *image=[UIImage imageNamed:@"rakingCellBg1@2x.png"];
        image= [image stretchableImageWithLeftCapWidth:10 topCapHeight:10];
        bgimg.image=image;
       
        
    }else{
        
        UIImage *image=[UIImage imageNamed:@"rakingCellBg2@2x.png"];
        image=[image stretchableImageWithLeftCapWidth:10 topCapHeight:10];
        bgimg.image=image;

    }
    
    cell.rankingModel=self.data[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 30.0;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

@end
