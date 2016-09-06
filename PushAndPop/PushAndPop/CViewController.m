//
//  CViewController.m
//  PushAndPop
//
//  Created by 王力 on 16/9/5.
//  Copyright © 2016年 王力. All rights reserved.
//

#import "CViewController.h"

@interface CViewController ()

@end

@implementation CViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor darkTextColor];
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    aButton.frame = CGRectMake(100, 100, 100, 100);
    [aButton setTitle:@"C" forState:UIControlStateNormal];
    [aButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [aButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:aButton];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"C:%@", self.navigationController.viewControllers);
    NSMutableArray *arr = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    [arr removeObjectAtIndex:1];
    self.navigationController.viewControllers = arr;
    
}

- (void)buttonAction:(UIButton *)sender {
//    BViewController *B = [[BViewController alloc] init];
//    [self.navigationController pushViewController:B animated:YES];
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
