//
//  BDBaseNavigationVC.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "BDBaseNavigationVC.h"

@interface BDBaseNavigationVC ()

@end

@implementation BDBaseNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

//当第一次使用这个类的时候调用1次
+ (void)initialize {
    [self setupNavigationBarTheme];
    [self setupBarButtonItemTheme];
}

//设置UINavigationBarTheme的主题
+ (void)setupNavigationBarTheme {
    
    // 设置导航栏背景颜色(navigationbar下边会有黑线)
    UINavigationBar *appearance = [UINavigationBar appearance];
    appearance.barTintColor = [UIColor whiteColor];
    
    // 设置导航栏背景  去掉navigationbar下边的黑线
//    [appearance setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
//    [appearance setShadowImage:[UIImage new]];
    
    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [appearance setTitleTextAttributes:textAttrs];
}

//设置UIBarButtonItem的主题
+ (void)setupBarButtonItemTheme
{
    //通过appearance对象能修改整个项目中所有UIBarButtonItem的样式
    //UIBarButtonItem *appearance = [UIBarButtonItem appearance];
}


@end
