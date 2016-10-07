//
//  NewsCell.m
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "NewsCell.h"
#import "UIImageView+WebCache.h"

@implementation NewsCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initViews];
    }
    return self;
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self initViews];
    
}

-(void)initViews{
    
    _titleLabel=[[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.backgroundColor=[UIColor clearColor];
    _titleLabel.textColor=[UIColor blackColor];
    _titleLabel.font=[UIFont boldSystemFontOfSize:14.0];
    _titleLabel.numberOfLines=2;
    [self.contentView addSubview:_titleLabel];
    
    _contentLabel=[[UILabel alloc] initWithFrame:CGRectZero];
    _contentLabel.backgroundColor=[UIColor clearColor];
    _contentLabel.textColor=[UIColor grayColor];
    _contentLabel.font=[UIFont systemFontOfSize:12.0];
    _contentLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_contentLabel];

    
}

-(void)setNewsModel:(NewsModel *)newsModel{
    
    _newsModel=newsModel;
    
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.replyCount.text=self.newsModel.replies;
    
    [self.newsImg setImageWithURL:[NSURL URLWithString:self.newsModel.img]];
    
    _titleLabel.frame=CGRectMake(self.newsImg.right+10, self.newsImg.top, kScreenWidth-10-self.newsImg.right-10, 0);
    NSString *title=self.newsModel.title;
    _titleLabel.text=title;
    [_titleLabel sizeToFit];

    _contentLabel.frame=CGRectMake(_titleLabel.left, _titleLabel.bottom, _titleLabel.width, 20);
    NSString *content=self.newsModel.summary;
    _contentLabel.text=content;
   
}



@end
