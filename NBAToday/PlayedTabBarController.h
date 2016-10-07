//
//  PlayedTabBarController.h
//  今日NBA
//
//  Created by ios on 13-10-26.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseTabBarController.h"
#import "GameModel.h"

@interface PlayedTabBarController : BaseTabBarController<UINavigationControllerDelegate>{
    
    UIImageView *_tabBarView;
    UIImageView *_selectView;
    NSArray *_images;
    NSArray *_himages;
}

@property(nonatomic,strong)UIButton *selectButton;

@property(nonatomic,strong)GameModel *gameModel;

@property(nonatomic,copy)NSString *gid;

@end
