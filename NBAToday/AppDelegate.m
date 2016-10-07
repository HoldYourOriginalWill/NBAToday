//
//  AppDelegate.m
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "LeftViewController.h"
#import "MMDrawerController.h"
#import "MMExampleDrawerVisualStateManager.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor darkGrayColor];
    [self.window makeKeyAndVisible];
    
    [self loadMain];
    
    UIView *bgView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    bgView.backgroundColor=[UIColor lightGrayColor];
    [self.window addSubview:bgView];
    
    return YES;
}

-(void)loadMain{
    
    //创建控制器
    MainTabBarController *mainCtrl = [[MainTabBarController alloc] init];
    LeftViewController *leftCtrl = [[LeftViewController alloc] init];
    
    MMDrawerController *mmDrawer=[[MMDrawerController alloc] initWithCenterViewController:mainCtrl leftDrawerViewController:leftCtrl];
    
    //设置左右菜单的宽度
    [mmDrawer setMaximumLeftDrawerWidth:220.0f];
    
    //设置手势操作的区域
    [mmDrawer setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [mmDrawer setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    //配置管理动画的block
    [mmDrawer
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[MMExampleDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    
    //设置动画类型
    [MMExampleDrawerVisualStateManager sharedManager].leftDrawerAnimationType = MMDrawerAnimationTypeSlideAndScale;
    
    self.window.rootViewController=mmDrawer;

}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
