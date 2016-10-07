//
//  BaseTableView.h
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"

@class BaseTableView;
@protocol BaseTableViewDelegate <NSObject>

@optional
//下拉事件
- (void)pullDown:(BaseTableView *)tableView;
//上拉事件
- (void)pullUp:(BaseTableView *)tableView;
//选中单元格事件
- (void)didSelectRowAtIndexPath:(BaseTableView *)tabelView indexPath:(NSIndexPath *)indexPath;

@end

typedef void(^PullDonwFinish)(void);

@interface BaseTableView : UITableView<UITableViewDataSource,UITableViewDelegate,EGORefreshTableHeaderDelegate>{
    
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
    
    UIButton *_moreButton;
}

@property(nonatomic,retain)NSArray *data;
//是否显示下拉控件
@property(nonatomic,assign)BOOL refreshHeader;
//是否有更多
@property(nonatomic,assign)BOOL isMore;

@property(nonatomic,copy)PullDonwFinish finishBlock;
//上拉代理对象
@property(nonatomic,assign)id<BaseTableViewDelegate> refreshDelegate;

- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;

@end
