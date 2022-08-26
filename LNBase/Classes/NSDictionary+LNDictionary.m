//
//  NSDictionary+LNDictionary.m
//  LNBase
//
//  Created by zhangqiang on 2022/08/16.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import "NSDictionary+LNDictionary.h"

@implementation NSDictionary (SCDictionary)

- (NSString *)jsonPrettyStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        if (!error) return json;
    }
    return nil;
}

@end
