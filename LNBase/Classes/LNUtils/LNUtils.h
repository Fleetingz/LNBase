//
//  LNUtils.h
//  LNBase
//
//  Created by zhangqiang on 2022/07/22.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LNUtils : NSObject

/// 获取ios设备UUID
+ (NSString *)getDeviceID;

/// 获取最顶层VC
+ (UIViewController *)topViewController;

/// 获取当前时间戳-秒
+ (NSInteger)getNowTimestamp;

/// 获取当前时间戳-毫秒
+ (NSString *)getNowTimeMillisecond;

/// 获取version
+ (NSString *)getVersion;

@end

NS_ASSUME_NONNULL_END
