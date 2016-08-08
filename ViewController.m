//
//  ViewController.m
//  HJTextView
//
//  Created by WHJ on 16/6/2.
//  Copyright © 2016年 WHJ. All rights reserved.
//

#import "ViewController.h"
#import "HJTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blueColor];

    HJTextView *textView = [[HJTextView alloc]initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 50)];
    textView.placeholder  = @"介绍一下自己。。。";
    textView.maxCharacters = 300;
    textView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
