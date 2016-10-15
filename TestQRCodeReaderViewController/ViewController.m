//
//  ViewController.m
//  TestQRCodeReaderViewController
//
//  Created by ys on 16/5/13.
//  Copyright © 2016年 jzh. All rights reserved.
//

#import "ViewController.h"

#import <QRCodeReaderViewController.h>

@interface ViewController ()<QRCodeReaderDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:@"二维码" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonAction
{
    QRCodeReaderViewController *qrcrVC = [[QRCodeReaderViewController alloc] init];
    qrcrVC.delegate = self;
    qrcrVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:qrcrVC animated:YES completion:^{
        [qrcrVC startScanning];
    }];
}

- (void)readerDidCancel:(QRCodeReaderViewController *)reader
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
