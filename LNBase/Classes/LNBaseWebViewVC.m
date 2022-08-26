//
//  LNBaseWebViewVC.m
//  LNBase
//
//  Created by zhangqiang on 2022/08/05.
//  Copyright © 2022 Fleetingz. All rights reserved.
//

#import "LNBaseWebViewVC.h"
#import <WebKit/WebKit.h>
#import <Masonry/Masonry.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "LNBase.h"

@interface LNBaseWebViewVC ()<WKUIDelegate, WKNavigationDelegate>
/* webView */
@property (nonatomic, strong) WKWebView *webView;
@end

@implementation LNBaseWebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(LN_StatusAddNavHeight);
        make.left.bottom.right.mas_equalTo(self.view);
    }];
    
    [self.baseNavView setDefaultNavWithTitle:self.navTitle];
    
    NSURL *url = [NSURL URLWithString:self.webUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)baseGoback {
    if (self.isPush) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else {
        [self dismissViewControllerAnimated:YES completion:^{
                
        }];
    }
}

// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    [SVProgressHUD show];
}

/// 开始获取到网页内容时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation {
    
}

/// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    [SVProgressHUD dismiss];
}

#pragma mark - lazy
- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] init];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        [self.view addSubview:_webView];
    }
    return _webView;
}

@end
