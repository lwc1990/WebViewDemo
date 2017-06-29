//
//  UIView+Responder.h
//  WebViewDemo
//
//  Created by syl on 2017/6/29.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Responder)
-(UIViewController *)viewControllerResponderForView:(Class)vcClass;
@end
