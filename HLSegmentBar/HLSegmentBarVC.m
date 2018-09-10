//
//  HLSegmentBarVC.m
//  HLSegmnetBarDemo
//
//  Created by 刘洪 on 2018/9/10.
//  Copyright © 2018年 刘洪. All rights reserved.
//

#import "HLSegmentBarVC.h"
#import "UIView+HLSegmentBar.h"

@interface HLSegmentBarVC ()<HLSegmentBarDelegate,UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *contentView;

@end

@implementation HLSegmentBarVC

#pragma mark getter&&setter
- (HLSegmentBar *)segmentBar {
    if (!_segmentBar) {
        HLSegmentBar *segmentBar = [HLSegmentBar segmentBarWithFrame:CGRectZero];
        segmentBar.delegate = self;
        segmentBar.backgroundColor = [UIColor brownColor];
        [self.view addSubview:segmentBar];
        _segmentBar = segmentBar;
        
    }
    return _segmentBar;
}

- (UIScrollView *)contentView {
    if (!_contentView) {
        
        UIScrollView *contentView = [[UIScrollView alloc] init];
        contentView.delegate = self;
        contentView.pagingEnabled = YES;
        [self.view addSubview:contentView];
        _contentView = contentView;
    }
    return _contentView;
}

#pragma mark -对外接口

- (void)setUpWithItems: (NSArray <NSString *>*)items childVCs: (NSArray <UIViewController *>*)childVCs {
    
    NSAssert(items.count != 0 || items.count == childVCs.count, @"items个数与childVCs的个数不一致");
    
    self.segmentBar.items = items;
    
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    for (UIViewController *vc in childVCs) {
        [self addChildViewController:vc];
    }   
    self.contentView.contentSize = CGSizeMake(items.count * self.view.width, 0);
    
    self.segmentBar.selectIndex = 0;
}


#pragma mark - HLSegmentBarDelegate
- (void)segmentBar:(HLSegmentBar *)segmentBar didSelectIndex:(NSInteger)index preIndex:(NSInteger)preIndex
{
    NSLog(@"%zd----%zd", preIndex, index);
    [self _showChildVCViewsAtIndex:index];
}

#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    NSInteger index = self.contentView.contentOffset.x / self.contentView.width;
    self.segmentBar.selectIndex = index;
}

#pragma mark - 私有方法
- (void)_showChildVCViewsAtIndex: (NSInteger)index {
    
    if (self.childViewControllers.count == 0 || index < 0 || index > self.childViewControllers.count - 1) {
        return;
    }
    
    UIViewController *vc = self.childViewControllers[index];
    vc.view.frame = CGRectMake(index * self.contentView.width, 0, self.contentView.width, self.contentView.height);
    [self.contentView addSubview:vc.view];
    
    // 滚动到对应的位置
    [self.contentView setContentOffset:CGPointMake(index * self.contentView.width, 0) animated:YES];
    
}

#pragma mark - 系统方法

- (void)viewDidLoad {
    [super viewDidLoad];
    if(@available(iOS 11.0,*)){
        self.contentView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    if (self.segmentBar.superview == self.view) {
        CGFloat contentViewY = self.segmentBar.y + self.segmentBar.height;
        CGRect contentFrame = CGRectMake(0, contentViewY, self.view.width, self.view.height - contentViewY);
        self.contentView.frame = contentFrame;
        self.contentView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.width, 0);
        
        return;
    }
    
    
    CGRect contentFrame = CGRectMake(0, 0,self.view.width,self.view.height);
    self.contentView.frame = contentFrame;
    self.contentView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.width, 0);
    self.segmentBar.selectIndex = self.segmentBar.selectIndex;
    
}

@end
