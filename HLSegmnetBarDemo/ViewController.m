//
//  ViewController.m
//  HLSegmnetBarDemo
//
//  Created by 刘洪 on 2018/9/10.
//  Copyright © 2018年 刘洪. All rights reserved.
//

#import "ViewController.h"
#import "HLSegmentBarVC.h"
#import "childViewController.h"

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
    {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"changeTitle" style:UIBarButtonItemStylePlain target:self action:@selector(changeBtnClick)];
        
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"changeConfig" style:UIBarButtonItemStylePlain target:self action:@selector(changeConfigClick)];
    }
    
    self.segmentBarVC.segmentBar.frame = CGRectMake(0, 64, self.view.bounds.size.width, 35);
    self.segmentBarVC.segmentBar.backgroundColor = [UIColor greenColor];
    self.segmentBarVC.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentBarVC.view];
    
    NSArray *items = @[@"关注", @"推荐", @"新时代"];
    
    //添加对应的子控制器
    childViewController *vc1 = [childViewController childViewControllerWithTitle:items[0]];
    
    UIViewController *vc2 = [childViewController childViewControllerWithTitle:items[1]];
    
    UIViewController *vc3 = [childViewController childViewControllerWithTitle:items[2]];
    [self.segmentBarVC setUpWithItems:items childVCs:@[vc1, vc2, vc3]];
}

// 改变选项卡显示主题
- (void)changeConfigClick{
    [self.segmentBarVC.segmentBar updateWithConfig:^(HLSegmentBarConfig *config) {
        config.segmentBarBackColorBlock([UIColor whiteColor]).itemNormalColorBlock([UIColor lightGrayColor]);
    }];
}

- (void)changeBtnClick
{
    NSArray *items = @[@"体育",@"财经",@"科技",@"历史",@"军事",@"汽车",@"足球",@"涨知识",@"国际"];
    UIViewController *vc1 = [childViewController childViewControllerWithTitle:items[0]];
    
    UIViewController *vc2 = [childViewController childViewControllerWithTitle:items[1]];
    
    UIViewController *vc3 = [childViewController childViewControllerWithTitle:items[2]];
    
    UIViewController *vc4 = [childViewController childViewControllerWithTitle:items[3]];
    
    UIViewController *vc5 = [childViewController childViewControllerWithTitle:items[4]];
    
    UIViewController *vc6 = [childViewController childViewControllerWithTitle:items[5]];
    
    UIViewController *vc7 = [childViewController childViewControllerWithTitle:items[6]];
    
    UIViewController *vc8 = [childViewController childViewControllerWithTitle:items[7]];
    
    UIViewController *vc9 = [childViewController childViewControllerWithTitle:items[8]];

    [self.segmentBarVC setUpWithItems:items childVCs:@[vc1, vc2, vc3,vc4,vc5,vc6,vc7,vc8,vc9]];
}


@end
