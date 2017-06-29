//
//  WKWebView+Bridge.h
//  WebViewDemo
//
//  Created by syl on 2017/6/29.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import <WebKit/WebKit.h>
@class WKWebViewJavascriptBridge;
@interface WKWebView (Bridge)<WKNavigationDelegate,WKUIDelegate>
@property (nonatomic,strong) WKWebViewJavascriptBridge *bridge;
-(void)loadRequestWithBridge:(NSString *)urlStr addBridge:(BOOL)addBridge vc:(UIViewController *)vc changeTitle:(BOOL)changeTitle;
-(void) loadHTMLString:(NSString *)name;
@end
