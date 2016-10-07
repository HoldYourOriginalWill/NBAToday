//
//  ChatViewController.m
//  今日NBA
//
//  Created by ios on 13-11-4.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "ChatViewController.h"
#import "SendChatViewController.h"
#import "BaseNavigationController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"热线";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initView];
    
}

-(void)initView{
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, 61, 30);
    [button setTitle:@"发言" forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"red_button@2x.png"] forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:14];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem=item;
    
}

-(void)buttonAction:(UIButton *)button{
    
    SendChatViewController *sendChat=[[SendChatViewController alloc] init];
    sendChat.gameModel=self.gameModel;
    BaseNavigationController *navi=[[BaseNavigationController alloc] initWithRootViewController:sendChat];
    navi.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:navi animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
