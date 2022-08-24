//
//  UILabel+LNLabel.h
//  LNBase
//
//  Created by zhangqiang on 2022/07/26.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (LNLabel)

/// 设置富文本文字
/// @param firstStr 第一个字符串
/// @param secondStr 第二个字符串
/// @param firstFont 第一个字体
/// @param secondFont 第二个字体
/// @param firstColor 第一个颜色
/// @param secondColor 第二个颜色
- (void)ln_setAttributedTextWithFirstStr:(NSString *)firstStr SecondStr:(NSString *)secondStr FirstFont:(UIFont *)firstFont SecondFont:(UIFont *)secondFont FirstColor:(UIColor *)firstColor SecondColor:(UIColor *)secondColor;

/// label添加渐变色
/// @param startColor 开始渐变色
/// @param endColor 结束渐变色
- (void)ln_setGradientRefWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor;

/// 设置字间距、行间距
/// @param totalStr 文本
/// @param lineSpace 行间距
/// @param textSpace 字间距
/// @param textAlignment 水平位置
- (void)ln_setAttributtedStringTotalStr:(NSString *)totalStr LineSpace:(CGFloat)lineSpace TextSpace:(CGFloat)textSpace NSTextAlignment:(NSTextAlignment)textAlignment;

@end

NS_ASSUME_NONNULL_END
