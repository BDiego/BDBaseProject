//
//  MacroSize.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#ifndef MacroSize_h
#define MacroSize_h

#define kStatusBarHeight            [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNaviBarHeight              (iPhoneXStyle ? 88 : 64)
#define kTabBarHeight               (iPhoneXStyle ? 83 : 49)

#define kLineHeight                 (1.f/[[UIScreen mainScreen] scale])

#define kScreenWidth                ([[UIScreen mainScreen] bounds].size.width)
#define kScreenHeight               ([[UIScreen mainScreen] bounds].size.height)
#define kScreenBounds               ([[UIScreen mainScreen] bounds])
#define kScreenSize                 ([[UIScreen mainScreen] bounds].size)

#define kOnePixel                   1.f / [[UIScreen mainScreen] scale]

//MARK: UIStuff Cosnt -

#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5                                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6                                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus                             ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhoneXS_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhoneXStyle ([UIScreen mainScreen].bounds.size.height == 812.f || [UIScreen mainScreen].bounds.size.height == 896.f)



#endif /* MacroSize_h */
