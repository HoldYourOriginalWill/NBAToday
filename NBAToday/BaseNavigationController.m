//
//  BaseNavigationController.m
//  爱看球
//
//  Created by ios on 13-10-22.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseNavigationController.h"
#import "PlayedTabBarController.h"
#import "MainTabBarController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

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
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"naviBg@2x.png"] forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary *attDic=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:20],NSFontAttributeName, nil];
    [self.navigationBar setTitleTextAttributes:attDic];
    self.view.backgroundColor=[UIColor clearColor];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
