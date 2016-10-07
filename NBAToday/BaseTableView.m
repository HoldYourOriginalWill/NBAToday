//
//  BaseTableView.m
//  今日NBA
//
//  Created by ios on 13-10-24.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self initViews];
    }
    return self;
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self initViews];
}

-(void)initViews{
    
    self.dataSource=self;
    self.delegate=self;
    self.refreshHeader=YES;
    self.isMore=YES;
    
    _moreButton =[UIButton buttonWithType:UIButtonTypeCustom];
    _moreButton.frame=CGRectMake(0, 0, self.width, 44);
    [_moreButton setTintColor:[UIColor darkGrayColor]];
    [_moreButton setTitle:@"上拉加载更多" forState:UIControlStateNormal];
    [_moreButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _moreButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [_moreButton addTarget:self action:@selector(loadMoreAction) forControlEvents:UIControlEventTouchUpInside];
    _moreButton.hidden = YES;

    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityView.frame=CGRectMake(90, 10, 20, 20);
    [activityView stopAnimating];
    activityView.tag = 2013;
    [_moreButton addSubview:activityView];
    
    self.tableFooterView=_moreButton;

}
- (void)setRefreshHeader:(BOOL)refreshHeader {
    _refreshHeader = refreshHeader;
    
    if (self.refreshHeader) {
        if (_refreshHeaderView == nil) {
            //创建下拉控件
            _refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.bounds.size.height, self.frame.size.width, self.bounds.size.height)];
            _refreshHeaderView.delegate = self;
            _refreshHeaderView.backgroundColor = [UIColor clearColor];
            [_refreshHeaderView refreshLastUpdatedDate];
        }
        
        [self addSubview:_refreshHeaderView];
    } else {
        if (_refreshHeaderView.superview != nil) {
            [_refreshHeaderView removeFromSuperview];
        }
    }
}

-(void)setData:(NSArray *)data{
    
    if (_data!=data) {
        _data=data;
        
        if (_data.count>0) {
            _moreButton.hidden=NO;
        }else{
            _moreButton.hidden=YES;
        }
    }
}

-(void)setIsMore:(BOOL)isMore{
    _isMore=isMore;
    if (self.isMore) {
        [_moreButton setTitle:@"上拉加载更多" forState:UIControlStateNormal];
        _moreButton.enabled=YES;
    }else{
        [_moreButton setTitle:@"已到底部，没有更多" forState:UIControlStateNormal];
        _moreButton.enabled=NO;
    }
    UIActivityIndicatorView *activityView=(UIActivityIndicatorView *)[_moreButton viewWithTag:2013];
    [activityView stopAnimating];
}

//上拉按钮的点击事件
-(void)loadMoreAction{
//    [_moreButton setTitle:@"正在加载>>>>" forState:UIControlStateNormal];
//    UIActivityIndicatorView *activiety=(UIActivityIndicatorView *)[_moreButton viewWithTag:2013];
//    [activiety startAnimating];
    
    //调用代理对象的协议方法
    if ([self.refreshDelegate respondsToSelector:@selector(pullUp:)]) {
        [self.refreshDelegate pullUp:self];
    }

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
   return self.data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.refreshDelegate respondsToSelector:@selector(didSelectRowAtIndexPath:indexPath:)]) {
        [self.refreshDelegate didSelectRowAtIndexPath:self indexPath:indexPath];
    }
}

/*________________________下拉控件相关方法________________________________*/
#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
	_reloading = YES;
	
}

//收起下拉刷新
- (void)doneLoadingTableViewData{
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self];
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    
    //偏移量.y + tableView.height = 内容的高度
    //h是上拉超出来的尺寸
    float h = scrollView.contentOffset.y + scrollView.height - scrollView.contentSize.height;
    if (h > 30 ) {
        [self loadMoreAction];
    }
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods
//下拉到一定距离，手指放开时调用
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
    
    //停止加载，弹回下拉
    //	[self performSelector:@selector(doneLoadingTableViewData)
    //               withObject:nil afterDelay:3.0];
    if (self.finishBlock != nil) {
        self.finishBlock();
    }
    
    if ([self.refreshDelegate respondsToSelector:@selector(pullDown:)]) {
        [self.refreshDelegate pullDown:self];
    }
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}

//取得下拉刷新的时间
- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}



@end
