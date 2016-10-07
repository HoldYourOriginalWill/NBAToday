//
//  CommentCell.m
//  今日NBA
//
//  Created by ios on 13-11-5.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "CommentCell.h"

@implementation CommentCell

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier];
    if (self) {
    
    }
    return self;
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
   self.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
}

-(void)setDetailComment:(DetailCommentModel *)detailComment{
    
    if (_detailComment!=detailComment) {
        _detailComment=detailComment;
    }
    
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    UIFont *font3=[UIFont systemFontOfSize:14];
    CGSize size3=CGSizeMake(220, 1000);
    CGSize descsize=[self.detailComment.desc sizeWithFont:font3 constrainedToSize:size3];
    self.height=descsize.height+40;
    
    self.bgImg.frame=CGRectMake(5, 5, kScreenWidth-20, self.height-10);
    UIImage *image=[UIImage imageNamed:@"comment_list@2x.png"];
    image=[image stretchableImageWithLeftCapWidth:90 topCapHeight:50];
    self.bgImg.image=image;
    
    UIFont *font=[UIFont systemFontOfSize:14];
    CGSize size=CGSizeMake(200, 20);
    CGSize namesize=[self.detailComment.nickname sizeWithFont:font constrainedToSize:size];
    self.nicknameLabel.frame=CGRectMake(25,10, namesize.width, 20);
    self.nicknameLabel.text=self.detailComment.nickname;
    
    NSString *ratingstirng=[NSString stringWithFormat:@"%@分",self.detailComment.rating];
    self.ratingLabel.frame=CGRectMake(self.nicknameLabel.right+15, self.nicknameLabel.top, 50, 20);
    self.ratingLabel.text=ratingstirng;
    
    
    self.commButton.frame=CGRectMake(self.nicknameLabel.left+230, self.nicknameLabel.top, 18, 17);
    [self.commButton setImage:[UIImage imageNamed:@"good_btn@2x.png"] forState:UIControlStateNormal];
    [self.commButton setImage:[UIImage imageNamed:@"good_btn_1@2x.png"] forState:UIControlStateSelected];
    
    NSLog(@"%@",self.commButton);
    
    self.countLabel.frame=CGRectMake(self.commButton.right+5, self.commButton.top+3,30,15);
    self.countLabel.text=self.detailComment.like;
    
    NSString *content=self.detailComment.desc;
    CGSize size2=CGSizeMake(250, 1000);
    CGSize conseize=[content sizeWithFont:font constrainedToSize:size2];
    float width=self.commButton.right-self.nicknameLabel.left;
    self.contentLabel.frame=CGRectMake(self.nicknameLabel.left, self.nicknameLabel.bottom,width, conseize.height);
    self.contentLabel.text=content;
    
}


- (IBAction)commbuttonAction:(id)sender {
    
    self.commButton.selected=!self.commButton.selected;
    int count=[self.countLabel.text intValue];
    if (self.commButton.selected) {
        count +=1;
    }else{
        if (count>0) {
            count-=1;
        }else{
            count=0;
        }
    }
    
    NSString *text=[NSString stringWithFormat:@"%d",count];
    self.countLabel.text=text;
}
@end
