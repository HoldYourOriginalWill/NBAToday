//
//  EGORefreshTableHeaderView.h
//  Demo
//
//  Created by Devin Doty on 10/14/09October14.
//  Copyright 2009 enormego. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

//下拉的三种状态
typedef enum{
	EGOOPullRefreshPulling = 0,
	EGOOPullRefreshNormal,
	EGOOPullRefreshLoading,	
} EGOPullRefreshState;

@protocol EGORefreshTableHeaderDelegate;//协议名

//下拉头部视图
@interface EGORefreshTableHeaderView : UIView {
	
    //代理
	id _delegate;
    //状态
	EGOPullRefreshState _state;
 
    //上次刷新时间标签
	UILabel *_lastUpdatedLabel;
    //下拉状态标签
	UILabel *_statusLabel;
    //添加的图片
	CALayer *_arrowImage;
    //加载图标
	UIActivityIndicatorView *_activityView;
	

}

@property(nonatomic,assign) id <EGORefreshTableHeaderDelegate> delegate;

//上次刷新时间
- (void)refreshLastUpdatedDate;
//滚动结束
- (void)egoRefreshScrollViewDidScroll:(UIScrollView *)scrollView;
//拖拽结束
- (void)egoRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView;
//完成加载
- (void)egoRefreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;

//扩展:下拉显示加载
- (void)initLoading:(UIScrollView *)scrollView;

@end
@protocol EGORefreshTableHeaderDelegate
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view;
- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view;
@optional
- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view;
@end
