//
//  NSString+LNString.m
//  LNBase
//
//  Created by zhangqiang on 2022/08/09.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import "NSString+LNString.h"
#import <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonCrypto.h>

@implementation NSString (SCString)

/// 手机号正则表达式
- (BOOL)isPhoneNum {
    NSString *MOBILE = @"^1(3[0-9]|4[579]|5[0-35-9]|6[6]|7[0-35-9]|8[0-9]|9[89])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:self];
}

/// 小写MD5
- (NSString*)md532BitLower {
    const char *cStr = [self UTF8String];
    unsigned char result[16];

    NSNumber *num = [NSNumber numberWithUnsignedLong:strlen(cStr)];
    CC_MD5( cStr,[num intValue], result );

    return [[NSString stringWithFormat:
    @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
    result[0], result[1], result[2], result[3],
    result[4], result[5], result[6], result[7],
    result[8], result[9], result[10], result[11],
    result[12], result[13], result[14], result[15]
    ] lowercaseString];
}

/// 大写MD5
- (NSString*)md532BitUpper {
    const char *cStr = [self UTF8String];
    unsigned char result[16];

    NSNumber *num = [NSNumber numberWithUnsignedLong:strlen(cStr)];
    CC_MD5( cStr,[num intValue], result );

    return [[NSString stringWithFormat:
    @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
    result[0], result[1], result[2], result[3],
    result[4], result[5], result[6], result[7],
    result[8], result[9], result[10], result[11],
    result[12], result[13], result[14], result[15]
    ] uppercaseString];
}

/// 倒序
- (NSString *)reverse {
    NSMutableString *result = [[NSMutableString alloc] initWithCapacity: [self length]];
    for (NSInteger i = self.length - 1; i >= 0; i --) {
        [result appendFormat: @"%c" , [self characterAtIndex: i]];
    }
    return result;
}

/// 判断字符串是否为空
- (BOOL)isEmpty {
    
    if (!self) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (self.length == 0) {
        return YES;
    }
    if ([self isEqualToString:@"(null)"]) {
        return YES;
    }
    if ([self isEqualToString:@""]) {
        return YES;
    }
    if (self == nil) {
        return YES;
    }
    
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:set];
    if (!trimmedString.length) {
        return YES;
    }
    return NO;
}

/// 获取auth认证加密签名
/// @param key key
- (NSString *)hmacStringWithKey:(NSString *)key {
    
    NSData *valueData = [self dataUsingEncoding:NSUTF8StringEncoding];
    CCHmacAlgorithm alg = kCCHmacAlgMD5;
    
    size_t size = CC_MD5_DIGEST_LENGTH;
    unsigned char result[size];
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    CCHmac(alg, cKey, strlen(cKey), valueData.bytes, self.length, result);
    NSMutableString *hash = [NSMutableString stringWithCapacity:size * 2];
    for (int i = 0; i < size; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

/// 字典转json字符串
- (NSString *)jsonPrettyStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        if (!error) return json;
    }
    return nil;
}

@end
