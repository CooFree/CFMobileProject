# CFMobileProject

##### 1.拦截系统默认返回按钮事件 （UINavigationController）

```objective-c
#pragma mark - UINavigationControllerBackButtonHandlerProtocol
-(BOOL)shouldHoldBackButtonEvent {
    return NO;
}
-(BOOL)canPopViewController {
    // 这里不要做一些费时的操作，否则可能会卡顿。
    if (1) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"是否返回？" message:@"返回后输入框的数据将不会自动保存" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *backActioin = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        UIAlertAction *continueAction = [UIAlertAction actionWithTitle:@"继续编辑" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

        }];
        [alertController addAction:backActioin];
        [alertController addAction:continueAction];
        [self presentViewController:alertController animated:YES completion:nil];
        return NO;
    } else {
        return YES;
    }
}

```

##### 2.导航栏界面切换时颜色效果 （NavigationBar）

```objective-c
-(UIViewController *)createDemoViewController {
    ViewController *vc = [ViewController new];
    vc.hbd_barShadowHidden = NO;
    vc.hbd_barHidden = NO;
    vc.hbd_barStyle = UIBarStyleDefault;
    UIColor *color = @[[UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:0.8],
                       [UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:0.729],
                       [UIColor.redColor colorWithAlphaComponent:0.7],
                       [UIColor.greenColor colorWithAlphaComponent:0.7],
                       [UIColor.blueColor colorWithAlphaComponent:0.8]
                       ][arc4random()%5];
    vc.hbd_barTintColor = color;
    return vc;
}

```

