//
//  SendChatViewController.h
//  今日NBA
//
//  Created by ios on 13-11-4.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseViewController.h"
#import "GameModel.h"

@interface SendChatViewController : BaseViewController<UITextViewDelegate>{
    
    UIAlertView *_alert;
}

@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UILabel *markLabel;
@property (strong, nonatomic) IBOutlet UILabel *sizeLabel;

@end
