//
//  CommScoreCell.m
//  今日NBA
//
//  Created by ios on 13-10-30.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "CommScoreCell.h"
#import "UIImageView+WebCache.h"
#import "UIUtils.h"

@implementation CommScoreCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       // [self initView];
    }
    return self;
}

-(void)initView{
    
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    self.backgroundColor=[UIColor clearColor];
    self.contentView.backgroundColor=[UIColor clearColor];
    _backImg=[[UIImageView alloc] initWithFrame:CGRectZero];
    _backImg.backgroundColor=[UIColor clearColor];
    [self.contentView addSubview:_backImg];
    self.backgroundView=nil;
    
    _perInfoView=[[[NSBundle mainBundle] loadNibNamed:@"PerInfoView" owner:nil options:nil] lastObject];
    [self.contentView addSubview:_perInfoView];
   }


-(void)setDoneScoreModel:(DoneScoreModel *)doneScoreModel{
    
    if (_doneScoreModel!=doneScoreModel) {
        _doneScoreModel=doneScoreModel;
        
        if (_perInfoView==nil) {
            [self initView];
        }
        
        _perInfoView.doneScoreModel=_doneScoreModel;
    
    }
    
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    _perInfoView.frame=self.bounds;
    _perInfoView.doneScoreModel=self.doneScoreModel;
    
    _backImg.frame=self.bounds;
    UIImage *image=[UIImage imageNamed:@"list_bg@2x.png"];
    image=[image stretchableImageWithLeftCapWidth:45 topCapHeight:60];
    _backImg.image=image;
    
}


@end
