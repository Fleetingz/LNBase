//
//  UIButton+LNButton.h
//  LNBase
//
//  Created by zhangqiang on 2022/07/22.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

/**
 布局类型
 
 - LN_ButtonLayoutTypeNormal: 默认布局
 - LN_ButtonLayoutTypeImageRight: 文左图右
 - LN_ButtonLayoutTypeCenterImageTop: 文下图上 居中
 - LN_ButtonLayoutTypeCenterImageBottom: 图下文上 居中
 */
typedef NS_ENUM(NSInteger, LN_ButtonLayoutTypeMode) {
    LN_ButtonLayoutTypeNormal = 0,
    LN_ButtonLayoutTypeImageRight,
    LN_ButtonLayoutTypeCenterImageTop,
    LN_ButtonLayoutTypeCenterImageBottom,
};

@interface UIButton (LNButton)

@property(nonatomic, assign) LN_ButtonLayoutTypeMode ln_buttonLayoutTypeMode;

- (void)setupButtonLayoutTypeMode:(LN_ButtonLayoutTypeMode)buttonLayoutTypeMode
                               Space:(CGFloat)space;
@end

NS_ASSUME_NONNULL_END
