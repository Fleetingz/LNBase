//
//  LNBaseNavView.m
//  LNBase
//
//  Created by zhangqiang on 2022/07/22.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import "LNBaseNavView.h"
#import <Masonry/Masonry.h>
#import "LNBase.h"

@interface LNBaseNavView ()
@property (nonatomic,strong) UILabel *navTitleLB;
@property (strong, nonatomic) UIView *goBackView;
@property (nonatomic,strong) UIView *navBgView;
@property (nonatomic,strong) UIButton *gobackBtn;
@end

@implementation LNBaseNavView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        
        self.navBgColor = LN_ColorFFFFFF;
        self.navTitleColor = LN_Color333333;
        
        [self initUI];
    }
    return self;
}

- (void)initUI {
    [self.navBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self);
        make.height.mas_equalTo(LN_NavBarHeight);
    }];
    [self.goBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(self.navBgView);
        make.width.mas_equalTo(self.goBackView.mas_height);
    }];
    [self.gobackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.goBackView);
        make.top.bottom.mas_equalTo(self.goBackView);
        make.width.mas_equalTo(self.goBackView.mas_height);
    }];
    [self.navTitleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.navBgView);
    }];
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"LNBase" ofType:@"bundle"];
    UIImage *gobackImage= [UIImage imageWithContentsOfFile:[bundlePath stringByAppendingPathComponent:@"ln_back_gray.png"]];
    [self.gobackBtn setImage:gobackImage forState:UIControlStateNormal];
}

- (void)setNavBgColor:(UIColor *)navBgColor {
    _navBgColor = navBgColor;
}

- (void)setNavTitleColor:(UIColor *)navTitleColor {
    _navTitleColor = navTitleColor;
}

/// 默认导航栏
/// @param title 标题
- (void)setDefaultNavWithTitle:(NSString *)title {
    self.hidden = NO;
    self.backgroundColor = self.navBgColor;
    self.navTitleLB.text = title;
    self.navTitleLB.textColor = self.navTitleColor;
    [self.superview bringSubviewToFront:self];
}

/// 自定义导航栏样式
/// @param title 标题
- (void)setDefaultNavWithTitle:(NSString *)title navBgColor:(UIColor *)navBgColor navTitleColor:(UIColor *)navTitleColor {
    self.hidden = NO;
    self.backgroundColor = navBgColor;
    self.navTitleLB.text = title;
    self.navTitleLB.textColor = navTitleColor;
    [self.superview bringSubviewToFront:self];
}

#pragma mark - action
- (void)gobackClick {
    if (self.gobackBlock) {
        self.gobackBlock();
    }
}

#pragma mark - lazy
- (UIView *)navBgView {
    if (!_navBgView) {
        _navBgView = [[UIView alloc] init];
        [self addSubview:_navBgView];
    }
    return _navBgView;
}
- (UIView *)goBackView {
    if (!_goBackView) {
        _goBackView = [[UIView alloc] init];
        [self.navBgView addSubview:_goBackView];
    }
    return _goBackView;
}
- (UILabel *)navTitleLB {
    if (!_navTitleLB) {
        _navTitleLB = [[UILabel alloc] init];
        [self.navBgView addSubview:_navTitleLB];
    }
    return _navTitleLB;
}
- (UIButton *)gobackBtn {
    if (!_gobackBtn) {
        _gobackBtn = [[UIButton alloc] init];
        [_gobackBtn addTarget:self action:@selector(gobackClick) forControlEvents:UIControlEventTouchUpInside];
        [self.goBackView addSubview:_gobackBtn];
    }
    return _gobackBtn;
}

@end
