//
//  CommentCell.h
//  今日NBA
//
//  Created by ios on 13-11-5.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "DetailCommentModel.h"

@interface CommentCell :BaseTableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *bgImg;
@property (strong, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UIButton *commButton;
@property (strong, nonatomic) IBOutlet UILabel *countLabel;

@property(nonatomic,strong)DetailCommentModel *detailComment;

- (IBAction)commbuttonAction:(id)sender;

@end
