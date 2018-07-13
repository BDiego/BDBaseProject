//
//  MBProgressHUD+add.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//


#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (add)

/**1.5秒后自动消失HUD*/
+ (void)add_showHUDWithTitle:(NSString *)title;
/**不会自动消失的HUD*/
+ (void)add_showNOHidHUDWithTitle:(NSString *)title;
/**有小菊花的HUD*/
+ (void)add_showHaveImageHUDWithTitle:(NSString *)title;
/**隐藏HUD*/
+ (void)add_hideHUD;

+ (void)add_hideHUD:(CGFloat)afterDelay;

+(instancetype)share;

@end
