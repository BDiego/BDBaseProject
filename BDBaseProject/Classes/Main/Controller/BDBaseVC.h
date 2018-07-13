//
//  BDBaseVC.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BDViewControllerProtocol.h"

@interface BDBaseVC : UIViewController<BDViewControllerProtocol>

- (void)changeStatusBarStyle:(UIStatusBarStyle)statusBarStyle
             statusBarHidden:(BOOL)statusBarHidden
     changeStatusBarAnimated:(BOOL)animated;

- (void)hideNavigationBar:(BOOL)isHide
                 animated:(BOOL)animated;

@end


