//
//  BDViewFactory.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDViewFactory : NSObject

//MARK:UIButton
+ (UIButton *)customButtonWithTitle:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor;

+ (UIButton *)customButtonWithTitle:(NSString *)title titleFont:(UIFont *)titleFont normalTitleColor:(UIColor *)normalTitleColor selectedTitleColor:(UIColor *)selectedTitleColor backgroundColor:(UIColor *)backgroundColor;

+ (UIButton *)customButtonWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage;

+ (UIButton *)customButtonWithLeftNormalImage:(UIImage *)normalImage leftSelectedImage:(UIImage *)selectedImage andRightTitle:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor selectedColor:(UIColor *)selectedColor andSpacing:(CGFloat)spacing;

+ (UIButton *)customButtonWithRightNormalImage:(UIImage *)normalImage rightSelectedImage:(UIImage *)selectedImage andLeftTitle:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor selectedColor:(UIColor *)selectedColor andSpacing:(CGFloat)spacing;

+ (UIButton *)customButtonWithTopNormalImage:(UIImage *)normalImage topSelectedImage:(UIImage *)selectedImage andBottomTitle:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor selectedColor:(UIColor *)selectedColor andSpacing:(CGFloat)spacing;

//MARK:UILabel
+ (UILabel *)customLabelWithFont:(UIFont *)textFont textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor;
+ (UILabel *)customLabelWithFont:(UIFont *)textFont textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor alignment:(NSTextAlignment)alignment;

//MARK:UITextView
+ (UITextView *)customTextViewWithReturnKeyType:(UIReturnKeyType)returnKeyType backGroundColor:(UIColor *)backgroundColor;
+ (UITextView *)customTextViewWithReturnKeyType:(UIReturnKeyType)returnKeyType cornerRadius:(CGFloat)cornerRadius backGroundColor:(UIColor *)backgroundColor;

//MARK:UITextField
+ (UITextField *)customTextFieldWithReturnKeyType:(UIReturnKeyType)returnKeyType backGroundColor:(UIColor *)backgroundColor;
+ (UITextField *)customTextFieldWithReturnKeyType:(UIReturnKeyType)returnKeyType backGroundColor:(UIColor *)backgroundColor borderWith:(CGFloat)border borderColor:(UIColor *)borderColor cornerRadiu:(CGFloat)radius textFont:(UIFont *)font;

//MARK:single line
+ (UIView *)customSingleLine;
+ (UIView *)customSingleLineWithColor:(UIColor *)color;
+ (UIView *)customSingleLineWithFrame:(CGRect)frame;
+ (UIView *)customSingleHorizontalLineWithBisideMargin:(CGFloat)margin;
+ (UIView *)customSingleHorizontalLineWithLeftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin;
+ (UIView *)customSingleHorizontalLineWithLeftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin lineHeight:(CGFloat)height;
+ (UIView *)customSingleVerticalLineWithHeight:(CGFloat)height;

//返回渐变色的layer
+ (CAGradientLayer *)customGradientLayerWithFrame:(CGRect)frame;


+(NSAttributedString *)stringWithImageOnLeft:(UIImage *)img text:(NSString *)text/* height:(NSInteger)height*/;
+(NSAttributedString *)stringWithImageOnLeft:(UIImage *)img text:(NSString *)text color:(UIColor *)color align:(CGFloat)align;




@end
