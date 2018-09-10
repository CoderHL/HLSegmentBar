//
//  HLSegmentBarConfig.h
//  HLSegmnetBarDemo
//
//  Created by 刘洪 on 2018/9/10.
//  Copyright © 2018年 刘洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLSegmentBarConfig : NSObject

+ (instancetype)defaultConfig;
@property (nonatomic, strong) UIColor *segmentBarBackColor;
@property (nonatomic, strong) UIColor *itemNormalColor;
@property (nonatomic, strong) UIColor *itemSelectColor;
@property (nonatomic, strong) UIFont *itemFont;
@property (nonatomic, strong) UIColor *indicatorColor;
@property (nonatomic, assign) CGFloat indicatorHeight;
@property (nonatomic, assign) CGFloat indicatorExtraWidth;//指示器的额外宽度
@end
