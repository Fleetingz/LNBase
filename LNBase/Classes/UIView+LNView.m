//
//  UIView+LNView.m
//  LNBase
//
//  Created by zhangqiang on 2022/07/22.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import "UIView+LNView.h"

@implementation UIView (LNView)

- (CGPoint)ln_origin {
    return self.frame.origin;
}

- (void)setLn_origin:(CGPoint)ln_origin {
    self.frame = CGRectMake(ln_origin.x, ln_origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGSize)ln_size {
    return self.frame.size;
}

- (void)setLn_size:(CGSize)ln_size {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, ln_size.width, ln_size.height);
}

- (CGFloat)ln_cX {
    return self.center.x;
}

- (void)setLn_cX:(CGFloat)ln_cX {
    CGPoint center = self.center;
    center.x = ln_cX;
    self.center = center;
}

- (CGFloat)ln_cY {
    return self.center.y;
}

- (void)setLn_cY:(CGFloat)ln_cY {
    CGPoint center = self.center;
    center.y = ln_cY;
    self.center = center;
}

- (CGFloat)ln_originX {
    return self.frame.origin.x;
}

- (void)setLn_originX:(CGFloat)ln_originX {
    self.frame = CGRectMake(ln_originX, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)ln_originY {
    return self.frame.origin.y;
}

- (void)setLn_originY:(CGFloat)ln_originY {
    self.frame = CGRectMake(self.frame.origin.x, ln_originY, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)ln_frameWidth {
    return self.frame.size.width;
}

- (void)setLn_frameWidth:(CGFloat)ln_frameWidth {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, ln_frameWidth, self.frame.size.height);
}

- (CGFloat)ln_frameHeight {
    return self.frame.size.height;
}

- (void)setLn_frameHeight:(CGFloat)ln_frameHeight {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, ln_frameHeight);
}

- (CGFloat)ln_left {
    return self.frame.origin.x;
}

- (void)setLn_left:(CGFloat)ln_left {
    CGRect frame = self.frame;
    frame.origin.x = ln_left;
    self.frame = frame;
}

- (CGFloat)ln_top {
    return self.frame.origin.y;
}

- (void)setLn_top:(CGFloat)ln_top {
    CGRect frame = self.frame;
    frame.origin.y = ln_top;
    self.frame = frame;
}

- (CGFloat)ln_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setLn_right:(CGFloat)ln_right {
    CGRect frame = self.frame;
    frame.origin.x = ln_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)ln_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setLn_bottom:(CGFloat)ln_bottom {
    CGRect frame = self.frame;
    frame.origin.y = ln_bottom - frame.size.height;
    self.frame = frame;
}

/// 添加Tap手势
/// @param target target
/// @param action action
- (void)ln_addTapGestureRecognizerWithTarget:(id)target action:(SEL)action {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

/// 添加Pan点击手势
/// @param target target
/// @param action action
- (void)ln_addPanGestureRecognizerWithTarget:(id)target action:(SEL)action {
    UIPanGestureRecognizer *tap = [[UIPanGestureRecognizer alloc]initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

/// 添加Long点击手势
/// @param target target
/// @param action action
- (void)ln_addLongPressGestureRecognizerWithTarget:(id)target action:(SEL)action {
    UILongPressGestureRecognizer *tap = [[UILongPressGestureRecognizer alloc]initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

/// 圆角
/// @param cornerRadius cornerRadius
- (void)ln_setWithCornerRadius:(CGFloat)cornerRadius {
    self.clipsToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
}

/// 设置阴影
/// @param opacity 阴影透明度
/// @param shadowColor 阴影颜色
/// @param shadowOffset 阴影偏移量
/// @param shadowRadius 阴影圆角
/// @param cornerRadius view圆角
- (void)ln_setShadowOpacity:(CGFloat)opacity ShadowColor:(CGColorRef)shadowColor ShadowOffset:(CGSize)shadowOffset ShadowRadius:(CGFloat)shadowRadius CornerRadius:(CGFloat)cornerRadius {
    self.layer.shadowColor = shadowColor;
    self.layer.shadowOffset = shadowOffset;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = shadowRadius;
    self.layer.cornerRadius = cornerRadius;
}

/// 利用贝塞尔曲线添加指定位置圆角
/// @param conrners 圆角位置
/// @param cornerRadii 圆角大小
- (void)ln_setBezierPathWithRoundingCorners:(UIRectCorner)conrners CornerRadii:(CGSize)cornerRadii {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:conrners cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
