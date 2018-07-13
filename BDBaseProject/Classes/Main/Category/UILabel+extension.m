//
//  UILabel+extension.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "UILabel+extension.h"

@implementation UILabel (extension)
- (void)setAttributedTextWith:(NSString *)textOne textTwo:(NSString *)textTwo colorOne:(UIColor *)colorOne colorTwo:(UIColor *)colorTwo{
    NSString *text = [NSString stringWithFormat:@"%@ %@", textOne, textTwo];
    NSDictionary *attribs = @{
                              NSForegroundColorAttributeName: self.textColor,
                              };
    NSMutableAttributedString *attributedText =
    [[NSMutableAttributedString alloc] initWithString:text
                                           attributes:attribs];
    
    NSRange colorOneRange = [text rangeOfString:textOne];
    [attributedText setAttributes:@{NSForegroundColorAttributeName:colorOne}
                            range:colorOneRange];
    [attributedText addAttribute:NSFontAttributeName value:self.font range:colorOneRange];
    
    NSRange colorTwoRange = [text rangeOfString:textTwo];
    [attributedText setAttributes:@{NSForegroundColorAttributeName:colorTwo}
                            range:colorTwoRange];
    [attributedText addAttribute:NSFontAttributeName value:self.font range:colorTwoRange];
    self.attributedText = attributedText;
}

- (void)setLableAttrituteDifferentFontWithTextOne:(NSString *)textOne textTwo:(NSString *)textTwo
                                         colorOne:(UIColor *)colorOne colorTwo:(UIColor *)colorTwo
                                          fontOne:(UIFont *)fontOne fontTwo:(UIFont *)fontTwo {
    NSString *text = [NSString stringWithFormat:@"%@%@", textOne, textTwo];
    NSDictionary *attribs = @{
                              NSForegroundColorAttributeName: self.textColor,
                              };
    NSMutableAttributedString *attributedText =
    [[NSMutableAttributedString alloc] initWithString:text
                                           attributes:attribs];
    
    NSRange greenTextRange = [text rangeOfString:textOne];
    [attributedText setAttributes:@{NSForegroundColorAttributeName:colorOne}
                            range:greenTextRange];
    [attributedText addAttribute:NSFontAttributeName value:fontOne range:greenTextRange];
    
    NSRange darkTextRange = [text rangeOfString:textTwo];
    [attributedText setAttributes:@{NSForegroundColorAttributeName:colorTwo}
                            range:darkTextRange];
    
    [attributedText addAttribute:NSFontAttributeName value:fontTwo range:darkTextRange];
    self.attributedText = attributedText;
}

-(void)setLableAttrituteDifferentFontWithTextOne:(NSString *)textOne textTwo:(NSString *)textTwo textThree:(NSString *)textThree colorOne:(UIColor *)colorOne colorTwo:(UIColor *)colorTwo colorThree:(UIColor *)colorThree fontOne:(UIFont *)fontOne fontTwo:(UIFont *)fontTwo fontThree:(UIFont *)fontThree{
    NSString *text = [NSString stringWithFormat:@"%@%@%@", textOne, textTwo,textThree];
    NSDictionary *attribs = @{
                              NSForegroundColorAttributeName: self.textColor,
                              };
    NSMutableAttributedString *attributedText =
    [[NSMutableAttributedString alloc] initWithString:text
                                           attributes:attribs];
    
    NSRange greenTextRange = [text rangeOfString:textOne];
    [attributedText setAttributes:@{NSForegroundColorAttributeName:colorOne}
                            range:greenTextRange];
    [attributedText addAttribute:NSFontAttributeName value:fontOne range:greenTextRange];
    
    NSRange darkTextRange = [text rangeOfString:textTwo];
    [attributedText setAttributes:@{NSForegroundColorAttributeName:colorTwo}
                            range:darkTextRange];
    
    [attributedText addAttribute:NSFontAttributeName value:fontTwo range:darkTextRange];
    
    
    NSRange threeRange = [text rangeOfString:textThree];
    [attributedText setAttributes:@{NSForegroundColorAttributeName:colorThree}
                            range:threeRange];
    
    [attributedText addAttribute:NSFontAttributeName value:fontThree range:threeRange];

    
    
    self.attributedText = attributedText;

}


@end
