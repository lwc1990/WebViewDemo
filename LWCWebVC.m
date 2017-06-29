//
//  LWCWebVC.m
//  WebViewDemo
//
//  Created by syl on 2017/6/29.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import "LWCWebVC.h"
#import "WKWebView+Bridge.h"
#import "LWC_MEASURE.h"
@interface LWCWebVC ()
@property (nonatomic,strong) WKProcessPool *processPool;
@end

@implementation LWCWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadRequest];
}
-(void)loadRequest
{
    [self.webV loadRequestWithBridge:@"11" addBridge:YES vc:self changeTitle:YES];
}
-(id<LWCWebViewDelegate>)webV
{
    if (!_webV)
    {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc]init];
        config.processPool = [self processPool];
        WKWebView *wkWebV = [[WKWebView alloc]initWithFrame:CGRectZero configuration:config];
        wkWebV.scrollView.scrollsToTop = YES;
        _webV = (UIView<LWCWebViewDelegate>*)wkWebV;
        [_webV setFrame:CGRectMake(0,64,SCREEN_WIDTH,SCREEN_HEIGHT - 64)];
        [self.view addSubview:_webV];
    }
    return _webV;
}
-(WKProcessPool *)processPool
{
    if (_processPool) return _processPool;
    _processPool = [[WKProcessPool alloc]init];
    return _processPool;
}
-(void)test
{
    [self.webV performSelector:@selector(loadHTMLString:) withObject:@"ExampleApp"];
}
#pragma mark - load start
-(void)webViewStartLoadAction:(NSNotification *)noti
{
    
}

#pragma mark - load complete
-(void)webViewFinishLoadAction:(NSNotification *)noti
{
}

#pragma mark - load Failure
-(void)webViewFailLoadAction:(NSNotification *)noti
{
}

-(void)dealTheLoadError:(NSDictionary *)userInfo
{

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
