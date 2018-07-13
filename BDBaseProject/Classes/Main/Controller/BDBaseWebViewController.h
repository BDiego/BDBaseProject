//
//  BDBaseWebViewController.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "BDBaseVC.h"

@interface BDBaseWebViewController : BDBaseVC<UIWebViewDelegate>

@property(copy, nonatomic)NSString *url;

@property (weak, nonatomic)UIWebView *webView;

@end
