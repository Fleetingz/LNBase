//
//  LNViewConfig.h
//  LNBase
//
//  Created by zhangqiang on 2022/07/22.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

/** 屏幕宽高 */
#define LN_SW                       ([[UIScreen mainScreen] bounds].size.width)
#define LN_SH                       ([[UIScreen mainScreen] bounds].size.height)

/** 状态栏高度 */
#define LN_StatusBarHeight          [[UIApplication sharedApplication] statusBarFrame].size.height

/** 导航栏高度 */
#define LN_NavBarHeight             44.0

/** 导航栏+状态栏高度 */
#define LN_StatusAddNavHeight       (LN_StatusBarHeight + LN_NavBarHeight)

/** tabbarHeight */
#define LN_TabBarHeight             ([[UIApplication sharedApplication] statusBarFrame].size.height > 20 ? 83 : 49)

/** 是否横屏 */
#define LN_IS_Transverse            [UIApplication sharedApplication].statusBarOrientation == UIDeviceOrientationLandscapeRight || [UIApplication sharedApplication].statusBarOrientation == UIDeviceOrientationLandscapeLeft
#define LN_ResultSW                 IS_Transverse ? LN_SH : LN_SW

/** 比例 */
#define LN_RATIOA(a)                ((LN_SW)/375.0) * a /// 375画布比例 像素适配

/** 字体 */
#define LN_FONT(frontSize)          [UIFont systemFontOfSize:SC_RATIOA(frontSize)]
#define LN_BOLDFONT(frontSize)      [UIFont boldSystemFontOfSize:SC_RATIOA(frontSize)]

/** 图片 */
#define LN_IMGName(name)            [UIImage imageNamed:name]

/** 刘海屏 */
#define LN_IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\

/** 底部安全距离 */
#define LN_kSafeAreaBottomHeight    ([[UIApplication sharedApplication] statusBarFrame].size.height > 20 ? 34 : 0)

