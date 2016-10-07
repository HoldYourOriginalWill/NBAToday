//
//  MainTabBarController.m
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "MainTabBarController.h"
#import "GameViewController.h"
#import "NewsViewController.h"
#import "VideoViewController.h"
#import "RankingViewController.h"
#import "BaseNavigationController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

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
    
    //创建子控制器
    [self initWithControllers];
    
    //创建tabbar
    [self initTabBar];
   
    
}

-(void)initWithControllers{
    
    //创建三级控制器
    GameViewController *game=[[GameViewController alloc] init];
    NewsViewController *news=[[NewsViewController alloc] init];
    VideoViewController *vide=[[VideoViewController alloc] init];
    RankingViewController *ranking=[[RankingViewController alloc] init];
    
    //创建二级控制器
    NSArray *controllersArray=[NSArray arrayWithObjects:game,news,vide,ranking ,nil];
    NSMutableArray *naviArray=[NSMutableArray arrayWithCapacity:controllersArray.count];
    
    for (UIViewController *contrl in controllersArray) {
        BaseNavigationController *navi=[[BaseNavigationController alloc] initWithRootViewController:contrl];
        [naviArray addObject:navi];
        
        navi.delegate=self;
        contrl.hidesBottomBarWhenPushed=NO;
    }
    
    self.viewControllers=naviArray;
    
}

-(void)initTabBar{
    
    _tabbarView=[[UIImageView alloc] initWithFrame:CGRectMake(0,kScreenHeight-49, kScreenWidth, 49)];
    _tabbarView.image=[UIImage imageNamed:@"tab_bg@2x.png"];
    _tabbarView.userInteractionEnabled=YES;
    [self.view addSubview:_tabbarView];
    
    float itemWidth=kScreenWidth/4;
    
    _selectImgView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0,itemWidth, 49)];
    UIImage *selectImg=[UIImage imageNamed:@"tabbarActive@2x.png"];
     selectImg=[selectImg stretchableImageWithLeftCapWidth:32 topCapHeight:0];
    _selectImgView.image=selectImg;
    [_tabbarView addSubview:_selectImgView];
    
    _background=@[@"match@2x.png",
                          @"news@2x.png",
                          @"matchVideo@2x.png",
                          @"raking@2x.png"];
    
    _hbackground=@[@"matchHi@2x.png",
                           @"newsHi@2x.png",
                           @"matchVideoHi@2x.png",
                           @"rakingHi@2x.png"];
    
    for (int i=0; i<_background.count; i++) {
       
       
        
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake((itemWidth-64)/2+itemWidth*i, 0,64, 49);
        
        if (i==0) {
            NSString *himgName=_hbackground[i];
            UIImage *himage=[UIImage imageNamed:himgName];
            [button setImage:himage forState:UIControlStateNormal];
            button.userInteractionEnabled=NO;
            self.selectButton=button;
        }else{
            NSString *imgName=_background[i];
            UIImage *image=[UIImage imageNamed:imgName];
            [button setImage:image forState:UIControlStateNormal];
            
        }
        
        button.tag=i;
        [button addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        [_tabbarView addSubview:button];
    
    }
    
}

-(void)selectedTab:(UIButton *)button{
    
    self.selectedIndex=button.tag;
    
    if (self.selectButton!=button) {
        self.selectButton.userInteractionEnabled=YES;
        UIImage *image=[UIImage imageNamed:[_background objectAtIndex:self.selectButton.tag]];
        [self.selectButton setImage:image forState:UIControlStateNormal];
    }else{
        
        return;
    }
    
    UIImage *hImage=[UIImage imageNamed:[_hbackground objectAtIndex:button.tag]];
    
    [UIView animateWithDuration:0.2 animations:^{
        
        [button setImage:hImage forState:UIControlStateNormal];
        _selectImgView.center=button.center;
         button.userInteractionEnabled=NO;
    }];
    
    self.selectButton=button;
}

//是否显示工具栏
- (void)hiddenTabbar:(BOOL)hidden {
    if (hidden) {
        
        [UIView animateWithDuration:0.2 animations:^{
            _tabbarView.left = -kScreenWidth;

        }];
    } else {
        
        [UIView animateWithDuration:0.25 animations:^{
            _tabbarView.left = 0;
            
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
