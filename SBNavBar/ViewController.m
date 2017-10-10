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
#import "SBCtBlob.h"


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
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
//    fakeNav = [[SBNavBarView alloc] init];
//    [self.view addSubview:fakeNav];
//
//    //[fakeNav setUpBarContainerWidthPoint:0.5 middleBarWidthPoint:.2];//Optional
//    [fakeNav attachConstraints];
//
//    SampleLeftBarContainerView * uv=[[[NSBundle mainBundle] loadNibNamed:@"SampleSBNavBarViews" owner:self options:nil] objectAtIndex:0];
//    [fakeNav setContinerViewWith:uv forContainerType:SBContainerTypeLeftBarContainer];
//
//    [uv.firstBtn addTarget:self action:@selector(firstBtnClicked) forControlEvents:UIControlEventTouchUpInside];
//    [uv.scndBtn addTarget:self action:@selector(secndBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    /**
     Setup Example-2
     */
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    fakeNav = [[SBNavBarView alloc] init];
    [self.view addSubview:fakeNav];
    
    [fakeNav setUpBarContainerWidthPoint:0.33 middleBarWidthPoint:.33];//Optional
    [fakeNav attachConstraints];
    
    
    NSDictionary * leftBarInfo = [fakeNav getContainerInfo:SBContainerTypeLeftBarContainer];
    
    
    
    
    int sampleHeight  = [[leftBarInfo objectForKey:@"height"] intValue]-15;
    int sampleWidth = 50;
    
    UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, sampleWidth, sampleHeight)];
    button1.backgroundColor = [UIColor blueColor];
    [button1 setTitle:@"b1" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(firstBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, sampleWidth, sampleHeight)];
    button2.backgroundColor = [UIColor redColor];
    [button2 setTitle:@"b2" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(secndBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * button3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, sampleWidth,sampleHeight )];
    button3.backgroundColor = [UIColor grayColor];
    [button3 setTitle:@"b3" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(firstBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * button4 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,sampleWidth ,sampleHeight )];
    button4.backgroundColor = [UIColor magentaColor];
    [button4 setTitle:@"b4" forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(secndBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * button5 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, sampleWidth,sampleHeight )];
    button5.backgroundColor = [UIColor grayColor];
    [button5 setTitle:@"b5" forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(firstBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * button6 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,sampleWidth ,sampleHeight )];
    button6.backgroundColor = [UIColor magentaColor];
    [button6 setTitle:@"b6" forState:UIControlStateNormal];
    [button6 addTarget:self action:@selector(secndBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
    [fakeNav setupBarContainerWithViews:@[
                                          @[
                                              button1,
                                              [[SBCtBlob alloc] initwithLeft:0 topPadding:5 rightPadding:0 btmPadding:0 width:sampleWidth height:sampleHeight]
                                          ],
                                          @[
                                              button2,
                                              [[SBCtBlob alloc] initwithLeft:0 topPadding:5 rightPadding:0 btmPadding:0 width:sampleWidth height:sampleHeight]
                                              ]

                                          ]
                       forContainerType:SBContainerTypeLeftBarContainer
                         alignment:SBAlignmentLeft
                           isTopverticalWall:true];
    
    [fakeNav setupBarContainerWithViews:@[
                                          @[
                                              button3,
                                              [[SBCtBlob alloc] initwithLeft:0 topPadding:0 rightPadding:0 btmPadding:10 width:sampleWidth height:sampleHeight]
                                              ],
                                          @[
                                              button4,
                                              [[SBCtBlob alloc] initwithLeft:0 topPadding:0 rightPadding:0 btmPadding:10 width:sampleWidth height:sampleHeight]
                                              ]
                                          
                                          ]
                       forContainerType:SBContainerTypeRightBarContainer
                              alignment:SBAlignmentRight
                      isTopverticalWall:false];
    
    [fakeNav setupBarContainerWithViews:@[
                                          
                                          
                                          @[
                                              button5,
                                              [[SBCtBlob alloc] initwithLeft:0 topPadding:0 rightPadding:0 btmPadding:10 width:sampleWidth height:sampleHeight]
                                              ],
                                          @[
                                              button6,
                                              [[SBCtBlob alloc] initwithLeft:0 topPadding:0 rightPadding:0 btmPadding:10 width:sampleWidth height:sampleHeight]
                                              ]
                                          
                                          ]
                       forContainerType:SBContainerTypeMiddleBarContainer
                              alignment:SBAlignmentCentre
                      isTopverticalWall:false];
    

    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    /**
     <#Description#>
     */
    
    
    
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
//    [self.navigationController popViewControllerAnimated:YES];
}

-(void)secndBtnClicked
{
    SBLog(@"secndBtnClicked");
//    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    ViewController * vc = [sb instantiateInitialViewController];
//    [self.navigationController pushViewController:vc animated:YES];
    
}



@end
