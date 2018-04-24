//
//  ViewController.m
//  CFBaseProject
//
//  Created by dzjrqty on 2018/4/18.
//  Copyright © 2018年 tigerWork. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationController+QMUI.h"

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
    ViewController *vc = [ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
