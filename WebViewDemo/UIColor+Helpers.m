//
//  UIColor+Helpers.m
//  WordPress
//
//  Created by Danilo Ercoli on 07/06/12.
//  Copyright (c) 2012 WordPress. All rights reserved.
//

#import "UIColor+Helpers.h"

@implementation UIColor (Helpers)

//[UIColor UIColorFromRGBAColorWithRed:10 green:20 blue:30 alpha:0.8]
+(UIColor *)UIColorFromRGBAColorWithRed: (CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a {
    return [UIColor colorWithRed: r/255.0 green: g/255.0 blue: b/255.0 alpha:a];
}

//[UIColor UIColorFromRGBColorWithRed:10 green:20 blue:30]
+(UIColor *)UIColorFromRGBColorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b {
    return [UIColor colorWithRed: r/255.0 green: g/255.0 blue: b/255.0 alpha: 0.5];
}

//[UIColor UIColorFromHex:0xc5c5c5 alpha:0.8];
+(UIColor *)UIColorFromHex:(NSUInteger)rgb alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0
                          green:((float)((rgb & 0xFF00) >> 8))/255.0
                           blue:((float)(rgb & 0xFF))/255.0
                          alpha:alpha];
}

//[UIColor UIColorFromHex:0xc5c5c5];
+(UIColor *)UIColorFromHex:(NSUInteger)rgb {
    return [UIColor UIColorFromHex:rgb alpha:1.0];
}

+(UIColor *)colorFromString:(NSString *)colorStr
{
    if (![colorStr isKindOfClass:[NSString class]]) {
        return [UIColor whiteColor];
    }
    if ([colorStr hasPrefix:@"#"]) {
        colorStr = [colorStr substringFromIndex:1];
        
        int colorNumber = strtohex(colorStr.UTF8String);
        return [UIColor UIColorFromHex:colorNumber];
        
    }else{
        colorStr = [colorStr lowercaseString];
        colorStr = [colorStr stringByAppendingString:@"Color"];
        
        if ([UIColor respondsToSelector:NSSelectorFromString(colorStr)]) {
            return [UIColor performSelector:NSSelectorFromString(colorStr)];
        }
    }
    //默认颜色
    return [UIColor whiteColor];
}

int strtohex(const char *ch)
{
    int i=0, tmp, result=0;
    
    for(i=0; i<strlen(ch); i++) /* 把字符一个一个转成16进制数 */
    {
        if((ch[i]>='0')&&(ch[i]<='9'))
            tmp = ch[i]-'0';
        else if((ch[i]>='A')&&(ch[i]<='F'))
            tmp = ch[i]-'A'+10;
        else if((ch[i]>='a')&&(ch[i]<='f'))
            tmp = ch[i]-'a'+10;
        else
            return -1;  /* 出错了 */
        
        result = result*16+tmp;  /* 转成16进制数后加起来 */
    }
    
    return result;
}

@end
