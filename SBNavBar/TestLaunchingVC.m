//
//  TestLaunchingVC.m
//  SBNavBar
//
//  Created by Saiful Islam on 10/9/17.
//  Copyright © 2017 saiful. All rights reserved.
//

#import "TestLaunchingVC.h"
#import "ViewController.h"
@interface TestLaunchingVC ()

@end

@implementation TestLaunchingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pressClicked:(id)sender {
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ViewController * vc = [sb instantiateViewControllerWithIdentifier:@"Bunga"];
    [self.navigationController pushViewController:vc animated:YES];
    
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
