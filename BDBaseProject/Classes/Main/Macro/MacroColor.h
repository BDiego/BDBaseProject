
//
//  MacroColor.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#ifndef MacroColor_h
#define MacroColor_h

#define krgbColor(r, g, b)          [UIColor colorWithRed : (r) / 255.0 green : (g) / 255.0 blue : (b) / 255.0 alpha : 1]
#define krgbAColor(r, g, b, a)      [UIColor colorWithRed : (r) / 255.0 green : (g) / 255.0 blue : (b) / 255.0 alpha : (a)]
#define kHexColor(h)                krgbColor(((h >> 16) & 0xFF), ((h >> 8) & 0xFF), (h & 0xFF))
#define kHexAColor(h, a)            krgbAColor(((h >> 16) & 0xFF), ((h >> 8) & 0xFF), (h & 0xFF), a)


#define kThemeColor                 kHexColor(0x568ef8)   //主色
#define kSupportColor               kHexColor(0x071229)   //辅助色
#define kTitleColor                 kHexColor(0x333333)   //主标题
#define kSubTitleColor              kHexColor(0x666666)   //副标题
#define kBackgroundColor            kHexColor(0xeeeeee)   //背景色
#define kSeparatoreLineColor        kHexColor(0xcccccc)   //分割线
#define kLineColor                  kHexColor(0xEAEAEA)   //线


#endif /* MacroColor_h */
