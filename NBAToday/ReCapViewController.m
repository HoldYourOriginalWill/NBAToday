//
//  ReCapViewController.m
//  今日NBA
//
//  Created by ios on 13-10-30.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "ReCapViewController.h"
#import "ReCapView.h"
#import "RecapModel.h"
#import "PlayedTabBarController.h"

#define GETRECAP @"nba/getRecap"

@interface ReCapViewController ()

@end

@implementation ReCapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"NBA战报";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadData];
    
}

-(void)loadData{
    
    NSString *gid=self.gameModel.gid;
    
    NSString *vertical=@"ture";
    
    NSMutableDictionary *parmas=[NSMutableDictionary dictionaryWithObjectsAndKeys:Client,@"client",gid,@"gid",vertical,@"vertical", nil];
    
    __weak ReCapViewController *this=self;
    
    [LoadDataService requestWithURL:GETRECAP params:parmas httpMethod:@"GET" block:^(id result) {
        __strong ReCapViewController *strongself=this;
        [strongself afterLoadData:result];
    }];
    
    
}

-(void)afterLoadData:(NSDictionary *)result{
    
    NSDictionary *respondDic=[result objectForKey:@"result"];
    
    if (respondDic==nil) {
        return;
    }
    
    RecapModel *recapModel=[[RecapModel alloc] initWithDataDic:respondDic];
    self.reCapView.recapModel=recapModel;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
