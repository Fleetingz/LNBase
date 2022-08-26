//
//  UIButton+LNButton.m
//  LNBase
//
//  Created by zhangqiang on 2022/07/22.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import "UIButton+LNButton.h"

@implementation UIButton (LNButton)

/// button扩展
/// @param buttonLayoutTypeMode 模式
/// @param space 间距
- (void)setupButtonLayoutTypeMode:(LN_ButtonLayoutTypeMode)buttonLayoutTypeMode
                               Space:(CGFloat)space {
    
    self.ln_buttonLayoutTypeMode = buttonLayoutTypeMode;
    
    CGFloat image_w = self.imageView.bounds.size.width;
    CGFloat image_h = self.imageView.bounds.size.height;
    
    CGFloat title_w = self.titleLabel.bounds.size.width;
    CGFloat title_h = self.titleLabel.bounds.size.height;
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0)
    {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        title_w = self.titleLabel.intrinsicContentSize.width;
        title_h = self.titleLabel.intrinsicContentSize.height;
    }
    
    UIEdgeInsets titleEdge = UIEdgeInsetsZero;
    UIEdgeInsets imageEdge = UIEdgeInsetsZero;
    
    switch (self.ln_buttonLayoutTypeMode) {
        case LN_ButtonLayoutTypeNormal:
        {
            titleEdge = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
            imageEdge = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
        }
            break;
        case LN_ButtonLayoutTypeImageRight:
        {
            titleEdge = UIEdgeInsetsMake(0, -image_w - space, 0, image_w);
            imageEdge = UIEdgeInsetsMake(0, title_w + space, 0, -title_w);
        }
            break;
        case LN_ButtonLayoutTypeCenterImageTop:
        {
            titleEdge = UIEdgeInsetsMake(0, -image_w, -image_h - space/2, 0);
            imageEdge = UIEdgeInsetsMake(-title_h - space/2, 0, 0, -title_w);
        }
            break;
        case LN_ButtonLayoutTypeCenterImageBottom:
        {
            titleEdge = UIEdgeInsetsMake( -image_h - space, - image_w, 0, 0);
            imageEdge = UIEdgeInsetsMake(0, 0, -title_h - space, -title_w);
        }
            break;
        default:
            break;
    }
    
    self.titleEdgeInsets = titleEdge;
    self.imageEdgeInsets = imageEdge;
}

#pragma set/get -runtime

- (void)setLn_buttonLayoutTypeMode:(LN_ButtonLayoutTypeMode)ln_buttonLayoutTypeMode {
    objc_setAssociatedObject(self, @selector(ln_buttonLayoutTypeMode), @(ln_buttonLayoutTypeMode), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (LN_ButtonLayoutTypeMode)ln_buttonLayoutTypeMode {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

@end
