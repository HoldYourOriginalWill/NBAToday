//
//  CommenCell.m
//  今日NBA
//
//  Created by ios on 13-10-28.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "CommenCell.h"

@implementation CommenCell

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

-(void)setCommentModel:(CommentModel *)commentModel{
    
    _commentModel=commentModel;
    
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    self.userNameLabel.frame=CGRectMake(20, 10, 20, 150);
    self.userNameLabel.text=self.commentModel.user_name;
    
    int lights=[self.commentModel.light_count intValue];
    NSString *lightcount=[NSString stringWithFormat:@"亮了(%d)",lights];
    self.lightCountLabel.text=lightcount;
    self.lightCountLabel.top=self.userNameLabel.top;
    self.lightCountLabel.right=300;
    
    NSString *labeltime=[self labelTime:self.commentModel.create_time];
    self.createTimeLabel.text=labeltime;
    self.createTimeLabel.frame=CGRectMake(self.userNameLabel.left, self.userNameLabel.bottom+5, 50, 20);
    
    NSString *context=self.commentModel.content;
    self.contentLabel.text=context;
    float heiht=[self getTextLabelHeight:context];
    self.contentLabel.frame=CGRectMake(self.userNameLabel.left, self.createTimeLabel.bottom+5, kScreenWidth-40, heiht);
    
    self.separateImg.top=self.contentLabel.bottom+10;
    
}

//计算内容高度
-(float)getTextLabelHeight:(NSString *)text{
    
    UIFont *font=[UIFont systemFontOfSize:14];
    CGSize size=CGSizeMake(280, 1000);
    
    CGSize newsize=[text sizeWithFont:font constrainedToSize:size];
    
    float h=newsize.height;
    
    return h;
}

//计算cell的高度

+(float)getCommenCellHeight:(CommentModel *)commentModel{
    
    NSString *content=commentModel.content;
    UIFont *font=[UIFont systemFontOfSize:14];
    CGSize size=CGSizeMake(280, 1000);
    
    CGSize newsize=[content sizeWithFont:font constrainedToSize:size];
    
    float ch=newsize.height;
    
    float h=10+20+5+20+5+ch+10+2;
    
    return h;
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
