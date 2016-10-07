//
//  NewsDetailTableView.m
//  今日NBA
//
//  Created by ios on 13-10-28.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "NewsDetailTableView.h"
#import "CommenCell.h"

@implementation NewsDetailTableView


-(void)initHeadView{
    
    _detailHead.detailModel=self.detailModel;
    UIWebView *webView=(UIWebView *)[_detailHead viewWithTag:100];
    float h=[DetailTableHeadView getDetailHeadHeight:self.detailModel];
    _detailHead.frame=CGRectMake(0, 0, kScreenWidth, h+webView.height); 

    self.tableHeaderView=_detailHead;
}

-(void)setDetailModel:(DetailModel *)detailModel{
    
    if (_detailModel!=detailModel) {
        _detailModel=detailModel;
        
        NSArray *lightcomments=_detailModel.light_comments;
        
        if (_commentData==nil) {
            _commentData=[[NSMutableArray alloc] init];
        }
        for (NSDictionary *comment in lightcomments) {
            CommentModel *commentModel=[[CommentModel alloc] initWithDataDic:comment];
            [_commentData addObject:commentModel];
        }
        
        if (_detailHead==nil) {
            _detailHead=[[DetailTableHeadView alloc] initWithFrame:CGRectZero];
        }
        
        _detailHead.detailModel=self.detailModel;
        __weak NewsDetailTableView *this=self;
        _detailHead.getHeadHeight=^{
            
            __strong NewsDetailTableView *stongself=this;
            
            [stongself initHeadView];
        };

    }

    [self setNeedsLayout];

}

-(void)layoutSubviews{
    
    [super layoutSubviews];

    _detailHead.detailModel=self.detailModel;

}

@end
