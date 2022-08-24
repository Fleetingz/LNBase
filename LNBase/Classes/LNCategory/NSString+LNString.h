//
//  NSString+LNString.h
//  LNBase
//
//  Created by zhangqiang on 2022/08/09.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SCString)

/// 手机号正则表达式
- (BOOL)isPhoneNum;

/// 小写MD5
- (NSString*)md532BitLower;

/// 大写MD5
- (NSString*)md532BitUpper;

/// 倒序
- (NSString *)reverse;

/// 判断字符串是否为空
- (BOOL)isEmpty;

/// 获取auth认证加密签名
/// @param key key
- (NSString *)hmacStringWithKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
