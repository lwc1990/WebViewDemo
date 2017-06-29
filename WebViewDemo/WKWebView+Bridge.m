//
//  WKWebView+Bridge.m
//  WebViewDemo
//
//  Created by syl on 2017/6/29.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import "WKWebView+Bridge.h"
#import "WKWebViewJavascriptBridge.h"
#import <objc/runtime.h>
#import "UIView+Responder.h"
#import "LWCWebVC.h"


@implementation WKWebView (Bridge)
@dynamic bridge;
-(void)loadRequestWithBridge:(NSString *)urlStr addBridge:(BOOL)addBridge vc:(UIViewController *)vc changeTitle:(BOOL)changeTitle
{
    NSAssert(vc != nil,@"webView的viewController不能为nil");
    if (!urlStr || [urlStr isEqualToString:@""])
    {
        NSLog(@"网页异常");
        return;
    }
    self.UIDelegate = self;
    self.navigationDelegate = self;
    [self loadRequestWithCookie:urlStr];
    if (addBridge) [self addBridge:vc];
    
}
-(void)loadHTMLString:(NSString *)name
{
    if (!name || [name isEqualToString:@""]) return;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:name ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [self loadHTMLString:htmlString baseURL:[NSURL URLWithString:filePath]];
    self.UIDelegate = self;
    [self addBridge:[self viewControllerResponderForView:[LWCWebVC class]]];
}
-(void)loadRequestWithCookie:(NSString *)webUrl
{
    [self.configuration.userContentController removeAllUserScripts];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:webUrl] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10.f];
    NSString *sessionId = [self createSessionId];
    NSString *source = [NSString stringWithFormat:@"document.cookie = 'SESSIONID=%@';",sessionId];
    WKUserScript *cookieScript = [[WKUserScript alloc]initWithSource:source injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
    [self.configuration.userContentController addUserScript:cookieScript];
    source = [NSString stringWithFormat:@"SESSIONID=%@;",sessionId];
    [request addValue:source forHTTPHeaderField:@"Cookie"];
    [self loadRequest:request];
}
-(NSString *)createSessionId
{
    NSString *sessionId = nil;
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    sessionId = version;
    return sessionId;
}
-(void)addBridge:(UIViewController *)vc
{
#ifdef DEBUG 
    [WKWebViewJavascriptBridge enableLogging];
#endif
    objc_removeAssociatedObjects(self);
    WKWebViewJavascriptBridge *bridge = [WKWebViewJavascriptBridge bridgeForWebView:self];
    [bridge setWebViewDelegate:self];
    [bridge disableJavscriptAlertBoxSafetyTimeout];
    objc_setAssociatedObject(self, @selector(bridge),bridge, OBJC_ASSOCIATION_RETAIN);
    //注册js call oc的API
    [self testWebVCBridge:vc];

}
-(WKWebViewJavascriptBridge *)bridge
{
    WKWebViewJavascriptBridge *bridge = objc_getAssociatedObject(self, _cmd);
    return bridge;
}
-(void)testWebVCBridge:(UIViewController *)vc
{
    [self.bridge registerHandler:@"test" handler:^(id data, WVJBResponseCallback responseCallback) {
        if (![data isKindOfClass:[NSString class]]) return ;
        if ([data isEqualToString:@""])return;
        NSLog(@"XXXXXX:%@",(NSString *)data);
    }];
}
    














@end
