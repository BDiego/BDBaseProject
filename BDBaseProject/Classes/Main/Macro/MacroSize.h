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
#define kNaviBarHeight              (iPhoneX ? 88 : 64)
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

#define iPhoneRatio                 roundf((kScreenWidth/375.f) * 100) / 100 //保留两位小数, 设计图750x1334(接近Iphone6尺寸)


#endif /* MacroSize_h */
