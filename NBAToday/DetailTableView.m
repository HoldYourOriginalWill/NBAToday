//
//  DetailTableView.m
//  今日NBA
//
//  Created by ios on 13-11-5.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "DetailTableView.h"
#import "CommentCell.h"
#import "DetailCommentModel.h"
#import "PerInfoView.h"

@implementation DetailTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
    }
    return self;
}


-(void)awakeFromNib{
    
    [super awakeFromNib];
    
}

-(void)setDoneScore:(DoneScoreModel *)doneScore{
    
    if (_doneScore!=doneScore) {
        _doneScore=doneScore;
        
        [self initView];
    }
    
    [self setNeedsLayout];
}

-(void)initView{
    
    UIImage *image=[UIImage imageNamed:@"list_bg@2x.png"];
    image=[image stretchableImageWithLeftCapWidth:45 topCapHeight:60];
    UIImageView *imgView=[[UIImageView alloc] initWithImage:image];
    imgView.frame=CGRectMake(0, 0, kScreenWidth, 113);
    imgView.userInteractionEnabled=YES;
    imgView.backgroundColor=[UIColor clearColor];
    
    PerInfoView *perview=[[[NSBundle mainBundle] loadNibNamed:@"PerInfoView" owner:nil options:nil] lastObject];
    perview.backgroundColor=[UIColor clearColor];
    perview.frame=CGRectMake(0, 0, kScreenWidth, 113);
    perview.doneScoreModel=self.doneScore;
    [imgView addSubview:perview];
    
    self.tableHeaderView=imgView;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identify=@"cellid";
    
    CommentCell *cell=(CommentCell *)[tableView dequeueReusableCellWithIdentifier:identify];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"CommentCell" owner:nil options:nil] lastObject];
    }
    
   cell.detailComment=[self.data objectAtIndex:indexPath.row];
    
   [cell setNeedsLayout];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     UIFont *font=[UIFont systemFontOfSize:14];
     CGSize size2=CGSizeMake(220, 1000);
    DetailCommentModel *detailcomment=[self.data objectAtIndex:indexPath.row];
    CGSize descsize=[detailcomment.desc sizeWithFont:font constrainedToSize:size2];
    return descsize.height+40;
}

@end
