//
//  HLSegmentBarConfig.m
//  HLSegmnetBarDemo
//
//  Created by 刘洪 on 2018/9/10.
//  Copyright © 2018年 刘洪. All rights reserved.
//

#import "HLSegmentBarConfig.h"

@implementation HLSegmentBarConfig
+ (instancetype)defaultConfig
{
    HLSegmentBarConfig *config = [[HLSegmentBarConfig alloc]init];
    config.segmentBarBackColor = [UIColor clearColor];
    config.itemFont = [UIFont systemFontOfSize:14];
    config.itemNormalColor = [UIColor blackColor];
    config.itemSelectColor = [UIColor redColor];
    config.indicatorColor = [UIColor redColor];
    config.indicatorHeight = 2;
    config.indicatorExtraWidth = 10;
    return config;
}

@end
