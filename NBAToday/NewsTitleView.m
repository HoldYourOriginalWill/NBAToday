//
//  NewsTitleView.m
//  今日NBA
//
//  Created by ios on 13-10-27.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "NewsTitleView.h"

@implementation NewsTitleView

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

-(void)setDetailModel:(DetailModel *)detailModel{
    
    if (_detailModel!=detailModel) {
        _detailModel=detailModel;

    }
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.newsTitleLabel.text=self.detailModel.title;
    
    
    float h=[self getTitleLabelHeight:self.detailModel.title];
    self.newsTitleLabel.frame=CGRectMake(10, 6, kScreenWidth-20,h);
    
    NSString *timetext=[self labelTime:self.detailModel.addtime];
    self.timeLabel.text=timetext;
    self.timeLabel.frame=CGRectMake(self.newsTitleLabel.left, self.newsTitleLabel.bottom+5, 50, 20);
    
    NSString *fromstring=[NSString stringWithFormat:@"来自 %@",self.detailModel.origin];
    self.originLabel.text=fromstring;
    self.originLabel.frame=CGRectMake(self.timeLabel.right, self.timeLabel.top,150, 20);
    
    self.separateImg.frame=CGRectMake(0, self.timeLabel.bottom, kScreenWidth,2);
    self.separateImg.image=[UIImage imageNamed:@"news_detail_line@2x.png"];
}

-(float)getTitleLabelHeight:(NSString *)text{
    
    UIFont *font=[UIFont boldSystemFontOfSize:16];
    CGSize size=CGSizeMake(300, 500);
    CGSize textsize=[text sizeWithFont:font constrainedToSize:size];
    
    float height=textsize.height;
    
    return height;
}

-(NSString *)labelTime:(NSNumber *)addtime{
    
    double sendTime=[addtime doubleValue];
    NSDate *date=[NSDate date];
    NSTimeInterval nowTime=[date timeIntervalSince1970];
    
    double f=nowTime-sendTime;
   //60*60*24
    if(f<60) {
        return @"刚刚";
    }else if (60<=f && f<60*60){
        int d=f/60;
        NSString *timeString=[NSString stringWithFormat:@"%d分钟前",d];
        
        return timeString;
    }else if (60*60<=f && f<60*60*24){
        
        int d=f/(60*60);
        NSString *hourstring=[NSString stringWithFormat:@"%d小时前",d];
        
        return hourstring;
    }else if(60*60*24<=f && f<60*60*24*30){
        
        int d=f/60*60*24;
        NSString *daystring=[NSString stringWithFormat:@"%d天前",d];
        
        return daystring;
    }else{
        
        NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
        NSLocale *local=[NSLocale currentLocale];
        [formatter setLocale:local];
        NSString *format=[NSString stringWithFormat:@"M月d日"];
        [formatter setDateFormat:format];
        
        NSDate *date=[NSDate dateWithTimeIntervalSince1970:sendTime];
        NSString *datestring=[formatter stringFromDate:date];
        
        return datestring;

    }

}



@end
