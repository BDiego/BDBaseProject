//
//  UILabel+extension.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (extension)
- (void)setAttributedTextWith:(NSString *)textOne textTwo:(NSString *)textTwo colorOne:(UIColor *)colorOne colorTwo:(UIColor *)colorTwo;
- (void)setLableAttrituteDifferentFontWithTextOne:(NSString *)textOne textTwo:(NSString *)textTwo
                                         colorOne:(UIColor *)colorOne colorTwo:(UIColor *)colorTwo
                                          fontOne:(UIFont *)fontOne fontTwo:(UIFont *)fontTwo;
- (void)setLableAttrituteDifferentFontWithTextOne:(NSString *)textOne textTwo:(NSString *)textTwo textThree:(NSString *)textThree
                                         colorOne:(UIColor *)colorOne colorTwo:(UIColor *)colorTwo colorThree:(UIColor *)colorThree
                                          fontOne:(UIFont *)fontOne fontTwo:(UIFont *)fontTwo fontThree:(UIFont *)fontThree;
@end
