//
//  NSString+Check.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "NSString+Check.h"

@implementation NSString (Check)

//手机号
-(BOOL)checkPhoneNumInput{
    
    NSString * MOBILE = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    BOOL res1 = [regextestmobile evaluateWithObject:self];
    
    if (res1) {
        return YES;
    } else
    {
        return NO;
    }
}
//邮箱
- (BOOL) validateEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL res = [emailTest evaluateWithObject:self];
    if (res) {
        return YES;
    } else {
        return NO;
    }
}

//用户名
- (BOOL) validateUserName
{
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL res = [userNamePredicate evaluateWithObject:self];
    if (res) {
        return YES;
    } else {
        return NO;
    }
}

//密码
- (BOOL) validatePassword
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,12}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    BOOL res = [passWordPredicate evaluateWithObject:self];
    if (res) {
        return YES;
    } else {
        return NO;
    }
}

//昵称
- (BOOL) validateNickname
{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate *nicknamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    BOOL res = [nicknamePredicate evaluateWithObject:self];
    if (res) {
        return YES;
    } else {
        return NO;
    }
}


//身份证号
- (BOOL) validateIdentityCard
{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL res = [identityCardPredicate evaluateWithObject:self];
    if (res) {
        return YES;
    } else {
        return NO;
    }
}

//6位数字验证码
- (BOOL)validCode
{
    NSString *validCode = @"^\\d{6}$";
    NSPredicate *validCodePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",validCode];
    BOOL res = [validCodePredicate evaluateWithObject:self];
    if (res) {
        return YES;
    } else {
        return NO;
    }
    
}

//16、19位银行卡号
- (BOOL)validBankNumber
{
    NSString *validCode = @"^\\d{16}|\\d{19}$";
    NSPredicate *validCodePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",validCode];
    BOOL res = [validCodePredicate evaluateWithObject:self];
    if (res) {
        return YES;
    } else {
        return NO;
    }
    
}

//是否包含数字
- (BOOL)IsContainNumandCharacter{
    unichar c;
    for (int i=0; i<self.length; i++) {
        c=[self characterAtIndex:i];
        if (isnumber(c)) {
            return YES;
        }
    }
    return NO;
}


//是否包含汉字
-(BOOL)IsContainChinese{
    for(int i=0; i< [self length];i++){
        int a = [self characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
        
    }
    return NO;
}

//保留小数点后2位
-(BOOL)validateMoney
{
    NSString *phoneRegex = @"^[0-9]+(\\.[0-9]{1,2})?$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

-(BOOL)validateReturnMoneyRatio{
    NSString *phoneRegex = @"^[0-9]+(\\.[0-9]{1,1})?$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}


@end







