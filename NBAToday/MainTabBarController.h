//
//  MainTabBarController.h
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTabBarController.h"

@interface MainTabBarController : BaseTabBarController<UINavigationControllerDelegate>{
    
    UIImageView *_tabbarView;
    UIImageView *_selectImgView;
    NSArray *_background;
    NSArray *_hbackground;
}

@property(nonatomic,strong)UIButton *selectButton;

@end
