//
//  BDViewFactory.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "BDViewFactory.h"

@implementation BDViewFactory

+ (UIButton *)customButtonWithTitle:(NSString *)title titleFont:(UIFont *)titleFont normalTitleColor:(UIColor *)normalTitleColor selectedTitleColor:(UIColor *)selectedTitleColor backgroundColor:(UIColor *)backgroundColor{
    
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [aButton setTitle:title forState:UIControlStateNormal];
    if (titleFont) {
        aButton.titleLabel.font = titleFont;
    }
    if (normalTitleColor) {
        [aButton setTitleColor:normalTitleColor forState:UIControlStateNormal];
    }
    if (selectedTitleColor) {
        [aButton setTitleColor:selectedTitleColor forState:UIControlStateHighlighted];
        [aButton setTitleColor:selectedTitleColor forState:UIControlStateSelected];
    }
    if (backgroundColor) {
        [aButton setBackgroundColor:backgroundColor];
    }
    return aButton;
}

+ (UIButton *)customButtonWithTitle:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor{
    return [self customButtonWithTitle:title titleFont:titleFont normalTitleColor:titleColor selectedTitleColor:nil backgroundColor:backgroundColor];
}

+ (UIButton *)customButtonWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage{
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    if (normalImage) {
        [aButton setImage:normalImage forState:UIControlStateNormal];
    }
    if (selectedImage) {
        [aButton setImage:selectedImage forState:UIControlStateHighlighted];
        [aButton setImage:selectedImage forState:UIControlStateSelected];
    }
    return aButton;
}

