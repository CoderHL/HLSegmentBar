//
//  HLSegmentBar.m
//  HLSegmnetBarDemo
//
//  Created by 刘洪 on 2018/9/10.
//  Copyright © 2018年 刘洪. All rights reserved.
//

#import "HLSegmentBar.h"
#import "UIView+HLSegmentBar.h"

#define kMinMargin 30
@interface HLSegmentBar()
{
    UIButton *_lastBtn;//上一次选中的按钮
}
@property (nonatomic, strong) HLSegmentBarConfig *config;
//添加的按钮
@property (nonatomic, strong) NSMutableArray <UIButton *>*itemBtns;
//指示器
@property (nonatomic, weak) UIView *indicatorView;
//内容承载视图
@property (nonatomic, weak) UIScrollView *contentView;

@end
@implementation HLSegmentBar


#pragma mark -setter&getter
- (NSMutableArray<UIButton *> *)itemBtns {
    if (!_itemBtns) {
        _itemBtns = [NSMutableArray array];
    }
    return _itemBtns;
}

- (UIView *)indicatorView {
    if (!_indicatorView) {
        CGFloat indicatorH = self.config.indicatorHeight;
        UIView *indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - indicatorH, 0, indicatorH)];
        indicatorView.backgroundColor = self.config.indicatorColor;
        [self.contentView addSubview:indicatorView];
        _indicatorView = indicatorView;
    }
    return _indicatorView;
}

- (UIScrollView *)contentView {
    if (!_contentView) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:scrollView];
        _contentView = scrollView;
    }
    return _contentView;
}

-(HLSegmentBarConfig *)config
{
    if(!_config){
        _config = [HLSegmentBarConfig defaultConfig];
    }
    return _config;
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    // 数据过滤
    if (self.itemBtns.count == 0 || selectIndex < 0 || selectIndex > self.itemBtns.count - 1) {
        return;
    }
    _selectIndex = selectIndex;
    UIButton *btn = self.itemBtns[selectIndex];
    [self _btnClick:btn];
}

- (void)setItems:(NSArray<NSString *> *)items {
    _items = items;
    [self.itemBtns makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.itemBtns = nil;
    for (NSString *item in items) {
        UIButton *btn = [[UIButton alloc] init];
        btn.tag = self.itemBtns.count;
        [btn addTarget:self action:@selector(_btnClick:) forControlEvents:UIControlEventTouchDown];
        [btn setTitleColor:self.config.itemNormalColor forState:UIControlStateNormal];
        [btn setTitleColor:self.config.itemSelectColor forState:UIControlStateSelected];
        btn.titleLabel.font = self.config.itemFont;
        [btn setTitle:item forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
        [self.itemBtns addObject:btn];
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark -system Method

- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
    
    // 计算margin
    CGFloat totalBtnWidth = 0;
    for (UIButton *btn in self.itemBtns) {
        [btn sizeToFit];
        totalBtnWidth += btn.width;
    }
    
    CGFloat caculateMargin = (self.width - totalBtnWidth) / (self.items.count + 1);
    if (caculateMargin < kMinMargin) {
        caculateMargin = kMinMargin;
    }
    
    CGFloat lastX = caculateMargin;
    for (UIButton *btn in self.itemBtns) {
        // w, h
        [btn sizeToFit];
        // y 0
        // x, y,
        btn.y = 0;
        btn.x = lastX;
        lastX += btn.width + caculateMargin;
    }
    
    self.contentView.contentSize = CGSizeMake(lastX, 0);
    if (self.itemBtns.count == 0) {
        return;
    }
    UIButton *btn = self.itemBtns[self.selectIndex];
    self.indicatorView.width = btn.width + self.config.indicatorExtraWidth * 2;
    self.indicatorView.centerX = btn.centerX;
    self.indicatorView.height = self.config.indicatorHeight;
    self.indicatorView.y = self.height - self.indicatorView.height;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame])
    {
        if(@available(iOS 11.0,*)){
            self.contentView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        self.backgroundColor = self.config.segmentBarBackColor;
    }
    return self;
}


#pragma mark -接口

+(instancetype)segmentBarWithFrame:(CGRect)frame
{
    return [[HLSegmentBar alloc]initWithFrame:frame];
}

- (void)updateWithConfig:(void(^)(HLSegmentBarConfig *config)) configBlock
{
    if(configBlock){
        configBlock(self.config);
    }
    //更新配置
    for (UIButton *btn in self.itemBtns) {
        [btn setTitleColor:self.config.itemNormalColor forState:UIControlStateNormal];
        [btn setTitleColor:self.config.itemSelectColor forState:UIControlStateSelected];
        btn.titleLabel.font = self.config.itemFont;
    }
    self.backgroundColor = self.config.segmentBarBackColor;
    self.indicatorView.backgroundColor = self.config.indicatorColor;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark -私有方法
- (void)_btnClick: (UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(segmentBar:didSelectIndex:preIndex:)]) {
        [self.delegate segmentBar:self didSelectIndex:btn.tag preIndex:_lastBtn.tag];
    }
    _selectIndex = btn.tag;
    _lastBtn.selected = NO;
    btn.selected = YES;
    _lastBtn = btn;
    [UIView animateWithDuration:0.1 animations:^{
        self.indicatorView.width = btn.width + self.config.indicatorExtraWidth * 2;
        self.indicatorView.centerX = btn.centerX;
    }];
    CGFloat scrollX = btn.centerX - self.contentView.width * 0.5;
    if (scrollX < 0) {
        scrollX = 0;
    }
    if (scrollX > self.contentView.contentSize.width - self.contentView.width) {
        scrollX = self.contentView.contentSize.width - self.contentView.width;
    }
    [self.contentView setContentOffset:CGPointMake(scrollX, 0) animated:YES];
    
}

@end
