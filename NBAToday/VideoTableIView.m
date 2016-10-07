//
//  VideoTableIView.m
//  今日NBA
//
//  Created by ios on 13-10-30.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "VideoTableIView.h"
#import "VideoModel.h"
#import "VideoCell.h"

@implementation VideoTableIView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
       
    }
    return self;
}


-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identify=@"cellid";
    VideoCell *cell=[tableView dequeueReusableCellWithIdentifier:identify];
    if (cell==Nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"VideoCell" owner:nil options:nil] lastObject];
    }
    
    cell.videoModel=[self.data objectAtIndex:indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    VideoModel *video=[self.data objectAtIndex:indexPath.row];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:video.fromurl]];
}


@end
