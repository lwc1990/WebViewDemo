//
//  LWCWebVC.h
//  WebViewDemo
//
//  Created by syl on 2017/6/29.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LWCWebViewDelegate <NSObject>
@property (nonatomic,readonly,getter=isLoading) BOOL loading;
-(void)reload;
-(BOOL)canGoBack;
-(void)goBack;
-(void)stopLoading;
-(void)loadRequest:(NSURLRequest *)request;
-(void)loadRequestWithBridge:(NSString *)urlStr addBridge:(BOOL) addBridge vc:(UIViewController *)vc changeTitle:(BOOL)changeTitle;
@end
@interface LWCWebVC : UIViewController<UIWebViewDelegate,UIGestureRecognizerDelegate>
@property (nonatomic,copy) NSString *url;
@property (nonatomic,strong) UIView <LWCWebViewDelegate>*webV;
-(void)test;






@end
