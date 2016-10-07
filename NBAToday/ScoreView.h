//
//  ScoreView.h
//  今日NBA
//
//  Created by ios on 13-10-30.
//  Copyright (c) 2013年 zou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreView : UIView

@property (strong, nonatomic) IBOutlet UILabel *homeNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *awayNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreOneLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreTwoLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreThreeLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreFourLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreSumLabel;
@property (strong, nonatomic) IBOutlet UILabel *homeOneLabel;
@property (strong, nonatomic) IBOutlet UILabel *homeTwoLabel;
@property (strong, nonatomic) IBOutlet UILabel *homeThreeLabel;
@property (strong, nonatomic) IBOutlet UILabel *homeFourLabel;
@property (strong, nonatomic) IBOutlet UILabel *homeSumLabel;
@property (strong, nonatomic) IBOutlet UILabel *awayOneLabel;
@property (strong, nonatomic) IBOutlet UILabel *awayTwoLabel;
@property (strong, nonatomic) IBOutlet UILabel *awayThreeLabel;
@property (strong, nonatomic) IBOutlet UILabel *awayFourLabel;
@property (strong, nonatomic) IBOutlet UILabel *awaySumLabel;


@end
