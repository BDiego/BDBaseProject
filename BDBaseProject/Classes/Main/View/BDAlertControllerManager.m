//
//  BDAlertControllerManager.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "BDAlertControllerManager.h"
#import "BDPublicFunctions.h"
#import "BDAlertController.h"

#define WEAK_SELF  __weak typeof(self) weakSelf = self;

static char UIAlertActionButtonIndex;

@implementation UIAlertAction (ButtonIndex)

@dynamic buttonIndex;

- (void)setButtonIndex:(NSInteger)buttonIndex {
    objc_setAssociatedObject(self, &UIAlertActionButtonIndex,
                             @(buttonIndex),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)buttonIndex {
    return [objc_getAssociatedObject(self, &UIAlertActionButtonIndex) integerValue];
}

@end

@interface BDAlertControllerManager()

@property (nonatomic, weak) id<BDAlertViewControllerDelegate>        delegate;

@end

@implementation BDAlertControllerManager

+ (instancetype)shareInstance {
    static BDAlertControllerManager *sharedInstance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)actionSheetWithTitle:(NSString*)title
                     message:(NSString*)message
                    delegate:(id<BDAlertViewControllerDelegate>)delegate
           cancelButtonTitle:(NSString*)cancel
      destructiveButtonTitle:(NSString *)destructiveTitle
           otherButtonTitles:(NSString *)otherTitles, ... NS_REQUIRES_NIL_TERMINATION
{
    self.delegate = delegate;
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:title
                                                                message:message
                                                         preferredStyle:UIAlertControllerStyleActionSheet];
    
    NSUInteger buttonIndex = 0;
    
    WEAK_SELF
    if(cancel.length > 0) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * _Nonnull action)
                                       {
                                           [weakSelf actionSheetClick:action];
                                       }];
        cancelAction.buttonIndex = buttonIndex;
        [ac addAction:cancelAction];
    }
    if (destructiveTitle.length > 0) {
        buttonIndex ++;
        UIAlertAction *destructive = [UIAlertAction actionWithTitle:destructiveTitle
                                                              style:UIAlertActionStyleDestructive
                                                            handler:^(UIAlertAction * _Nonnull action)
                                      {
                                          [weakSelf actionSheetClick:action];
                                      }];
        destructive.buttonIndex = buttonIndex;
        [ac addAction:destructive];
    }
    
    NSMutableArray *otherTitlesArray = [NSMutableArray array];
    va_list args;
    va_start(args, otherTitles);
    for (NSString *title = otherTitles; title != nil; title = va_arg(args, NSString *)) {
        [otherTitlesArray addObject:title];
    }
    va_end(args);
    
    if([otherTitlesArray count] > 0) {
        for (NSString *otherTitle in otherTitlesArray) {
            buttonIndex ++;
            UIAlertAction *other = [UIAlertAction actionWithTitle:otherTitle
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * _Nonnull action)
                                    {
                                        [weakSelf actionSheetClick:action];
                                    }];
            other.buttonIndex = buttonIndex;
            [ac addAction:other];
        }
    }
    
    presentViewController(ac, YES);
}

- (void)alertWithTitle:(NSString*)title
               message:(NSString*)message
              delegate:(id<BDAlertViewControllerDelegate>)delegate
     cancelButtonTitle:(NSString*)cancel
     otherButtonTitles:(NSString *)otherTitles, ... NS_REQUIRES_NIL_TERMINATION
{
    self.delegate = delegate;
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:title
                                                                message:message
                                                         preferredStyle:UIAlertControllerStyleAlert];
    
    NSUInteger buttonIndex = 0;
    
    WEAK_SELF
    if(cancel.length > 0) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * _Nonnull action)
                                       {
                                           [weakSelf actionSheetClick:action];
                                       }];
        cancelAction.buttonIndex = buttonIndex;
        [ac addAction:cancelAction];
    }
    
    NSMutableArray *otherTitlesArray = [NSMutableArray array];
    va_list args;
    va_start(args, otherTitles);
    for (NSString *title = otherTitles; title != nil; title = va_arg(args, NSString *)) {
        [otherTitlesArray addObject:title];
    }
    va_end(args);
    
    if([otherTitlesArray count] > 0) {
        for (NSString *otherTitle in otherTitlesArray) {
            buttonIndex ++;
            UIAlertAction *other = [UIAlertAction actionWithTitle:otherTitle
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * _Nonnull action)
                                    {
                                        [weakSelf actionSheetClick:action];
                                    }];
            other.buttonIndex = buttonIndex;
            [ac addAction:other];
        }
    }
    
    presentViewController(ac, YES);
    
}

- (void)alertWithTitle:(NSString*)title
               message:(NSString*)message
                 block:(BDAlertViewControllerBlock)block
     cancelButtonTitle:(NSString*)cancel
     otherButtonTitles:(NSString *)otherTitles, ... NS_REQUIRES_NIL_TERMINATION
{
    self.block = block;
    
    BDAlertController *ac = [BDAlertController alertControllerWithTitle:title
                                                                message:message
                                                         preferredStyle:UIAlertControllerStyleAlert];
    ac.tintColor = kHexColor(0x444444);
    ac.titleColor = kHexColor(0x444444);
    ac.messageColor = kHexColor(0x666666);
    
    NSUInteger buttonIndex = 0;
    
    WEAK_SELF
    if(cancel.length > 0) {
        BDAlertAction *cancelAction = [BDAlertAction actionWithTitle:cancel
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * _Nonnull action)
                                       {
                                           [weakSelf actionSheetClick:action];
                                       }];
        cancelAction.buttonIndex = buttonIndex;
        [ac addAction:cancelAction];
    }
    
    NSMutableArray *otherTitlesArray = [NSMutableArray array];
    va_list args;
    va_start(args, otherTitles);
    for (NSString *title = otherTitles; title != nil; title = va_arg(args, NSString *)) {
        [otherTitlesArray addObject:title];
    }
    va_end(args);
    
    if([otherTitlesArray count] > 0) {
        for (NSString *otherTitle in otherTitlesArray) {
            buttonIndex ++;
            BDAlertAction *other = [BDAlertAction actionWithTitle:otherTitle
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * _Nonnull action)
                                    {
                                        [weakSelf actionSheetClick:action];
                                    }];
            other.buttonIndex = buttonIndex;
            [ac addAction:other];
        }
    }
    
    presentViewController(ac, YES);
}

- (void)actionSheetClick:(UIAlertAction*)action {
    if (self.delegate) {
        [self.delegate clickedButtonAtIndex:action.buttonIndex];
    }
    if (self.block) {
        self.block(action.buttonIndex);
    }
}



@end
