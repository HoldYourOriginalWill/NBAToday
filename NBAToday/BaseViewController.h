//
//  BaseViewController.h
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "LoadDataService.h"
#import "GameModel.h"

@interface BaseViewController : UIViewController{
    UIView *_tipView;
    //添加提示
    UIWindow *_tipWindow;
}

@property(nonatomic,assign)BOOL isBackButton;
@property(nonatomic,assign)BOOL isModelButton;
@property(nonatomic,readonly)MBProgressHUD *hud;

@property(nonatomic,strong)GameModel *gameModel;

//加载提示
- (void)showLoading:(BOOL)show;
//显示hud加载提示
- (void)showHUD:(NSString *)title;
- (void)showWindowHUD:(NSString *)title;
//两种隐藏hud的方式
- (void)hideHUD;  //直接隐藏
- (void)hideHUDWithComplete:(NSString *)title;  //隐藏之前显示操作完成的提示

@end
