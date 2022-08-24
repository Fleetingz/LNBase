//
//  UILabel+LNLabel.m
//  LNBase
//
//  Created by zhangqiang on 2022/07/26.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import "UILabel+LNLabel.h"

@implementation UILabel (LNLabel)

/// 设置富文本文字
/// @param firstStr 第一个字符串
/// @param secondStr 第二个字符串
/// @param firstFont 第一个字体
/// @param secondFont 第二个字体
/// @param firstColor 第一个颜色
/// @param secondColor 第二个颜色
- (void)ln_setAttributedTextWithFirstStr:(NSString *)firstStr SecondStr:(NSString *)secondStr FirstFont:(UIFont *)firstFont SecondFont:(UIFont *)secondFont FirstColor:(UIColor *)firstColor SecondColor:(UIColor *)secondColor {
    NSString *totalStr = [NSString stringWithFormat:@"%@%@",firstStr,secondStr];
    NSMutableAttributedString *mutableString = [[NSMutableAttributedString alloc]initWithString:totalStr];
    [mutableString addAttribute:NSFontAttributeName value:firstFont range:NSMakeRange(0,firstStr.length)];
    [mutableString addAttribute:NSFontAttributeName value:secondFont range:NSMakeRange(firstStr.length,secondStr.length)];
    [mutableString addAttribute:NSForegroundColorAttributeName value:firstColor range:NSMakeRange(0, firstStr.length)];
    [mutableString addAttribute:NSForegroundColorAttributeName value:secondColor range:NSMakeRange(firstStr.length,secondStr.length)];
    self.attributedText = mutableString;
}

/// label添加渐变色
/// @param startColor 开始渐变色
/// @param endColor 结束渐变色
- (void)ln_setGradientRefWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //绘制渐变层
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradientRef = CGGradientCreateWithColors(colorSpaceRef,
                                                           (__bridge CFArrayRef)@[(id)startColor.CGColor,(id)endColor.CGColor],
                                                           NULL);
    CGPoint startPoint = CGPointZero;
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMaxY(self.bounds));
    CGContextDrawLinearGradient(context, gradientRef, startPoint, endPoint,  kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    //取到渐变图片
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    //释放资源
    CGColorSpaceRelease(colorSpaceRef);
    CGGradientRelease(gradientRef);
    UIGraphicsEndImageContext();
    self.textColor = [UIColor colorWithPatternImage:gradientImage];
}

/// 设置字间距、行间距
/// @param totalStr 文本
/// @param lineSpace 行间距
/// @param textSpace 字间距
/// @param textAlignment 水平位置
- (void)ln_setAttributtedStringTotalStr:(NSString *)totalStr LineSpace:(CGFloat)lineSpace TextSpace:(CGFloat)textSpace NSTextAlignment:(NSTextAlignment)textAlignment {
    
   NSMutableAttributedString *mutableString = [[NSMutableAttributedString alloc]initWithString:totalStr];
//    [mutableString addAttribute:NSKernAttributeName value:@(textSpace) range:NSMakeRange(0, mutableString.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace; // 设置行间距
    paragraphStyle.alignment = textAlignment; //设置两端对齐显示
    [mutableString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, mutableString.length)];
    
    self.attributedText = mutableString;
    self.lineBreakMode = NSLineBreakByTruncatingTail;
}

@end
