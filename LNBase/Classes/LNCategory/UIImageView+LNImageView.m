//
//  UIImageView+LNImageView.m
//  LNBase
//
//  Created by zhangqiang on 2022/07/22.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import "UIImageView+LNImageView.h"

@implementation UIImageView (LNImageView)
/// 填充裁剪
- (void)ln_setCommonContentMode {
    self.clipsToBounds = YES;
    self.contentMode = UIViewContentModeScaleAspectFill;
}
@end
