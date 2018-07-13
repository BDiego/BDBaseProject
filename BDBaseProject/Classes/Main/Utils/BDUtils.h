//
//  BDUtils.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDUtils : NSObject

+ (BOOL)isNil:(id)data;
+ (void)writeDataKey:(NSString *)key andValue:(id)value;
+ (id)readValueByKey:(NSString *)key;

+ (CGSize)sizeOfText:(NSString *)text withFont:(UIFont *)font andBounds:(CGSize)bounds;
+ (CGSize)sizeOfAttributedText:(NSAttributedString *)attriMStr andBounds:(CGSize)bounds;
+ (CGSize)sizeOfAttributedText:(NSAttributedString *)attriMStr withFont:(UIFont *)font andBounds:(CGSize)bounds;

//秒转换时间
+ (NSString *)secondToString:(NSInteger)time;
//Label的高度
+ (CGFloat)lineHeightOfLabel:(UILabel *)label;
//Label加阴影
+(void)addUILableShadow:(UILabel *) lable;


@end
