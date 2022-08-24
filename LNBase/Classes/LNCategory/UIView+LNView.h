//
//  UIView+LNView.h
//  LNBase
//
//  Created by zhangqiang on 2022/07/22.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LNView)

@property (nonatomic, assign) CGPoint ln_origin;
@property (nonatomic, assign) CGSize ln_size;

@property (nonatomic, assign) CGFloat ln_cX;
@property (nonatomic, assign) CGFloat ln_cY;

@property (nonatomic, assign) CGFloat ln_originX;
@property (nonatomic, assign) CGFloat ln_originY;

@property (nonatomic) CGFloat ln_left;
@property (nonatomic) CGFloat ln_top;
@property (nonatomic) CGFloat ln_right;
@property (nonatomic) CGFloat ln_bottom;

@property (nonatomic, assign) CGFloat ln_frameWidth;
@property (nonatomic, assign) CGFloat ln_frameHeight;

/// 添加Tap手势
/// @param target target
/// @param action action
- (void)ln_addTapGestureRecognizerWithTarget:(id)target action:(SEL)action;

/// 添加Pan点击手势
/// @param target target
/// @param action action
- (void)ln_addPanGestureRecognizerWithTarget:(id)target action:(SEL)action;

/// 添加Long点击手势
/// @param target target
/// @param action action
- (void)ln_addLongPressGestureRecognizerWithTarget:(id)target action:(SEL)action;

/// 圆角
/// @param cornerRadius cornerRadius
- (void)ln_setWithCornerRadius:(CGFloat)cornerRadius;

/// 设置阴影
/// @param opacity 阴影透明度
/// @param shadowColor 阴影颜色
/// @param shadowOffset 阴影偏移量
/// @param shadowRadius 阴影圆角
/// @param cornerRadius view圆角
- (void)ln_setShadowOpacity:(CGFloat)opacity ShadowColor:(CGColorRef)shadowColor ShadowOffset:(CGSize)shadowOffset ShadowRadius:(CGFloat)shadowRadius CornerRadius:(CGFloat)cornerRadius;

/// 利用贝塞尔曲线添加指定位置圆角
/// @param conrners 圆角位置
/// @param cornerRadii 圆角大小
- (void)ln_setBezierPathWithRoundingCorners:(UIRectCorner)conrners CornerRadii:(CGSize)cornerRadii;

@end

NS_ASSUME_NONNULL_END
