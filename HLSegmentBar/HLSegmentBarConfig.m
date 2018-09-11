//
//  HLSegmentBarConfig.m
//  HLSegmnetBarDemo
//
//  Created by 刘洪 on 2018/9/10.
//  Copyright © 2018年 刘洪. All rights reserved.
//

#import "HLSegmentBarConfig.h"

@interface HLSegmentBarConfig()
@property (nonatomic, strong) UIColor *segmentBarBackColor;
@property (nonatomic, strong) UIColor *itemNormalColor;
@property (nonatomic, strong) UIColor *itemSelectColor;
@property (nonatomic, strong) UIFont *itemFont;
@property (nonatomic, strong) UIColor *indicatorColor;
@property (nonatomic, assign) CGFloat indicatorHeight;
@property (nonatomic, assign) CGFloat indicatorExtraWidth;//指示器的额外宽度
@end

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

-(HLSegmentBarConfig *(^)(UIColor *))segmentBarBackColorBlock
{
    return ^(UIColor *color){
        _segmentBarBackColor = color;
        return self;
    };
}

-(HLSegmentBarConfig *(^)(UIColor *))itemNormalColorBlock
{
    return ^(UIColor *color){
        _itemNormalColor = color;
        return self;
    };
}

-(HLSegmentBarConfig *(^)(UIColor *))itemSelectColorBlock
{
    return ^(UIColor *color){
        _itemSelectColor = color;
        return self;
    };
}

-(HLSegmentBarConfig *(^)(UIFont *))itemFontBlock
{
    return ^(UIFont *font){
        _itemFont = font;
        return self;
    };
}

-(HLSegmentBarConfig *(^)(UIColor *))indicatorColorBlock
{
    return ^(UIColor *color){
        _indicatorColor = color;
        return self;
    };
}

-(HLSegmentBarConfig *(^)(CGFloat))indicatorHeightBlcok
{
    return ^(CGFloat height){
        _indicatorHeight = height;
        return self;
    };
}

-(HLSegmentBarConfig *(^)(CGFloat))indicatorExtraWidthBlock
{
    return ^(CGFloat width){
        _indicatorExtraWidth = width;
        return self;
    };
}

@end
