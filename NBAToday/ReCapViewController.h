//
//  ReCapViewController.h
//  今日NBA
//
//  Created by ios on 13-10-30.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseViewController.h"
@class ReCapView;

@interface ReCapViewController : BaseViewController
    
@property (strong, nonatomic) IBOutlet ReCapView *reCapView;


@property(nonatomic,copy)NSString *gid;

@end
