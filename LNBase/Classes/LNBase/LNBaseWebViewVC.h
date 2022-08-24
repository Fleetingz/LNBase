//
//  LNBaseWebViewVC.h
//  LNBase
//
//  Created by zhangqiang on 2022/08/05.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import "LNBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNBaseWebViewVC : LNBaseViewController

/* webUrl */
@property (nonatomic, copy) NSString *webUrl;

/* navTitle */
@property (nonatomic, copy) NSString *navTitle;

/* isPush */
@property (nonatomic, assign) BOOL isPush;

@end

NS_ASSUME_NONNULL_END
