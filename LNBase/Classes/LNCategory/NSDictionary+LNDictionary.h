//
//  NSDictionary+LNDictionary.h
//  LNBase
//
//  Created by zhangqiang on 2022/08/16.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (SCDictionary)

/// 字典转json字符串
- (NSString *)jsonPrettyStringEncoded;

@end

NS_ASSUME_NONNULL_END
