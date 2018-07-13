//
//  MacroCommon.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//


#ifndef MacroCommon_h
#define MacroCommon_h

//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#define LRString [NSString stringWithFormat:@"%s", __FILE__].lastPathComponent
#define BDLog(...) printf("%s: %s 第%d行: %s\n\n",[[NSString lr_stringDate] UTF8String], [LRString UTF8String] ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String]);
#else
#define BDLog(...)
#endif


// weakify strongify
#define kWeakify(var) __weak __typeof(var) weak_##var = var;
#define kStrongify(var) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
__strong __typeof(var) var = weak_##var; \
_Pragma("clang diagnostic pop")


//验证字符串是否为空
#define kIsSafeString(s) (s == nil || [s isKindOfClass:[NSNull class]] || ([s isKindOfClass:[NSString class]] && s.length == 0))
//获取安全的字符串
#define kGetSafeString(s) kIsSafeString((s)) ? @"" : (NSString *)(s)


//textField 占位文字颜色
#define kTextFieldPlaceholderColor(t,c)  [(t) setValue:(c) forKeyPath:@"_placeholderLabel.textColor"]
//textField 占位文字字体
#define kTextFieldPlaceholderFont(t,f)   [(t) setValue:(f) forKeyPath:@"_placeholderLabel.font"]


//系统版本
#define IOS_VERSION_FLOAT                       [[[UIDevice currentDevice] systemVersion] floatValue]
#define IOS11                                   (IOS_VERSION_FLOAT >= 11.0)
#define IOS9                                    (IOS_VERSION_FLOAT >= 9.0)
#define IOS8                                    (IOS_VERSION_FLOAT >= 8.0)
#define IOS7                                    (IOS_VERSION_FLOAT >= 7.0)
#define IOS6                                    (IOS_VERSION_FLOAT < 7.0)


//视图加边框
#ifdef DEBUG
#define ViewBorder(_view_, _color_)                 \
do{                                                 \
_view_.layer.borderColor = [_color_ CGColor];   \
_view_.layer.borderWidth = 1;                   \
}while(0)

#define Border(_view_)  ViewBorder(_view_, [UIColor redColor])
#else
#define ViewBorder(_view_, _color_)
#define Border(_view_)

#endif



#endif /* MacroCommon_h */
