//
//  ViewController.m
//  HLSegmnetBarDemo
//
//  Created by 刘洪 on 2018/9/10.
//  Copyright © 2018年 刘洪. All rights reserved.
//

#import "ViewController.h"
#import "HLSegmentBarVC.h"

@interface ViewController ()
@property (nonatomic, weak) HLSegmentBarVC *segmentBarVC;
@end

@implementation ViewController

- (HLSegmentBarVC *)segmentBarVC {
    if (!_segmentBarVC) {
        HLSegmentBarVC *vc = [[HLSegmentBarVC alloc] init];
        [self addChildViewController:vc];
        _segmentBarVC = vc;
    }
    return _segmentBarVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.segmentBarVC.segmentBar.frame = CGRectMake(0, 64, self.view.bounds.size.width, 35);
    self.segmentBarVC.segmentBar.backgroundColor = [UIColor greenColor];
    self.segmentBarVC.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentBarVC.view];
    
    NSArray *items = @[@"专辑", @"声音", @"下载中"];
    
    //添加对应的子控制器
    UIViewController *vc1 = [UIViewController new];
    vc1.view.backgroundColor = [UIColor redColor];
    
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *vc3 = [UIViewController new];
    vc3.view.backgroundColor = [UIColor yellowColor];
    [self.segmentBarVC setUpWithItems:items childVCs:@[vc1, vc2, vc3]];
}


@end
