//
//  LiveCell.m
//  今日NBA
//
//  Created by ios on 13-11-4.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "LiveCell.h"

@implementation LiveCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}


-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    
}

-(void)setLiveModel:(LiveModel *)liveModel{
    
    if (_liveModel!=liveModel) {
        _liveModel=liveModel;
    }
    
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    

    
    UIFont *font=[UIFont systemFontOfSize:14];
    CGSize size=CGSizeMake(kScreenWidth-61, 200);
    CGSize nsize=[self.liveModel.event sizeWithFont:font constrainedToSize:size];
    float height=nsize.height;
    if (height<30) {
       self.height=35;
    }else{
        
        self.height=height+5;
    }
    
    self.backImg.frame=self.bounds;
    UIImage *image=[UIImage imageNamed:@"playByPlayTableViewCellBg2@2x.png"];
    image=[image stretchableImageWithLeftCapWidth: 8 topCapHeight:10];
    self.backImg.image=image;
    
    self.nameLabel.frame=CGRectMake(0, 0, 60,self.bounds.size.height);
    self.nameLabel.text=self.liveModel.end_time;
    
    self.separateLabel.frame=CGRectMake(self.nameLabel.right, 0, 1,self.bounds.size.height+1);
    
    self.contentLabel.frame=CGRectMake(self.separateLabel.right+5, 0, kScreenWidth-self.separateLabel.right,self.bounds.size.height);
    self.contentLabel.text=self.liveModel.event;
    
    self.boottomLabel.frame=CGRectMake(0, self.bounds.size.height-1, kScreenWidth, 1);
    
}

+(float)getLiveCellHeight:(LiveModel *)liveModel{
    
    UIFont *font=[UIFont systemFontOfSize:14];
    CGSize size=CGSizeMake(kScreenWidth-51, 500);
    
    CGSize nsize=[liveModel.event sizeWithFont:font constrainedToSize:size];
    
    return nsize.height;
}


@end
