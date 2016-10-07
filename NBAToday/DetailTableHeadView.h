//
//  DetailTableHeadView.h
//  今日NBA
//
//  Created by ios on 13-10-27.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsTitleView.h"
#import "DetailModel.h"

typedef void(^GetHeadHeight)(void);

@interface DetailTableHeadView : UIView<UIWebViewDelegate>{
    
    NewsTitleView *_titleView;
    UIImageView *_newsPicImg;
    UIWebView *_webView;
}

@property(nonatomic,copy)GetHeadHeight getHeadHeight;

@property(nonatomic,strong)DetailModel *detailModel;

+(float)getDetailHeadHeight:(DetailModel *)detailModel;

@end
