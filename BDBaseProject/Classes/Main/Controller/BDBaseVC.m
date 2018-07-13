//
//  BDBaseVC.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "BDBaseVC.h"

@interface BDBaseVC ()

@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;
@property (nonatomic, assign) BOOL statusBarHidden;
@property (nonatomic, assign) BOOL changeStatusBarAnimated;

@end

@implementation BDBaseVC

- (void)loadView{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
     self.view.backgroundColor = [UIColor whiteColor];
    [self constructContentView];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self didConstructedContentView];
    
    [self resizeContentView];
    
    [self setIsExtendLayout:NO];
    
}

- (void)setIsExtendLayout:(BOOL)isExtendLayout {
    
    if (!isExtendLayout) {
        [self initializeSelfVCSetting];
    }
}

- (void)initializeSelfVCSetting {
    
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        [self setAutomaticallyAdjustsScrollViewInsets:NO];
    }
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout=UIRectEdgeNone;
    }

}

- (void)constructContentView{}

- (void)didConstructedContentView{}

- (void)resizeContentView{}

//MARK: request
- (void)onRequest{
    [self onRefresh];
}

- (void)onRefresh{}

- (void)onLoadMore{}

//MARK: routine -
- (UIStatusBarStyle)preferredStatusBarStyle {
    if (self.statusBarStyle) {
        return self.statusBarStyle;
    } else {
        return UIStatusBarStyleLightContent;
    }
}

- (BOOL)prefersStatusBarHidden {
    return self.statusBarHidden;
}

- (void)changeStatusBarStyle:(UIStatusBarStyle)statusBarStyle
             statusBarHidden:(BOOL)statusBarHidden
     changeStatusBarAnimated:(BOOL)animated {
    
    self.statusBarStyle=statusBarStyle;
    self.statusBarHidden=statusBarHidden;
    if (animated) {
        [UIView animateWithDuration:0.25 animations:^{
            [self setNeedsStatusBarAppearanceUpdate];
        }];
    }
    else{
        [self setNeedsStatusBarAppearanceUpdate];
    }
}

- (void)hideNavigationBar:(BOOL)isHide
                 animated:(BOOL)animated{
    if (animated) {
        [UIView animateWithDuration:0.25 animations:^{
            self.navigationController.navigationBarHidden=isHide;
        }];
    }
    else{
        self.navigationController.navigationBarHidden=isHide;
    }
}

- (UIBarButtonItem *)rt_customBackItemWithTarget:(id)target action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    UIImage * image = [UIImage imageNamed:@"btn_back_white"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [button setImage:image forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button sizeToFit];
    button.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //Border(button);
    return [[UIBarButtonItem alloc] initWithCustomView:button];

}

-(void)creatLeftItemTarget:(id)target selector:(SEL)selector{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 44, 44);
    if (selector == nil) {
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    } else {
        [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, -35, 0, 0);
    UIImage * image = [UIImage imageNamed:@"btn_back_white"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [btn setImage:image forState:UIControlStateNormal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item;
}

-(void)creatRightItemTarget:(id)target selector:(SEL)selector Title:(NSString *)title Image:(UIImage *)image{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:kWhiteColor forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    } else {
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [btn setImage:image forState:UIControlStateNormal];
    }
    [btn sizeToFit];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
}


-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
