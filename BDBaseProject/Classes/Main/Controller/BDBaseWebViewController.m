//
//  BDBaseWebViewController.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "BDBaseWebViewController.h"
#import "BDBaseNavigationVC.h"
#import "UIScrollView+refresh.h"


@interface BDBaseWebViewController ()

@end

@implementation BDBaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    web.opaque = NO;
    web.scalesPageToFit = YES;
    self.webView = web;
    self.webView.delegate = self;
    [self.view addSubview:web];
    
    
    [web mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];

    
    [self.webView.scrollView scrollViewCreatRefreshWtihTarget:self HeadSelector:@selector(reload) footerSelector:nil];

    [self.webView.scrollView.mj_header beginRefreshing];

}

- (void)reload {
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.webView.scrollView.mj_header endRefreshing];
//    [self.webView.scrollView removeErrorView];
//    [self.webView.scrollView stopRefresh];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    //    [self.webView.scrollView showServerErrorWithBlock:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
