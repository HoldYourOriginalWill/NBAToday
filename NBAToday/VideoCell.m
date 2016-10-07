//
//  VideoCell.m
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "VideoCell.h"
#import "UIImageView+WebCache.h"

@implementation VideoCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
        
}

-(void)setVideoModel:(VideoModel *)videoModel{
    
    _videoModel=videoModel;
    
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.coverImg setImageWithURL:[NSURL URLWithString:self.videoModel.cover]];
    
    self.titleLabel.text=self.videoModel.title;
    
    self.playtimeLabel.text=self.videoModel.playtime;
    
}

@end
