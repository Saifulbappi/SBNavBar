//
//  SBNavBarView+SBNavBarExtender.m
//  SBNavBar
//
//  Created by Saiful Islam on 10/11/17.
//  Copyright © 2017 saiful. All rights reserved.
//

#import "SBNavBarView+SBNavBarExtender.h"




@implementation SBNavBarView (SBNavBarExtender)



-(void)configureStandardBarImage
{
    //Configure as ur need
    
}


-(void)standardNavTitle:(NSString *)titleText
     withBackBtnSeletor:(SEL)selector
      forViewController:(UIViewController *)vc
{
    NSDictionary * getInfoOfCentre = [self getContainerInfo:SBContainerTypeMiddleBarContainer];
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [getInfoOfCentre[@"width"] intValue]-2*DEFAULT_PADDING_FOR_STANDARD_CONTAINER_SETUP, [getInfoOfCentre[@"height"] intValue]-DEFAULT_PADDING_FOR_STANDARD_CONTAINER_SETUP)];
    
    titleLabel.font = [UIFont fontWithName:@"Roboto" size:14];
    titleLabel.text = titleText;
    titleLabel.numberOfLines = 2;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor =[UIColor whiteColor];
    
    
    
   
    
    [self setupBarContainerWithStandardPadding:[NSArray arrayWithObjects:titleLabel, nil] forContainerType:SBContainerTypeMiddleBarContainer alignment:SBAlignmentCentre isTopVerticalWall:YES];

    if(selector)
    {
        UIButton * backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
        [backBtn setImage:[UIImage imageNamed:@"back_button"] forState:UIControlStateNormal];
        [backBtn addTarget:vc action:selector forControlEvents:UIControlEventTouchUpInside];
        
        [self setupBarContainerWithStandardPadding:[NSArray arrayWithObjects:backBtn, nil] forContainerType:SBContainerTypeLeftBarContainer alignment:SBAlignmentLeft isTopVerticalWall:YES];
    }
    
    
    
}

#pragma -mark Dialer Needed

-(void)regViewAddForVC:(UIViewController * )vc
{
    
    
    //    [vc.view addSubview:self];
    //    [self attachConstraints];
    
    self.nv = [[[NSBundle mainBundle] loadNibNamed:@"SampleSBNavBarViews" owner:vc options:nil] objectAtIndex:1];
    [self setContinerViewWith:self.nv forContainerType:SBContainerTypeTopContainer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(regViewUpdate:) name:@"REG_VIEW_UPDATE" object:nil];
}

-(void)regViewUpdate:(NSNotification *)noti
{
    NSLog(@"Came in regViewUpdate %@",noti.userInfo);
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        self.nv.statusLabel.text = noti.userInfo[@"statusString"];
        self.nv.balanceLabel.text = noti.userInfo[@"balanceString"];
        
    }];
    
    
}

@end
