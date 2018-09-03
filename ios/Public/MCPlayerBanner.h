//
//  MCPlayerBanner.h
//  Miracast
//
//  Created by Kun Wang on 2018/7/30.
//  Copyright © 2018年 Kun Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MCPlayMediaViewModel;
@interface MCPlayerBanner : UIControl
+ (instancetype)sharedBanner;
@property (nonatomic, strong) MCPlayMediaViewModel *viewModel;
@end
