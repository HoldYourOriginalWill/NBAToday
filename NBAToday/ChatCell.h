//
//  ChatCell.h
//  今日NBA
//
//  Created by ios on 13-11-4.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "ChatModel.h"

@interface ChatCell : BaseTableViewCell{
    
    UILabel *_contentLabel;
    UILabel *_nameLabel;
}

@property(nonatomic,strong)ChatModel *chatModel;

@end
