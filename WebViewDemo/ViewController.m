//
//  ViewController.m
//  WebViewDemo
//
//  Created by syl on 2017/6/29.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import "ViewController.h"
#import "LWCWebVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    LWCWebVC *webVC = [[LWCWebVC alloc]init];
    [webVC test];
    [self presentViewController:webVC animated:YES completion:^{}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
