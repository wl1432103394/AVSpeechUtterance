//
//  DViewController.m
//  PushAndPop
//
//  Created by 王力 on 16/9/5.
//  Copyright © 2016年 王力. All rights reserved.
//

#import "DViewController.h"
#import "CViewController.h"
#import "BViewController.h"
@interface DViewController ()

@end

@implementation DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    aButton.frame = CGRectMake(100, 100, 100, 100);
    [aButton setTitle:@"D" forState:UIControlStateNormal];
    [aButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [aButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:aButton];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"D:%@", self.navigationController.viewControllers);
    
}
- (void)buttonAction:(UIButton *)sender {
    CViewController *C = [[CViewController alloc] init];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    [arr insertObject:C atIndex:arr.count - 1];
    self.navigationController.viewControllers = arr;
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
