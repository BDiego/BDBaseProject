//
//  NSString+Check.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Check)

//手机号
-(BOOL)checkPhoneNumInput;

//邮箱
- (BOOL) validateEmail;

//用户名
- (BOOL) validateUserName;

//密码
- (BOOL) validatePassword;

//昵称
- (BOOL) validateNickname;

//身份证号
- (BOOL) validateIdentityCard;

//6位数字验证码
- (BOOL) validCode;

//16、19位银行卡号
- (BOOL) validBankNumber;

//是否包含数字
- (BOOL)IsContainNumandCharacter;

//是否包含汉字
-(BOOL)IsContainChinese;

//保留小数点后2位
-(BOOL)validateMoney;

/**保留小数点后1位*/
-(BOOL)validateReturnMoneyRatio;

@end




