//
//  NewsDetailTableView.h
//  今日NBA
//
//  Created by ios on 13-10-28.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseTableView.h"

#import "DetailTableHeadView.h"
#import "DetailModel.h"
#import "CommentModel.h"

@interface NewsDetailTableView : UITableView<UITableViewDataSource,UITableViewDelegate>{
    
    DetailTableHeadView *_detailHead;
    
}

@property(nonatomic,strong)DetailModel *detailModel;
@property(nonatomic,strong)NSMutableArray *commentData;

@end
