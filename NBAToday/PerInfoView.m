//
//  PerInfoView.m
//  今日NBA
//
//  Created by ios on 13-10-31.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "PerInfoView.h"
#import "UIImageView+WebCache.h"
#import "UIUtils.h"

@implementation PerInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        
    }
    return self;
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    self.backgroundColor=[UIColor clearColor];
}

-(void)setDoneScoreModel:(DoneScoreModel *)doneScoreModel{
    
    if (_doneScoreModel!=doneScoreModel) {
        _doneScoreModel=doneScoreModel;
    }
    
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.userImg.frame=CGRectMake(10, 16, 40, 50);
    [self.userImg setImageWithURL:[NSURL URLWithString:self.doneScoreModel.header_img]];
    
    UIFont *font=[UIFont systemFontOfSize:14];
    CGSize size1=CGSizeMake(100, 20);
    NSString *name=self.doneScoreModel.name;
    float w1=[name sizeWithFont:font constrainedToSize:size1].width;
    self.nameLabel.frame=CGRectMake(self.userImg.right+5, self.userImg.top+5, w1, 20);
    self.nameLabel.text=self.doneScoreModel.name;
    
    if (self.doneScoreModel.memo.length!=0) {
        NSString *memo=[NSString stringWithFormat:@"(%@)",self.doneScoreModel.memo];
        self.teamLabel.frame=CGRectMake(self.nameLabel.right, self.nameLabel.top, 100, 20);
        self.teamLabel.text=memo;
    }else{
        
        self.teamLabel.frame=CGRectZero;
    }
    
    self.contentLabel.frame=CGRectMake(self.nameLabel.left, self.nameLabel.bottom+5,kScreenWidth-75, 35);
    self.contentLabel.text=self.doneScoreModel.content;
    
    
    self.starImg.frame=CGRectMake(self.userImg.left, self.userImg.bottom+17, 20, 20);
    
    NSString *score=[NSString stringWithFormat:@"%@分",self.doneScoreModel.ratings];
    UIFont *font2=[UIFont boldSystemFontOfSize:14];
    CGSize size2=CGSizeMake(100, 20);
    float w2=[score sizeWithFont:font2 constrainedToSize:size2].width;
    self.commScoreLabel.frame=CGRectMake(self.starImg.right+3, self.starImg.top+2, w2, 20);
    self.commScoreLabel.text=score;
    
    NSString *commentcount=[NSString stringWithFormat:@"/%@人评价",self.doneScoreModel.user_num];
    self.commCountLabel.frame=CGRectMake(self.commScoreLabel.right, self.commScoreLabel.top, 100, 20);
    self.commCountLabel.text=commentcount;
    
    self.mButton.size=CGSizeMake(80, 25);
    self.mButton.right=self.contentLabel.right;
    self.mButton.bottom=self.commCountLabel.bottom;
    [self.mButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)buttonAction:(UIButton *)button{
    
    
}

@end
