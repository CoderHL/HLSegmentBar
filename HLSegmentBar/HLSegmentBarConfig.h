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
@property (nonatomic, strong,readonly) UIColor *segmentBarBackColor;
@property (nonatomic, strong,readonly) UIColor *itemNormalColor;
@property (nonatomic, strong,readonly) UIColor *itemSelectColor;
@property (nonatomic, strong,readonly) UIFont *itemFont;
@property (nonatomic, strong,readonly) UIColor *indicatorColor;
@property (nonatomic, assign,readonly) CGFloat indicatorHeight;
@property (nonatomic, assign,readonly) CGFloat indicatorExtraWidth;//指示器的额外宽度

//修改选项卡背景颜色
@property (nonatomic, strong, readonly) HLSegmentBarConfig *(^segmentBarBackColorBlock)(UIColor *color);

@property (nonatomic, strong, readonly) HLSegmentBarConfig *(^itemNormalColorBlock)(UIColor *color);

@property (nonatomic, strong, readonly) HLSegmentBarConfig *(^itemSelectColorBlock)(UIColor *color);

@property (nonatomic, strong, readonly) HLSegmentBarConfig *(^itemFontBlock)(UIFont *font);

@property (nonatomic, strong, readonly) HLSegmentBarConfig *(^indicatorColorBlock)(UIColor *color);

@property (nonatomic, strong, readonly) HLSegmentBarConfig *(^indicatorHeightBlcok)(CGFloat height);

@property (nonatomic, strong, readonly) HLSegmentBarConfig *(^indicatorExtraWidthBlock)(CGFloat width);

@end
