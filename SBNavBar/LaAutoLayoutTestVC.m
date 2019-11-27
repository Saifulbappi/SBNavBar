//
//  LaAutoLayoutTestVC.m
//  SBNavBar
//
//  Created by Saiful Islam on 14/2/19.
//  Copyright © 2019 saiful. All rights reserved.
//

#import "LaAutoLayoutTestVC.h"
#import "SBNavBarView.h"
#import "SBCtBlob.h"
#import "SBNavBarView+SBNavBarExtender.h"
@interface LaAutoLayoutTestVC ()

@end

@implementation LaAutoLayoutTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SBNavBarView * fakeNav = [[SBNavBarView alloc] init];
    [self.view addSubview:fakeNav];
    
    [fakeNav attachConstraints];
    
    UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    button1.backgroundColor = [UIColor blueColor];
    [button1 setTitle:@"b1" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(firstBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    button2.backgroundColor = [UIColor redColor];
    [button2 setTitle:@"b2" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(secndBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [fakeNav setupBarContainerWithStandardPadding:@[button1,button2] forContainerType:SBContainerTypeLeftBarContainer alignment:SBAlignmentLeft isTopVerticalWall:YES];
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
