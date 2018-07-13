//
//  MBProgressHUD+add.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//


#import "MBProgressHUD+add.h"
#import "AppDelegate.h"
#import <objc/runtime.h>

#define kAppDelegate ((AppDelegate *)[[UIApplication  sharedApplication] delegate])
#define kGetWindow [UIApplication sharedApplication].keyWindow

static const char *kWindowHUDKey = "kWindowHUDKey";

@implementation MBProgressHUD (add)

+(instancetype)share{
    
    MBProgressHUD *hud = objc_getAssociatedObject(kGetWindow, kWindowHUDKey);
    if (!hud) {
        hud = [[MBProgressHUD alloc] initWithView:kGetWindow];
        hud.userInteractionEnabled = YES;
        objc_setAssociatedObject(kGetWindow, kWindowHUDKey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        hud.label.font = [UIFont systemFontOfSize:15];
        hud.detailsLabel.font = [UIFont systemFontOfSize:15];
        [kGetWindow addSubview:hud];
    }
    return hud;
}

+(void)add_showHUDWithTitle:(NSString *)title{
    [MBProgressHUD add_showNOHidHUDWithTitle:title];
    [MBProgressHUD add_hideHUD:1.5];
}

+(void)add_showNOHidHUDWithTitle:(NSString *)title{
    MBProgressHUD *hud = [MBProgressHUD share];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabel.text = title;
    hud.margin = 20;
    [hud showAnimated:YES];
    [kGetWindow bringSubviewToFront:hud];
}

+(void)add_showHaveImageHUDWithTitle:(NSString *)title{
    MBProgressHUD *hud = [MBProgressHUD share];
    hud.mode                    = MBProgressHUDModeIndeterminate;
    hud.detailsLabel.text               = title;
    [hud showAnimated:YES];
    [kGetWindow bringSubviewToFront:hud];
}

+ (void)add_hideHUD{
    [MBProgressHUD customHide];
}

+(void)customHide{
    [[MBProgressHUD share] hideAnimated:YES];
    MBProgressHUD *hud = [MBProgressHUD share];
    if (hud) {
        [kGetWindow sendSubviewToBack:hud];
    }
}

+ (void)add_hideHUD:(CGFloat)afterDelay{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(afterDelay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD customHide];
    });
}
@end
