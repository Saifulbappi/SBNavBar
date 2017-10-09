//
//  ViewController.m
//  SBNavBar
//
//  Created by Saiful Islam on 9/28/17.
//  Copyright © 2017 saiful. All rights reserved.
//

#import "ViewController.h"
#import "SampleLeftBarContainerView.h"
#import "SBNavBarView.h"


@interface ViewController ()
{
    SBNavBarView * fakeNav;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
  
    
    
    
    /**
     Setup Example-1
     */
    
    //////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    fakeNav = [[SBNavBarView alloc] init];
    [self.view addSubview:fakeNav];
    [fakeNav attachConstraints];
    
    
    SampleLeftBarContainerView * uv=[[[NSBundle mainBundle] loadNibNamed:@"SampleSBNavBarViews" owner:self options:nil] objectAtIndex:0];
    [fakeNav setLeftBarContainer:uv];
    
    [uv.firstBtn addTarget:self action:@selector(firstBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [uv.scndBtn addTarget:self action:@selector(secndBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    //////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
    
//
//    [fakeNav updateConstraints];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    
    NSLog(@"rect of vc %@",NSStringFromCGRect(self.view.frame));
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma  -mark Testing Actions

-(void)firstBtnClicked
{
    SBLog(@"firstBtnClicked");
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)secndBtnClicked
{
    SBLog(@"secndBtnClicked");
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ViewController * vc = [sb instantiateInitialViewController];
    [self.navigationController pushViewController:vc animated:YES];
    
}



@end
