//
//  UIColor+LNColor.h
//  LNBase
//
//  Created by zhangqiang on 2022/07/22.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (LNColor)

/// 获取一个随机色
+ (UIColor *)ln_randomColor;

/// 16进制字符串转颜色 - #000000
/// @param color 颜色
+ (UIColor *)ln_colorWithHexString:(NSString *)color;

/// 16进制字符串转颜色 - #000000
/// @param color 颜色
/// @param alpha 透明度
- (UIColor *)ln_colorWithHexString:(NSString *)color alpha:(float)alpha;

@end

NS_ASSUME_NONNULL_END
