//
//  LNBaseNavView.h
//  LNBase
//
//  Created by zhangqiang on 2022/07/22.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LNCommonConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNBaseNavView : UIView

/* 导航栏背景颜色 - 默认#000000 */
@property (nonatomic, strong) UIColor *navBgColor;
/* 导航栏标题颜色 - 默认#333333 */
@property (nonatomic, strong) UIColor *navTitleColor;

/* 返回blcok */
@property (nonatomic,strong) LNVoidBlock gobackBlock;

/// 默认导航栏
/// @param title 标题
- (void)setDefaultNavWithTitle:(NSString *)title;

/// 自定义导航栏样式
/// @param title 标题
- (void)setDefaultNavWithTitle:(NSString *)title navBgColor:(UIColor *)navBgColor navTitleColor:(UIColor *)navTitleColor;

@end

NS_ASSUME_NONNULL_END
