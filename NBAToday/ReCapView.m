//
//  ReCapView.m
//  今日NBA
//
//  Created by ios on 13-10-30.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "ReCapView.h"

@implementation ReCapView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self initView];
    
}

-(void)initView{
    
    _titleLabel=[[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.backgroundColor=[UIColor blackColor];
    _titleLabel.textColor=[UIColor whiteColor];
    _titleLabel.font=[UIFont boldSystemFontOfSize:17];
    _titleLabel.textAlignment=NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
    
    _webView=[[UIWebView alloc] initWithFrame:CGRectZero];
    [self addSubview:_webView];
}

-(void)setRecapModel:(RecapModel *)recapModel{
    
    if (_recapModel!=recapModel) {
        _recapModel=recapModel;
        
        [_webView loadHTMLString:self.recapModel.content baseURL:Nil];

    }
    
    [self setNeedsLayout];
}


-(void)layoutSubviews{
    
    _titleLabel.frame=CGRectMake(0, 0, kScreenWidth, 40);
    
    _titleLabel.text=self.recapModel.title;
    
    _webView.frame=CGRectMake(0,_titleLabel.bottom, kScreenWidth, kScreenHeight-64-49-_titleLabel.height);
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [webView sizeToFit];
}


@end
