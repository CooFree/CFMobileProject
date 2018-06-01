//
//  ViewController.m
//  CFBaseProject
//
//  Created by dzjrqty on 2018/4/18.
//  Copyright © 2018年 tigerWork. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationController+QMUI.h"
#import "UIViewController+HBD.h"
#import "YPGradientDemoViewController.h"

@interface ViewController ()<UINavigationControllerBackButtonHandlerProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 64, 50, 50);
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)btnClick {
//    ViewController *vc = [ViewController new];
//    UIViewController *vc = [self createDemoViewController];
    UIViewController *vc = [YPGradientDemoViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIViewController *)createDemoViewController {
    ViewController *vc = [ViewController new];
    
    vc.hbd_barShadowHidden = NO;
    vc.hbd_barHidden = NO;
    vc.hbd_barStyle = UIBarStyleDefault;
    UIColor *color = @[
                       [UIColor colorWithRed:47/255.0 green:247/255.0 blue:247/255.0 alpha:0.8],
                       [UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:0.729],
                       [UIColor.redColor colorWithAlphaComponent:0.7],
                       [UIColor.greenColor colorWithAlphaComponent:0.7],
                       [UIColor.blueColor colorWithAlphaComponent:0.8]
                       ][arc4random()%5];
    
    vc.hbd_barTintColor = color;
    return vc;
}

#pragma mark - UINavigationControllerBackButtonHandlerProtocol

- (BOOL)shouldHoldBackButtonEvent {
    return NO;
}

- (BOOL)canPopViewController {
    // 这里不要做一些费时的操作，否则可能会卡顿。
    if (1) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"是否返回？" message:@"拦截系统返回" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *backActioin = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        UIAlertAction *continueAction = [UIAlertAction actionWithTitle:@"停留" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

        }];
        [alertController addAction:backActioin];
        [alertController addAction:continueAction];
        [self presentViewController:alertController animated:YES completion:nil];

        return NO;
    } else {
        return YES;
    }
}



@end
