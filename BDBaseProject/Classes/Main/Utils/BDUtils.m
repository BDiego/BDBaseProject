//
//  BDUtils.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "BDUtils.h"

@implementation BDUtils

+ (BOOL)isNil:(id)data
{
    if ((data == nil) || [data isKindOfClass:[NSNull class]]){
        return YES;
    }
    
    if ([data isKindOfClass:[NSString class]]){
        NSString * str = [NSString stringWithFormat:@"%@", data];
        NSString * trimedString = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if ([trimedString length] == 0){
            // empty string
            return YES;
        }else{
            // is neither empty nor null
            return NO;
        }
    }
    return NO;
}

+ (void)writeDataKey:(NSString *)key andValue:(id)value
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (value == nil){
        [userDefaults removeObjectForKey:key];
    }else{
        [userDefaults setObject:value forKey:key];
    }
    [userDefaults synchronize];
}

+ (id)readValueByKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults valueForKey:key];
}





+ (CGSize)sizeOfText:(NSString *)text withFont:(UIFont *)font andBounds:(CGSize)bounds{
    
    NSMutableAttributedString * attributedText = [self attributedString:text FromStingWithFont:font];
    
    CGRect textRect = CGRectIntegral([attributedText boundingRectWithSize:bounds
                                                                 options :NSStringDrawingUsesLineFragmentOrigin
                                                                 context :nil]);
    return textRect.size;
}

+ (CGSize)sizeOfAttributedText:(NSMutableAttributedString *)attriMStr andBounds:(CGSize)bounds{
    
    CGRect textRect = CGRectIntegral([attriMStr boundingRectWithSize:bounds
                                                            options :NSStringDrawingUsesLineFragmentOrigin
                                                            context :nil]);
    return textRect.size;
}

+ (CGSize)sizeOfAttributedText:(NSAttributedString *)attriMStr withFont:(UIFont *)font andBounds:(CGSize)bounds{
    
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithAttributedString:attriMStr];
    
    if (font) {
        [attriMStr enumerateAttribute:NSFontAttributeName inRange:NSMakeRange(0, attriStr.length) options:0 usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
            if (!value) {
                [attriStr addAttribute:NSFontAttributeName value:font range:range];
            }
        }];
    }
    
    CGRect textRect = CGRectIntegral([attriStr boundingRectWithSize:bounds
                                                           options :NSStringDrawingUsesLineFragmentOrigin
                                                           context :nil]);
    return textRect.size;
}


+ (NSMutableAttributedString *)attributedString:(NSString *)str FromStingWithFont:(UIFont *)font
{
    if(str && font){
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName:font}];
        return attributedStr;
    }
    return nil;
}

+ (NSString *)secondToString:(NSInteger)time
{
    if(time <=0)
    {
        time = 0;
    }
    NSString * hour = @"";
    NSString * min = @"";
    NSString * sec = @"";
    
    NSInteger h = time / 3600;
    NSInteger m = time%3600/60;
    NSInteger s = time%3600%60%60;
    
    if (h < 10) {
        hour = [NSString stringWithFormat:@"0%@",@(h)];
    }else{
        hour = [NSString stringWithFormat:@"%@",@(h)];
    }
    
    if(m<10)
    {
        min = [NSString stringWithFormat:@"0%@",@(m)];
    }else
    {
        min = [NSString stringWithFormat:@"%@",@(m)];
    }
    
    if(s<10)
    {
        sec = [NSString stringWithFormat:@"0%@",@(s)];
    }else
    {
        sec = [NSString stringWithFormat:@"%@",@(s)];
    }
    NSString * result = [NSString stringWithFormat:@"%@:%@:%@",hour,min,sec];
    return result;
}


+ (CGFloat)lineHeightOfLabel:(UILabel *)label{
    return ceilf([label.font lineHeight]);
}
+ (void)addUILableShadow:(UILabel *) lable{
    lable.shadowColor = [UIColor blackColor];
    lable.shadowOffset =CGSizeMake(kOnePixel, kOnePixel);
}


@end
