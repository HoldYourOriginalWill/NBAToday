//
//  ReCapView.h
//  今日NBA
//
//  Created by ios on 13-10-30.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecapModel.h"

@interface ReCapView : UIView{
    
   UILabel *_titleLabel;
    UIWebView *_webView;
}

@property(nonatomic,strong)RecapModel *recapModel;

@end
