//
//  PlayedTabBarController.m
//  今日NBA
//
//  Created by ios on 13-10-26.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "PlayedTabBarController.h"
#import "ReCapViewController.h"
#import "BoxScoreViewController.h"
#import "CScoreViewController.h"
#import "LiveViewController.h"
#import "ChatViewController.h"
#import "BaseNavigationController.h"
#import "MainTabBarController.h"
#import "MMDrawerController.h"
#import "UIViewController+MMDrawerController.h"

@interface PlayedTabBarController ()<UINavigationControllerDelegate>

@end

@implementation PlayedTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	//[self initControllers];
    [self initTabBar];
    
}

//1.视图将要出现，开启左右菜单手势
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //开启左右菜单手势
    MMDrawerController *mmCtrl = self.mm_drawerController;
    [mmCtrl setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    [mmCtrl setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeNone];
    
}

//2.视图将要消失，关闭左右菜单手势
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //关闭左右菜单手势
    MMDrawerController *mmCtrl = self.mm_drawerController;
    [mmCtrl setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [mmCtrl setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
}




-(void)setGameModel:(GameModel *)gameModel{
    if (_gameModel!=gameModel) {
        _gameModel=gameModel;
    }
    
    [self initControllers];
}
-(void)initControllers{
    
    ReCapViewController *recap=[[ReCapViewController alloc] init];
    recap.gameModel=self.gameModel;
    BoxScoreViewController *boxScore=[[BoxScoreViewController alloc] init];
     boxScore.gameModel=self.gameModel;
    CScoreViewController *score=[[CScoreViewController alloc] init];
    score.gameModel=self.gameModel;
    LiveViewController *live=[[LiveViewController alloc] init];
     live.gameModel=self.gameModel;
    ChatViewController *chat=[[ChatViewController alloc] init];
     chat.gameModel=self.gameModel;
    
    NSArray *conArray=@[recap,boxScore,score,live,chat];
    
    NSMutableArray *naviArray=[NSMutableArray arrayWithCapacity:conArray.count];
    for (UIViewController *controller in conArray) {
        BaseNavigationController *naviController=[[BaseNavigationController alloc] initWithRootViewController:controller];
  
        naviController.delegate=self;
        //controller.hidesBottomBarWhenPushed=YES;
        [naviArray addObject:naviController];
    }
    
    self.viewControllers=naviArray;
    
}

-(void)initTabBar{
    
    
    self.tabBar.hidden=YES;
    
    _tabBarView=[[UIImageView alloc] initWithFrame:CGRectMake(0, kScreenHeight-49, kScreenWidth, 49)];
    _tabBarView.image=[UIImage imageNamed:@"tab_bg@2x.png"];
    _tabBarView.userInteractionEnabled=YES;
    [self.view addSubview:_tabBarView];
    
    float itemWidth=kScreenWidth/5;
    
    _selectView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, itemWidth, 49)];
    UIImage *selectImg=[UIImage imageNamed:@"tabbarActive@2x.png"];
    _selectView.image=selectImg;
    [_tabBarView addSubview:_selectView];
    
    _images=@[@"reCap@2x.png",
              @"boxScore@2x.png",
              @"score@2x.png",
              @"playByPlay@2x.png",
              @"chat@2x.png"];
    
    _himages=@[@"reCapHi@2x.png",
               @"boxScoreHi@2x.png",
               @"scoreHi@2x.png",
               @"playByPlayHi@2x.png",
               @"chatHi@2x.png"];
    
    for(int i=0;i<_images.count;i++){
        
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(i*itemWidth, 0, 64, 49);
        if (i==0) {
            NSString *himgName=_himages[i];
            UIImage *image=[UIImage imageNamed:himgName];
            [button setImage:image forState:UIControlStateNormal];
            button.userInteractionEnabled=NO;
            self.selectButton=button;
        }else{
            NSString *imgName=_images[i];
            UIImage *image=[UIImage imageNamed:imgName];
            [button setImage:image forState:UIControlStateNormal];
        }
        button.tag=i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [_tabBarView addSubview:button];
    }
    
}
-(void)buttonAction:(UIButton *)button{
    
    self.selectedIndex=button.tag;
    if (self.selectButton!=button) {
        self.selectButton.userInteractionEnabled=YES;
        UIImage *image=[UIImage imageNamed:[_images objectAtIndex:self.selectButton.tag]];
        [self.selectButton setImage:image forState:UIControlStateNormal];
    }else{
        
        return;
    }
    
    UIImage *hImage=[UIImage imageNamed:[_himages objectAtIndex:button.tag]];
    
    [UIView animateWithDuration:0.2 animations:^{
        
        [button setImage:hImage forState:UIControlStateNormal];
        _selectView.center=button.center;
        button.userInteractionEnabled=NO;
    }];
    
    self.selectButton=button;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//是否显示工具栏
- (void)hiddenTabbar:(BOOL)hidden {
    if (hidden) {
        
        [UIView animateWithDuration:0.2 animations:^{
            _tabBarView.left = -kScreenWidth;
            
        }];
    } else {
        
        [UIView animateWithDuration:0.25 animations:^{
            _tabBarView.left = 0;
            
        }];
    }
    
    self.tabBar.hidden = YES;
}


-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    int count=navigationController.viewControllers.count;
    if (count==1) {
        [self hiddenTabbar:NO];
    }else{
        [self hiddenTabbar:YES];
    }
}


@end
