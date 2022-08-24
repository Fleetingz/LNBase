//
//  UIImageView+LNImageView.h
//  LNBase
//
//  Created by zhangqiang on 2022/07/22.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (LNImageView)
/// 填充裁剪
- (void)ln_setCommonContentMode;
@end

NS_ASSUME_NONNULL_END
