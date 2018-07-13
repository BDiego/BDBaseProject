//
//  BDPublicFunctions.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "BDPublicFunctions.h"
#import <objc/runtime.h>

@implementation BDPublicFunctions

UIWindow *mainWindow() {
    id appDelegate = [UIApplication sharedApplication].delegate;
    if (appDelegate && [appDelegate respondsToSelector:@selector(window)]) {
        return [appDelegate window];
    }
    
    NSArray *windows = [UIApplication sharedApplication].windows;
    if ([windows count] == 1) {
        return [windows firstObject];
    }
    else {
        for (UIWindow *window in windows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                return window;
            }
        }
    }
    return nil;
}

UIViewController *topMostViewController() {
    UIViewController *topViewController = mainWindow().rootViewController;
    UIViewController *temp = nil;
    while (YES) {
        temp = nil;
        if ([topViewController isKindOfClass:[UINavigationController class]]) {
            temp = ((UINavigationController *)topViewController).visibleViewController;
        } else if ([topViewController isKindOfClass:[UITabBarController class]]) {
            temp = ((UITabBarController *)topViewController).selectedViewController ;
        }
        else if (topViewController.presentedViewController != nil) {
            temp = topViewController.presentedViewController;
        }
        if (temp != nil) {
            topViewController = temp;
        } else {
            break;
        }
    }
    return topViewController;
}

void cpSwapMethods(Class class, SEL originalSelector, SEL swizzledSelector) {
    if (!class || !originalSelector || !swizzledSelector) {
        return;
    }
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    if (class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

void pushViewController (UIViewController *vc,BOOL animated) {
    if (!vc || ![vc isKindOfClass:[UIViewController class]]) return;
    vc.hidesBottomBarWhenPushed = YES;
    [topMostViewController().navigationController pushViewController:vc animated:animated];
}

void pushWithClassName (NSString *className,BOOL animated) {
    id obj = [NSClassFromString(className) new];
    if (!obj) return;
    pushViewController(obj, animated);
}

void pushWithVCClass (Class vcClass,NSDictionary *properties) {
    id obj = [vcClass new];
    if (!obj) return;
    pushViewController(obj, YES);
}

void pushWithVCClassName (NSString *className,NSDictionary *properties) {
    id obj = [NSClassFromString(className) new];
    if (!obj) return;
    pushViewController(obj, YES);
}

void presentViewController (UIViewController *vc,BOOL animated) {
    if (!vc) return;
    [topMostViewController().navigationController presentViewController:vc animated:animated completion:^{
        
    }];
}


#pragma mark - appVersion

NSString * BDAppVersion()
{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    
    return appVersion;
}

UIColor * randomColor(){
    int r = arc4random() % 255;
    int g = arc4random() % 255;
    int b = arc4random() % 255;
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}


@end
