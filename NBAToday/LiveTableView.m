//
//  LiveTableView.m
//  今日NBA
//
//  Created by ios on 13-11-4.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "LiveTableView.h"
#import "LiveCell.h"

@implementation LiveTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
    
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellid=@"identtify";
    LiveCell *cell=(LiveCell *)[tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"LiveCell" owner:nil options:nil] lastObject];
    }
    
    cell.liveModel=[self.data objectAtIndex:indexPath.row];

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LiveModel *liveModel=[self.data objectAtIndex:indexPath.row];
    float height=[LiveCell getLiveCellHeight:liveModel];
    
    if (height<30) {
        return 35;
    }
    
    return height+5;
}

@end
