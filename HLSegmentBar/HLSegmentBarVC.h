//
//  HLSegmentBarVC.h
//  HLSegmnetBarDemo
//
//  Created by 刘洪 on 2018/9/10.
//  Copyright © 2018年 刘洪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLSegmentBar.h"

@interface HLSegmentBarVC : UIViewController
@property (nonatomic, weak) HLSegmentBar *segmentBar;
- (void)setUpWithItems: (NSArray <NSString *>*)items childVCs: (NSArray <UIViewController *>*)childVCs;
@end
