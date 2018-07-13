//
//  BDTabBarVC.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "BDTabBarVC.h"
#import "BDBaseNavigationVC.h"

@interface BDTabBarVC ()<UITabBarControllerDelegate>

@end

@implementation BDTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;//防止tableview错位

    [self addChildVIewControllers];
    self.delegate = self;
//    [[UITabBar appearance] setBarTintColor:kCustomMainThemeColor];
//    [UITabBar appearance].translucent = NO;
    //[[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kHexRGB(0x666666),NSForegroundColorAttributeName,[UIFont systemFontOfSize:16],NSFontAttributeName,nil]forState:UIControlStateSelected];
    
   
}

-(void)addChildVIewControllers{
    
    NSArray * VCArray = @[@"BDHomeVC",@"BDInformationeVC",@"BDMineVC"];
    NSArray * titles = @[@"首页",@"资讯",@"我的"];
    NSArray * normalImages = @[@"home_normal",@"Information_normal",@"mine_normal"];
    NSArray * selectImages = @[@"home_selected",@"Information_selected",@"mine_selected"];
    UIEdgeInsets insets = UIEdgeInsetsZero;
    for (int i = 0; i < VCArray.count; i++) {
        
        insets = UIEdgeInsetsZero;
        
        [self addChildVCWithName:VCArray[i] title:titles[i] norImageName:normalImages[i] selectedImageName:selectImages[i] insets:insets];
    }

}

#pragma mark 通过一个类创建控制器
// 通过一个类创建控制器
- (void)addChildVCWithClass:(Class)class title:(NSString *)title norImageName:(NSString *)norImageName selectedImageName:(NSString *)selectedImageName insets:(UIEdgeInsets)insets{
    
    UIViewController *vc = [[class alloc] init];
    
    [self addChildVCWithController:vc title:title norImageName:norImageName selectedImageName:selectedImageName insets:insets];
}


#pragma mark 通过一个String创建控制器
- (void)addChildVCWithName:(NSString *)name  title:(NSString *)title norImageName:(NSString *)norImageName selectedImageName:(NSString *)selectedImageName insets:(UIEdgeInsets)insets{
    
    UIViewController * vc  = [[NSClassFromString(name) alloc] init];
    
    BDBaseNavigationVC * navigationVC = [[BDBaseNavigationVC alloc]initWithRootViewController:vc];
    
    [self addChildVCWithController:navigationVC title:title norImageName:norImageName selectedImageName:selectedImageName insets:insets];
}
#pragma mark设置指定控制器的相关属性
// 设置指定控制器的相关属性
- (void)addChildVCWithController:(UIViewController *)vc  title:(NSString *)title norImageName:(NSString *)norImageName selectedImageName:(NSString *)selectedImageName insets:(UIEdgeInsets)insets{
    // 设置标题
    vc.tabBarItem.title = title;
    vc.navigationItem.title = title;
    
    // 设置默认图片
    vc.tabBarItem.image = [[UIImage imageNamed:norImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置选中图片
    vc.tabBarItem.selectedImage =  [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc.tabBarItem.imageInsets = insets;

    // 添加到父控件
    [self addChildViewController:vc];
    
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}





@end
