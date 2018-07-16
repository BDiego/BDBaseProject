//
//  BDAlertControllerManager.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^BDAlertViewControllerBlock)(NSInteger buttonIndex);

@interface  UIAlertAction (ButtonIndex)

@property (nonatomic, assign) NSInteger             buttonIndex;

@end


@protocol BDAlertViewControllerDelegate <NSObject>

@optional
//从cancel --> destructiveTitle --> otherTitles 0开始自动递增，
- (void)clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface BDAlertControllerManager : NSObject

@property (nonatomic, copy) BDAlertViewControllerBlock          block;

+ (instancetype)shareInstance;

- (void)actionSheetWithTitle:(NSString*)title
                     message:(NSString*)message
                    delegate:(id<BDAlertViewControllerDelegate>)delegate
           cancelButtonTitle:(NSString*)cancel
      destructiveButtonTitle:(NSString *)destructiveTitle
           otherButtonTitles:(NSString *)otherTitles, ... NS_REQUIRES_NIL_TERMINATION;

- (void)alertWithTitle:(NSString*)title
               message:(NSString*)message
              delegate:(id<BDAlertViewControllerDelegate>)delegate
     cancelButtonTitle:(NSString*)cancel
     otherButtonTitles:(NSString *)otherTitles, ... NS_REQUIRES_NIL_TERMINATION;

- (void)alertWithTitle:(NSString*)title
               message:(NSString*)message
                 block:(BDAlertViewControllerBlock)block
     cancelButtonTitle:(NSString*)cancel
     otherButtonTitles:(NSString *)otherTitles, ... NS_REQUIRES_NIL_TERMINATION;


@end
