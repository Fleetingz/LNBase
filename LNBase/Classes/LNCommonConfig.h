//
//  LNCommonConfig.h
//  LNBase
//
//  Created by zhangqiang on 2022/07/22.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LNIndexBlock)   (NSInteger index);
typedef void(^LNVoidBlock)    (void);
typedef void(^LNObjBlock)     (id obj);
typedef void(^LNBoolBlock)    (BOOL value);
typedef void(^LNFileBlock)    (NSString *fileName, NSString *url);

#define LNWeakSelf __weak __typeof(self)weakSelf = self

#define LNUSERDEFAULTS [NSUserDefaults standardUserDefaults]

