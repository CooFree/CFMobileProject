//
//  ViewController.m
//  CFBaseProject
//
//  Created by dzjrqty on 2018/4/18.
//  Copyright © 2018年 tigerWork. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationController+QMUI.h"

@interface ViewController ()<UINavigationControllerBackButtonHandlerProtocol,QMUICustomNavigationBarTransitionDelegate>

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
    ViewController *vc = [ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - <QMUINavigationControllerDelegate>

- (void)navigationController:(CFUINavigationController *)navigationController poppingByInteractiveGestureRecognizer:(UIScreenEdgePanGestureRecognizer *)gestureRecognizer viewControllerWillDisappear:(UIViewController *)viewControllerWillDisappear viewControllerWillAppear:(UIViewController *)viewControllerWillAppear {
    
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if (viewControllerWillDisappear == self) {
//            [QMUITips showSucceed:@"松手了，界面发生切换"];
        } else if (viewControllerWillAppear == self) {
//            [QMUITips showInfo:@"松手了，没有触发界面切换"];
        }
//        [self resetStateLabel];
        return;
    }
    
    NSString *stateString = nil;
    UIColor *stateColor = nil;
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        stateString = @"触发手势返回";
//        stateColor = [UIColorBlue colorWithAlphaComponent:.5];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        stateString = @"手势返回中";
//        stateColor = [UIColorGreen colorWithAlphaComponent:.5];
    } else {
        return;
    }
    NSLog(@"%@", stateString);
//    self.stateLabel.text = stateString;
//    self.stateLabel.backgroundColor = stateColor;
}
#pragma mark - UINavigationControllerBackButtonHandlerProtocol

- (BOOL)shouldHoldBackButtonEvent {
    return YES;
}

- (BOOL)canPopViewController {
    // 这里不要做一些费时的操作，否则可能会卡顿。
    if (1) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"是否返回？" message:@"返回后输入框的数据将不会自动保存" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *backActioin = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        UIAlertAction *continueAction = [UIAlertAction actionWithTitle:@"继续编辑" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//            [self.textView becomeFirstResponder];
        }];
        [alertController addAction:backActioin];
        [alertController addAction:continueAction];
        [self presentViewController:alertController animated:YES completion:nil];
//        [alertController showWithAnimated:YES];
        return NO;
    } else {
        return YES;
    }
}

//- (BOOL)shouldCustomNavigationBarTransitionWhenPushDisappearing {
//    return self.customNavBarTransition && (self.barStyle != self.viewController.barStyle);
//}
//- (BOOL)shouldCustomNavigationBarTransitionWhenPopDisappearing {
//    return self.customNavBarTransition && (self.barStyle != self.previousBarStyle);
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