+ (UIButton *)customButtonWithLeftNormalImage:(UIImage *)normalImage leftSelectedImage:(UIImage *)selectedImage andRightTitle:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor selectedColor:(UIColor *)selectedColor andSpacing:(CGFloat)spacing{
    
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [aButton setImage:normalImage forState:UIControlStateNormal];
    [aButton setTitle:title forState:UIControlStateNormal];
    if (titleFont) {
        aButton.titleLabel.font = titleFont;
    }
    if (titleColor) {
        [aButton setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (selectedColor) {
        [aButton setTitleColor:selectedColor forState:UIControlStateSelected];
    }
    if (selectedImage) {
        [aButton setImage:selectedImage forState:UIControlStateSelected];
    }
    aButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    aButton.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    return aButton;
}

+ (UIButton *)customButtonWithRightNormalImage:(UIImage *)normalImage rightSelectedImage:(UIImage *)selectedImage andLeftTitle:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor selectedColor:(UIColor *)selectedColor andSpacing:(CGFloat)spacing{
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [aButton setImage:normalImage forState:UIControlStateNormal];
    [aButton setTitle:title forState:UIControlStateNormal];
    if (titleFont) {
        aButton.titleLabel.font = titleFont;
    }
    if (titleColor) {
        [aButton setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (selectedColor) {
        [aButton setTitleColor:selectedColor forState:UIControlStateSelected];
    }
    if (selectedImage) {
        [aButton setImage:selectedImage forState:UIControlStateSelected];
    }
    aButton.imageEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    aButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    return aButton;
    
}

+ (UIButton *)customButtonWithTopNormalImage:(UIImage *)normalImage topSelectedImage:(UIImage *)selectedImage andBottomTitle:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor selectedColor:(UIColor *)selectedColor andSpacing:(CGFloat)spacing{
    
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [aButton setImage:normalImage forState:UIControlStateNormal];
    [aButton setTitle:title forState:UIControlStateNormal];
    if (titleFont) {
        aButton.titleLabel.font = titleFont;
    }
    if (titleColor) {
        [aButton setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (selectedColor) {
        [aButton setTitleColor:selectedColor forState:UIControlStateSelected];
    }
    if (selectedImage) {
        [aButton setImage:selectedImage forState:UIControlStateSelected];
    }
    // lower the text and push it left so it appears centered
    //  below the image
    CGSize imageSize = aButton.imageView.image.size;
    aButton.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + spacing), 0.0);
    
    // raise the image and push it right so it appears centered
    //  above the text
    CGSize titleSize = [aButton.titleLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    aButton.imageEdgeInsets = UIEdgeInsetsMake(- (titleSize.height + spacing), 0.0, 0.0, - titleSize.width);
    return aButton;
}


+ (UILabel *)customLabelWithFont:(UIFont *)textFont textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor{
    return [self customLabelWithFont:textFont textColor:textColor backgroundColor:backgroundColor alignment:NSTextAlignmentLeft];
}

+ (UILabel *)customLabelWithFont:(UIFont *)textFont textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor alignment:(NSTextAlignment)alignment{
    UILabel *aLabel = [[UILabel alloc] init];
    if (textFont) {
        aLabel.font = textFont;
    }
    if (textColor) {
        aLabel.textColor = textColor;
    }
    if (backgroundColor) {
        aLabel.backgroundColor = backgroundColor;
    }
    aLabel.textAlignment = alignment;
    return aLabel;
}



+ (UITextView *)customTextViewWithReturnKeyType:(UIReturnKeyType)returnKeyType backGroundColor:(UIColor *)backgroundColor{
    return [self customTextViewWithReturnKeyType:returnKeyType cornerRadius:0.f backGroundColor:backgroundColor];
}

+ (UITextView *)customTextViewWithReturnKeyType:(UIReturnKeyType)returnKeyType cornerRadius:(CGFloat)cornerRadius backGroundColor:(UIColor *)backgroundColor{
    UITextView *aTextView = [[UITextView alloc] init];
    aTextView.enablesReturnKeyAutomatically = YES;
    aTextView.returnKeyType = returnKeyType;
    aTextView.layer.cornerRadius = cornerRadius;
    if (backgroundColor) {
        aTextView.backgroundColor = backgroundColor;
    }
    
    return aTextView;
}


+ (UITextField *)customTextFieldWithReturnKeyType:(UIReturnKeyType)returnKeyType backGroundColor:(UIColor *)backgroundColor borderWith:(CGFloat)border borderColor:(UIColor *)borderColor cornerRadiu:(CGFloat)radius textFont:(UIFont *)font{
    UITextField *aTextField = [[UITextField alloc] init];
    aTextField.returnKeyType = returnKeyType;
    if (border > 0.f) {
        aTextField.layer.borderWidth = border;
    }
    if (borderColor) {
        aTextField.layer.borderColor = [borderColor CGColor];
    }
    if (radius > 0.f) {
        aTextField.layer.cornerRadius = radius;
    }
    if(font){
        aTextField.font = font;
    }
    if (backgroundColor) {
        aTextField.backgroundColor = backgroundColor;
    }
    return aTextField;
}

+ (UITextField *)customTextFieldWithReturnKeyType:(UIReturnKeyType)returnKeyType backGroundColor:(UIColor *)backgroundColor{
    return [self customTextFieldWithReturnKeyType:returnKeyType backGroundColor:backgroundColor borderWith:0.f borderColor:nil cornerRadiu:0.f textFont:nil];
}

+ (UIView *)customSingleLine{
    UIView * line = [[UIView alloc]init];
    line.backgroundColor = kLineColor;
    return line;
}

+ (UIView *)customSingleLineWithColor:(UIColor *)color{
    UIView * line = [[UIView alloc]init];
    line.backgroundColor = color;
    return line;
}

+ (UIView *)customSingleLineWithFrame:(CGRect)frame{
    UIView *hLine = [[UIView alloc] initWithFrame:frame];
    hLine.backgroundColor = kLineColor;
    return hLine;
}

+ (UIView *)customSingleVerticalLineWithHeight:(CGFloat)height{
    CGRect lineFrame = CGRectMake(0, 0, kOnePixel, height);
    return [self customSingleLineWithFrame:lineFrame];
}

+ (UIView *)customSingleHorizontalLineWithBisideMargin:(CGFloat)margin{
    return [self customSingleHorizontalLineWithLeftMargin:margin rightMargin:margin lineHeight:kOnePixel];
};

+ (UIView *)customSingleHorizontalLineWithLeftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin{
    return [self customSingleHorizontalLineWithLeftMargin:leftMargin rightMargin:rightMargin lineHeight:kOnePixel];
}

+ (UIView *)customSingleHorizontalLineWithLeftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin lineHeight:(CGFloat)height{
    CGRect lineFrame = CGRectMake(leftMargin, 0, kScreenWidth - leftMargin - rightMargin, height);
    return [self customSingleLineWithFrame:lineFrame];
}

+ (CAGradientLayer *)customGradientLayerWithFrame:(CGRect)frame{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)kHexColor(0x55b4f8).CGColor, (__bridge id)kHexColor(0x4e81f5).CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer.locations = @[@0.0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0.0);
    gradientLayer.frame = frame;
    return gradientLayer;
}


+ (NSAttributedString *)stringWithImageOnLeft:(UIImage *)img text:(NSString *)text/* height:(NSInteger)height*/ {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@", text]];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = img;
    NSAttributedString *attrStringWithImage = [NSAttributedString attributedStringWithAttachment:textAttachment];
    [attributedString replaceCharactersInRange:NSMakeRange(0, 1) withAttributedString:attrStringWithImage];
    return attributedString;
}

+ (NSAttributedString *)stringWithImageOnLeft:(UIImage *)img text:(NSString *)text color:(UIColor *)color align:(CGFloat)align {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@", text] attributes:@{
                                                                                                                                                          NSForegroundColorAttributeName: color
                                                                                                                                                          }];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    
    UIImage *image = img;// Image to mask with
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setFill];
    CGContextTranslateCTM(context, 0, image.size.height);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    CGContextClipToMask(context, CGRectMake(0, 0, image.size.width, image.size.height), [image CGImage]);
    CGContextFillRect(context, CGRectMake(0, 0, image.size.width, image.size.height));
    textAttachment.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSAttributedString *attrStringWithImage = [NSAttributedString attributedStringWithAttachment:textAttachment];
    [attributedString replaceCharactersInRange:NSMakeRange(0, 1) withAttributedString:attrStringWithImage];
    
    [attributedString addAttribute:NSBaselineOffsetAttributeName
                             value:@(-align)  //adjust this number till text appears to be centered
                             range:NSMakeRange(0, 1)];
    
    return attributedString;
}



@end
