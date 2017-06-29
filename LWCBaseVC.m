//
//  LWCBaseVC.m
//  WebViewDemo
//
//  Created by syl on 2017/6/29.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import "LWCBaseVC.h"
#import "UIColor+Helpers.h"
#import "LWC_MEASURE.h"
@interface LWCBaseVC ()

@end
/* 布局界面的时候，y开始的位置 */
const CGFloat LWCBaseViewOriginY = 64.0f;

@implementation LWCBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor UIColorFromHex:0xf4f7f8];
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.view.frame = CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
    self.automaticallyAdjustsScrollViewInsets = NO;
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
