//
//  SendChatViewController.m
//  今日NBA
//
//  Created by ios on 13-11-4.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "SendChatViewController.h"

#define SENDCHAT @"chat/sendChat"

@interface SendChatViewController ()

@end

@implementation SendChatViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"发言";
        //监听键盘将要弹出的监听方法
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillShowNotification:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
    
}



-(void)initView{
    
    //左边按钮
    UIButton *lbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    lbutton.frame=CGRectMake(0, 0, 61, 30);
    [lbutton setTitle:@"取消" forState:UIControlStateNormal];
    [lbutton setBackgroundImage:[UIImage imageNamed:@"red_button@2x.png"] forState:UIControlStateNormal];
    [lbutton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    lbutton.tag=111;
    lbutton.titleLabel.font=[UIFont systemFontOfSize:14];
    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithCustomView:lbutton];
    self.navigationItem.leftBarButtonItem=item;
    //右边按钮
    UIButton *rbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    rbutton.frame=CGRectMake(0, 0, 61, 30);
    [rbutton setTitle:@"发布" forState:UIControlStateNormal];
    [rbutton setBackgroundImage:[UIImage imageNamed:@"red_button@2x.png"] forState:UIControlStateNormal];
    [rbutton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    rbutton.titleLabel.font=[UIFont systemFontOfSize:14];
    rbutton.tag=222;
    UIBarButtonItem *ritem=[[UIBarButtonItem alloc] initWithCustomView:rbutton];
    self.navigationItem.rightBarButtonItem=ritem;
    //编辑视图
    _textView.frame=CGRectMake(12, 12, kScreenWidth-24, 0);
    _textView.layer.cornerRadius=2;
    _textView.layer.borderColor=[UIColor orangeColor].CGColor;
    _textView.layer.borderWidth=1;
    [_textView becomeFirstResponder];
    
    _markLabel.frame=CGRectMake(5,5, 100, 20);
    [_textView addSubview:_markLabel];
    
    _sizeLabel.size=CGSizeMake(40, 20);
    _sizeLabel.layer.cornerRadius=5;
    [_textView addSubview:_sizeLabel];
    
    //超过字数显示提示
    _alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"请不要输入超过140个字！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [self.view addSubview:_alert];
}



-(void)buttonAction:(UIButton *)button{
    
    if (button.tag==111) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }else if(button.tag==222){
        
        if ([_textView.text length] >140) {
            
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"您输入超过140个字！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [self.view addSubview:_alert];
            [alert show];
            
        }else{
            
            [self sendInfo:_textView.text];
            
            [self dismissViewControllerAnimated:YES completion:NULL];
        }
    }
    
}

//发送信息
/*
 http://games.mobileapi.hupu.com/2/2.3.2/chat/sendChat?client=a73c505477f4013582bb7600953d0d86f49ab705
 type	nba
 gid	23370
 username	不曾离开你
 content	James
 token
 */

-(void)sendInfo:(NSString *)text{
    
    NSString *gid=self.gameModel.gid;
    
    NSMutableDictionary *parmas=[NSMutableDictionary dictionaryWithObjectsAndKeys:@"nba",@"type",gid,@"gid",@"不曾离开你",@"username",text,@"content",@"",@"token", nil];
    
    [LoadDataService requestWithURL:SENDCHAT params:parmas httpMethod:@"POST" block:^(id result) {
        
        NSLog(@"发送成功");
    }];
    
    
}

//键盘弹出时调用的方法
-(void)keyboardWillShowNotification:(NSNotification *)notification{
    
    NSValue *sizeValue=[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect frame=[sizeValue CGRectValue];
    
    float height=CGRectGetHeight(frame);
    
    _textView.height=self.view.height-height-25;
    _sizeLabel.right=_textView.right-15;
    _sizeLabel.bottom=_textView.bottom-15;
    
}

//textView的代理协议方法
-(void)textViewDidChange:(UITextView *)textView{
    
    if (textView.text.length==0) {
        [textView addSubview:_markLabel];
    }else{
        
        [_markLabel removeFromSuperview];
        
       // NSInteger num=[textView.text lengthOfBytesUsingEncoding:NSStringEncodingConversionExternalRepresentation];
        NSInteger num=[textView.text length];
        NSString *sizestring=[NSString stringWithFormat:@"%d字",(140-num)];
        _sizeLabel.text=sizestring;
        
        if (num>=140) {
            
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                 [_alert show];
            });

        }
    }
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
