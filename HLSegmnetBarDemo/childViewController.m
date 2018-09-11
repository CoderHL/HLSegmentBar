//
//  HLChildViewController.m
//  HLSegmnetBarDemo
//
//  Created by 刘洪 on 2018/9/11.
//  Copyright © 2018年 刘洪. All rights reserved.
//

#import "childViewController.h"

@interface childViewController ()
{
    UILabel *_titleLabel;
}
@end

@implementation childViewController


+ (instancetype)childViewControllerWithTitle:(NSString *)title
{
    childViewController *vc= [[childViewController alloc]init];
    vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    UILabel *label = [[UILabel alloc]init];
    label.text =title;
    [label sizeToFit];
    label.textAlignment = NSTextAlignmentCenter;
    [vc.view addSubview:label];
    vc->_titleLabel = label;
    return vc;
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _titleLabel.center = CGPointMake(self.view.bounds.size.width*.5, self.view.bounds.size.height*0.5);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
