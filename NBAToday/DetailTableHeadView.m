//
//  DetailTableHeadView.m
//  今日NBA
//
//  Created by ios on 13-10-27.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "DetailTableHeadView.h"
#import "UIImageView+WebCache.h"
#import "UIUtils.h"

@implementation DetailTableHeadView

-(id)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

-(void)initViews{
    
    _titleView=[[[NSBundle mainBundle] loadNibNamed:@"NewsTitleView" owner:nil options:nil] lastObject];
    _titleView.frame=CGRectMake(0, 0, kScreenWidth, 0);
 
    
    [self addSubview:_titleView];
    
    _newsPicImg=[[UIImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:_newsPicImg];
    
    _webView=[[UIWebView alloc] initWithFrame:CGRectZero];
    _webView.delegate=self;
    _webView.tag=100;
    
    _webView.backgroundColor=[UIColor blackColor];
    [self addSubview:_webView];
    
}

-(void)setDetailModel:(DetailModel *)detailModel{
    
    if (_detailModel!=detailModel) {
          _detailModel=detailModel;
        
        [_webView loadHTMLString:_detailModel.content baseURL:nil];
        
        [self setNeedsLayout];
    }
    
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    //布局_titleView
    NSString *text=_detailModel.title;
    UIFont *font=[UIFont boldSystemFontOfSize:16];
    CGSize size=CGSizeMake(300, 500);
    float h=[UIUtils getLabelHeightWithText:text Font:font Size:size];
    _titleView.height=h+20+10;
    _titleView.detailModel=_detailModel;
    
     //布局_newsPicImg
    _newsPicImg.frame=CGRectMake(10, _titleView.bottom+10, kScreenWidth-20, 150);
    [_newsPicImg setImageWithURL:[NSURL URLWithString:_detailModel.img_m]];
   
    _webView.frame=CGRectMake(10, _newsPicImg.bottom+15, kScreenWidth-20,_webView.scrollView.height);
    
    _webView.scrollView.contentSize=_webView.size;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
     CGFloat height = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
     webView.scrollView.contentSize=CGSizeMake(300, height);
    
    CGRect frame = webView.frame;
    webView.frame = CGRectMake(frame.origin.x-10, frame.origin.y-15, kScreenWidth-20, height);
    
    [webView sizeToFit];
    
//    [webView sizeToFit];
//    NSLog(@"%f",webView.scrollView.contentSize.height);
    
//    float webViewHeight = 0.0f;
//    if (self.subviews.count > 0) {
//        UIView *scrollerView = [self.subviews objectAtIndex:0];
//        if (scrollerView.subviews.count > 0) {
//            UIView *webDocView = scrollerView.subviews.lastObject;
//            if ([webDocView isKindOfClass:[NSClassFromString(@"UIWebDocumentView") class]])
//                webViewHeight = webDocView.frame.size.height;
//            
//            NSLog(@"%f",webViewHeight);
//            
//            webView.height=webViewHeight;
//        }
//    }
    
//    CGFloat webViewHeight = 0.0f;
//    if (webView.subviews.count > 0)
//    {
//        UIView *scrollerView = [webView.subviews objectAtIndex:0];//为什么要取第一个？
//        if (scrollerView.subviews.count > 0)
//        {
//            UIView *webDocView = scrollerView.subviews.lastObject;
//            if ([webDocView isKindOfClass:[NSClassFromString(@"UIWebDocumentView") class]])
//            {
//                webViewHeight = webDocView.frame.size.height;//获取文档的高度
//                webView.frame= webDocView.frame; //更新UIWebView 的高度
//               //scrollerView.contentMode=CGSizeMake(485, 240+webViewHeight);//调整底层的contensize 的大小
//            }
//        }
//    }
    
    if (self.getHeadHeight!=nil) {
        self.getHeadHeight();
    }
    
}

+(float)getDetailHeadHeight:(DetailModel *)detailModel{
    
    //标题视图高度
    float h=0;
    NSString *text=detailModel.title;
    UIFont *font=[UIFont boldSystemFontOfSize:16];
    CGSize size=CGSizeMake(300, 500);
    h=[UIUtils getLabelHeightWithText:text Font:font Size:size];
    h=h+20+10;
  
    //图像视图高度
    h=h+150+20;
    return h;
}




@end
