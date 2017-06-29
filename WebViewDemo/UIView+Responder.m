//
//  UIView+Responder.m
//  WebViewDemo
//
//  Created by syl on 2017/6/29.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import "UIView+Responder.h"

@implementation UIView (Responder)
-(UIViewController *)viewControllerResponderForView:(Class)vcClass
{
    if (!vcClass)
    {
        vcClass = [UIViewController class];
    }
    UIResponder *responder = self;
    while ((responder = [responder nextResponder]))
    {
        if ([responder isKindOfClass:vcClass])
        {
            return (UIViewController *)responder;
        }
    }
    return nil;
}
@end
