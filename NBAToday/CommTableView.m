//
//  CommTableView.m
//  今日NBA
//
//  Created by ios on 13-10-30.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "CommTableView.h"
#import "CommScoreCell.h"
#import "PerInfoView.h"
#import "DetailCommentViewController.h"
#import "BaseNavigationController.h"
#import "UIView+ViewController.h"

@implementation CommTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.backgroundColor=[UIColor clearColor];
        self.backgroundView=nil;
        self.dataSource=self;
        self.delegate=self;
    }
    return self;
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    self.dataSource=self;
    self.delegate=self;
    self.backgroundColor=[UIColor clearColor];
    self.backgroundView=nil;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellid=@"identify";
    CommScoreCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell==nil) {
        cell=[[CommScoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    cell.doneScoreModel=[self.data objectAtIndex:indexPath.row];
    
    [cell setNeedsLayout];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 113;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DoneScoreModel *donescore=[self.data objectAtIndex:indexPath.row];
    
    DetailCommentViewController *detailComment=[[DetailCommentViewController alloc] init];
    detailComment.doneScoreModel=donescore;
    [self.viewController.navigationController pushViewController:detailComment animated:YES];
}


@end
