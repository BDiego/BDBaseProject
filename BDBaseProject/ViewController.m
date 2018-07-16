//
//  ViewController.m
//  BDBaseProject
//
//  Created by WangYibao on 2018/7/12.
//  Copyright © 2018年 Sword. All rights reserved.
//

#import "ViewController.h"
#import "BDAlertControllerManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%f",kStatusBarHeight);
    
    [[BDAlertControllerManager shareInstance] alertWithTitle:@"111" message:@"2222" block:^(NSInteger buttonIndex) {
        
    } cancelButtonTitle:@"333" otherButtonTitles: nil];
//
//    [[BDAlertControllerManager shareInstance] actionSheetWithTitle:@"你好" message:@"啊啊啊啊" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles: nil];
//
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
