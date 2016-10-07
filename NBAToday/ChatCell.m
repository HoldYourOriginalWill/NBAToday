//
//  ChatCell.m
//  今日NBA
//
//  Created by ios on 13-11-4.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "ChatCell.h"

@implementation ChatCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)initView{
    
    self.backgroundColor=[UIColor clearColor];
    
    _contentLabel=[[UILabel alloc] initWithFrame:CGRectZero];
    _contentLabel.textColor=[UIColor whiteColor];
    _contentLabel.layer.cornerRadius=5;
    _contentLabel.backgroundColor=[UIColor blackColor];
    _contentLabel.textAlignment=NSTextAlignmentLeft;
    _contentLabel.font=[UIFont systemFontOfSize:13];
    [self.contentView addSubview:_contentLabel];
    
    _nameLabel=[[UILabel alloc] init];
    _nameLabel.textColor=[UIColor darkGrayColor];
    _nameLabel.textAlignment=NSTextAlignmentRight;
    _nameLabel.backgroundColor=[UIColor clearColor];
    _nameLabel.font=[UIFont systemFontOfSize:12];
    [self.contentView addSubview:_nameLabel];
    
}

-(void)setChatModel:(ChatModel *)chatModel{
    if (_chatModel!=chatModel) {
        _chatModel=chatModel;
    }
    
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    
}

@end
