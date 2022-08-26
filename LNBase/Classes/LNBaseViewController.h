//
//  LNBaseViewController.h
//  LNBase
//
//  Created by zhangqiang on 2022/07/22.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LNBaseNavView.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNBaseViewController : UIViewController

/* 自定义导航栏 */
@property (strong, nonatomic) LNBaseNavView *baseNavView;

- (void)baseGoback;

@end

NS_ASSUME_NONNULL_END
