//
//  UIImage+LNImage.h
//  LNBase
//
//  Created by zhangqiang on 2022/07/22.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LNImage)

/// 根据颜色 大小生成image
/// @param color 颜色
/// @param size 大小
+ (UIImage *)ln_imageWithColor:(UIColor *)color size:(CGSize)size;

/// 根据颜色生成image
/// @param color 颜色
+ (UIImage *)ln_imageWithColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
