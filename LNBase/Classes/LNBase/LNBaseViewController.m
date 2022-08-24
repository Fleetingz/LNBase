//
//  LNBaseViewController.m
//  LNBase
//
//  Created by zhangqiang on 2022/07/22.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import "LNBaseViewController.h"
#import <Masonry/Masonry.h>
#import "LNBase.h"

@interface LNBaseViewController ()

@end

@implementation LNBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    [self.baseNavView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(LN_StatusAddNavHeight);
    }];
    [self.view bringSubviewToFront:self.baseNavView];
    LNWeakSelf;
    self.baseNavView.gobackBlock = ^{
        [weakSelf baseGoback];
    };
}

- (void)baseGoback {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
   return  UIStatusBarStyleDefault;
}

#pragma mark - lazy
- (LNBaseNavView *)baseNavView {
    if (!_baseNavView) {
        _baseNavView = [[LNBaseNavView alloc] init];
        _baseNavView.hidden = YES;
        [self.view addSubview:_baseNavView];
    }
    return _baseNavView;
}

@end
