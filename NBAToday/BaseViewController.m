//
//  BaseViewController.m
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseViewController.h"
#import "PlayedTabBarController.h"
#import "MainTabBarController.h"
#import "MMDrawerController.h"
#import "LeftViewController.h"
#import "MMExampleDrawerVisualStateManager.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed=YES;
        self.isBackButton=YES;
        self.isModelButton=NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor=[UIColor clearColor];
    
    int count=self.navigationController.viewControllers.count;
    if ((self.isBackButton&&count>1) || self.isModelButton ) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(0,(44-30)/2, 50, 30);
        UIImage *image=[UIImage imageNamed:@"naviBack@2x.png"];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont boldSystemFontOfSize:13.0];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [button addTarget:self action:@selector(backPreViewControllerButton:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem=item;

    }
    
    if ([self.tabBarController isKindOfClass:[PlayedTabBarController class]]) {
        
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(0, 0,50, 30);
        UIImage *image=[UIImage imageNamed:@"naviBack@2x.png"];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont boldSystemFontOfSize:13.0];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        //[button setImage:image forState:UIControlStateNormal];
        [button addTarget:self action:@selector(backButton:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem=item;
        
    }

}

-(void)backPreViewControllerButton:(UIButton *)button{
    
    
    if (self.isModelButton) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

-(void)backButton:(UIButton *)button{
    
    MainTabBarController *mainTab=[[MainTabBarController alloc] init];
    
    //发微博窗口关闭之后，关闭右侧控制器
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    if ([keyWindow.rootViewController isKindOfClass:[MMDrawerController class]]) {
        MMDrawerController *mmDrawer = (MMDrawerController *)keyWindow.rootViewController;
        mmDrawer.centerViewController=mainTab;
    }

}

//自定义加载提示
-(void)showLoading:(BOOL)show{
    
    if (_tipView==nil) {
        _tipView=[[UIView alloc] initWithFrame:CGRectMake(0, (kScreenHeight-64-49-40)/2, kScreenWidth, 40)];
        _tipView.backgroundColor=[UIColor clearColor];
        
        UIActivityIndicatorView *activityView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [activityView startAnimating];
        [_tipView addSubview:activityView];
        
        UILabel *loadLabel=[[UILabel alloc] initWithFrame:CGRectZero];
        loadLabel.backgroundColor=[UIColor clearColor];
        loadLabel.text=@"正在加载****";
        loadLabel.font=[UIFont boldSystemFontOfSize:25.0f];
        loadLabel.textColor=[UIColor blackColor];
        [loadLabel sizeToFit];
        [_tipView addSubview:loadLabel];
    
        loadLabel.left=(kScreenWidth-loadLabel.width)/2;
        activityView.right=loadLabel.left-5;
    }
    if (show) {
        [self.view addSubview:_tipView];
    }else{
        if (_tipView.superview) {
            [_tipView removeFromSuperview];
        }
    }
}

//显示提示
-(void)showHUD:(NSString *)title{
    if (_hud==nil) {
        _hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    _hud.labelText=title;
    _hud.dimBackground=YES;
}

-(void)showWindowHUD:(NSString *)title{
    
    if (_hud==nil) {
        _hud=[MBProgressHUD showHUDAddedTo:self.view.window animated:YES];
    }
    _hud.labelText=title;
    _hud.dimBackground=YES;
}

//隐藏显示
-(void)hideHUD{
    
    [self.hud hide:YES];
}

//隐藏之前显示操作完成的提示
-(void)hideHUDWithComplete:(NSString *)title{
    
    self.hud.customView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    self.hud.mode=MBProgressHUDModeCustomView;
    self.hud.labelText=title;
    
    //延迟隐藏
    [self.hud hide:YES afterDelay:1.5];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
