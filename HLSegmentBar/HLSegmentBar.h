//
//  HLSegmentBar.h
//  HLSegmnetBarDemo
//
//  Created by 刘洪 on 2018/9/10.
//  Copyright © 2018年 刘洪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLSegmentBarConfig.h"
@class HLSegmentBar;

@protocol HLSegmentBarDelegate <NSObject>

//点击回调
- (void)segmentBar:(HLSegmentBar *)segmentBar didSelectIndex:(NSInteger)index preIndex:(NSInteger)preIndex;

@end


@interface HLSegmentBar : UIView


/**
 快速创建选项卡

 @param frame frame
 @return 选项卡
 */
+ (instancetype)segmentBarWithFrame: (CGRect)frame;

// 改变设置
- (void)updateWithConfig:(void(^)(HLSegmentBarConfig *config)) configBlock;

// 代理
@property (nonatomic, weak) id<HLSegmentBarDelegate> delegate;

// 数据源
@property (nonatomic, strong) NSArray <NSString *>*items;
//当前选中的索引
@property (nonatomic, assign) NSInteger selectIndex;

@end
