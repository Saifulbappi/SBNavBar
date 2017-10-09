//
//  SBNavBarView.m
//  SBNavBar
//
//  Created by Saiful Islam on 9/28/17.
//  Copyright © 2017 saiful. All rights reserved.
//

#import "SBNavBarView.h"
#import "SBCtBlob.h"

#define  BAR_CONTAINER_HEIGHT                        44
#define  DEFAULT_STATUSBAR_HEIGHT                    22
#define  DEFAULT_TOPCONTAINER_HEIGHT                 10
#define  DEFAULT_BTMCONTAINER_HEIGHT                 10
#define  DEFUALT_BARCONTAINER_VERTICAL_PADDING       2
#define  DEFUALT_BARCONTAINER_HORIZONTAL_PADDING     1


/**
 
                             SBNavBarView Layout
 
          --------------------------------------------------------
         |                      STATUS BAR                        |
          --------------------------------------------------------
         |                    TOP CONTAINER                       |
          --------------------------------------------------------
         |                     BAR CONTAINER                      |
         | ------------   -------------------------   ----------- |
         || LEFT BAR   | |       MIDDLE BAR        | | RIGHT BAR  ||
         || CONTAINER  | |        CONTAINER        | | CONTAINER ||
         | ------------   -------------------------   ----------- |
         |                                                        |
          --------------------------------------------------------
         |                     BOTTOM CONTAINER                   |
          --------------------------------------------------------
 
 */


static int defaultBarContainerHeight = BAR_CONTAINER_HEIGHT;
static int defaultStatusBarHeight = DEFAULT_STATUSBAR_HEIGHT;
static int defaultTopContainerHeight = DEFAULT_TOPCONTAINER_HEIGHT;
static int defaultBtmContainerHeight = DEFAULT_BTMCONTAINER_HEIGHT;
int defaultBarContainerWidth = [UIScreen mainScreen].bounds.size.width;

static int defaultBarContainerVerticalPadding = DEFUALT_BARCONTAINER_VERTICAL_PADDING;
static int defaultBarContainerHorizontalPadding = DEFUALT_BARCONTAINER_HORIZONTAL_PADDING;







@implementation SBNavBarView
{
#pragma -mark Instance RequiredViews;
    
    UIView * statusBarView,*topContainerView, * barContainerView,* barImageView, * leftBarContainerView, * rightBarContainerView, * middleBarContainerView, *btmContainerView;
    

    
#pragma -mark Instance Constraints
    
/**
         SBCtBlobs
 
 */

    //SBNavBarView
    SBCtBlob * mainViewCtBlob;/// This Blob Constraints is related to SBNavBarView's SUPER view
    
    
    //STATUS BAR
    SBCtBlob * statusBarCtBlob; // This Blob Constraints is related to SBNavBarView
    
    
    //TOP CONTAINER
    SBCtBlob * topContainerCtBlob;// This Blob Constraints is related to SBNavBarView
    
    //BAR CONTAINER
    SBCtBlob * barContainerCtBlob; // This Blob Constraints is related to SBNavBarView
    
    //LEFT BAR CONTAINER
    SBCtBlob * leftBarContainerCtBlob;// This Blob Constraints is related to BarContainer
    
    //RIGHT BAR CONTAINER
    SBCtBlob * rightBarContainerCtBlob;// This Blob Constraints is related to BarContainer
    
    //MIDDLE BAR CONTAINER
    SBCtBlob * middleBarContainerCtBlob;// This Blob Constraints is related to BarContainer
    
    //BOTTOM CONTAINER
    SBCtBlob * btmContainerCtBlob;// This Blob Constraints is related to SBNavBarView
    

    /**
        LayOutConstraints
     
     */
    
    /**
      mainViewConstraints
     */
    NSLayoutConstraint * mainViewLeftCt;
    NSLayoutConstraint * mainViewTopCt;
    NSLayoutConstraint * mainViewRightCt;
    NSLayoutConstraint * mainViewBtmCt;
    
    /**
      STATUS BAR CONSTRAINTS
     */
    NSLayoutConstraint * statusBarLeftCt;
    NSLayoutConstraint * statusBarTopCt;
    NSLayoutConstraint * statusBarRightCt;
    NSLayoutConstraint * statusBarBtmCt;
    
    
    /**
     TOP CONTAINER CONSTRAINTS
     */
    NSLayoutConstraint * topContainerLeftCt;
    NSLayoutConstraint * topContainerTopCt;
    NSLayoutConstraint * topContainerRightCt;
    NSLayoutConstraint * topContainerBtmCt;
    
    
    /**
     BTM CONTAINER CONSTRAINTS
     */
    
    NSLayoutConstraint * btmContainerLeftCt;
    NSLayoutConstraint * btmContainerTopCt;
    NSLayoutConstraint * btmContainerRightCt;
    NSLayoutConstraint * btmContainerBtmCt;
    
    
    /**
     BAR CONTAINER CONSTRAINTS
     */
    
    NSLayoutConstraint * barContainerLeftCt;
    NSLayoutConstraint * barContainerTopCt;
    NSLayoutConstraint * barContainerRightCt;
    NSLayoutConstraint * barContainerBtmCt;
    
    /**
     LEFT BAR CONTAINER CONSTRAINTS
     */
    
    NSLayoutConstraint * leftBarContainerLeftCt;
    NSLayoutConstraint * leftBarContainerTopCt;
    NSLayoutConstraint * leftBarContainerRightCt;
    NSLayoutConstraint * leftBarContainerBtmCt;
    
    /**
    MIDDLE BAR CONTAINER CONSTRAINTS
    */
    
    NSLayoutConstraint * middleBarContainerLeftCt;
    NSLayoutConstraint * middleBarContainerTopCt;
    NSLayoutConstraint * middleBarContainerRightCt;
    NSLayoutConstraint * middleBarContainerBtmCt;
    
    
    /**
     RIGHT BAR CONTAINER CONSTRAINTS
     */
    
    NSLayoutConstraint * rightBarContainerLeftCt;
    NSLayoutConstraint * rightBarContainerTopCt;
    NSLayoutConstraint * rightBarContainerRightCt;
    NSLayoutConstraint * rightBarContainerBtmCt;
    
    
    
    
    
    
    
    
#pragma -mark Instance Helper Variables
    
    int fullNavHeight;
    int statusBarHeight;
    NSMutableDictionary *sbNavBarViewsDict;
    
    int barContainerLeftBarWidth,barContainerMiddlerBarWidth,barContainerRightBarWidth;
    float currentBarContainerLeftBarWidthPoint,currentBarContainerMiddlerBarWidthPoint,currentBarContainerRightBarWidthPoint;
    
    
    
}


-(id)init
{
    self=[super init];//[UIScreen mainScreen].bounds.size.width, defaultBarContainerHeight+22)];// 0,0)];//
    //[[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    
    SBLog(@"SBNavBarView init");
    
    
    /**
             view inits
     */
    
    
    
    [self attachSubViews];
    
    
    
    /**
             Variable inits
     */
    
    
    
    sbNavBarViewsDict = [NSMutableDictionary dictionary];
//    sbNavBarViewsDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:self,@"self",
//                         self.superview,@"super",
//                         statusBarView,@"statusBarView",
//                         topContainerView,@"topContainerView",
//                         barContainerView,@"barContainerView",
//                         barImageView,@"barImageView",
//                         leftBarContainerView,@"leftBarContainerView",
//                         rightBarContainerView,@"rightBarContainerView",
//                         middleBarContainerView,@"middleBarContainerView",
//                         btmContainerView,@"btmContainerView",
//                         nil ];
    
    statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;//For iPhone X it is around 40
    statusBarHeight = statusBarHeight==0? defaultStatusBarHeight:statusBarHeight;
    
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation))
    {
        // code for landscape orientation
        statusBarHeight = defaultStatusBarHeight;
    }
    
    /**
         Observer and other inits
     */
    
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:nil];
    
    return self;
}

-(void)attachSubViews
{
    
    
    
    statusBarView = [[UIView alloc] init];
    topContainerView = [[UIView alloc] init];
    barContainerView = [[UIView alloc] init];
    barImageView = [[UIView alloc] init];
    leftBarContainerView = [[UIView alloc] init];
    rightBarContainerView = [[UIView alloc] init];
    middleBarContainerView = [[UIView alloc] init];
    btmContainerView = [[UIView alloc] init];
    
    statusBarView.backgroundColor = [UIColor colorWithRed:2/255.0 green:39/255.0 blue:31/255.0 alpha:0.7];
    topContainerView.backgroundColor = [UIColor colorWithRed:56/255.0 green:115/255.0 blue:167/255.0 alpha:1.0];
    barContainerView.backgroundColor = [UIColor colorWithRed:6/255.0 green:76/255.0 blue:63/255.0 alpha:1.0];
    leftBarContainerView.backgroundColor = [UIColor colorWithRed:183/255.0 green:29/255.0 blue:36/255.0 alpha:1.0];
    middleBarContainerView.backgroundColor = [UIColor colorWithRed:143/255.0 green:193/255.0 blue:89/255.0 alpha:1.0];
    rightBarContainerView.backgroundColor = [UIColor colorWithRed:86/255.0 green:198/255.0 blue:210/255.0 alpha:1.0];
    btmContainerView.backgroundColor = [UIColor colorWithRed:21/255.0 green:150/255.0 blue:136/255.0 alpha:1.0];
    
    
    
    [self addSubview:statusBarView];
    [self addSubview:topContainerView];

    
    //MUST INIT THE WIDTHS OF THE left,middle and rightBarContainerViews
    [self setUpBarContainerWidthPoint:0.33f middleBarWidthPoint:0.33f];
    
    
    [barContainerView addSubview:leftBarContainerView];
    [barContainerView addSubview:middleBarContainerView];
    [barContainerView addSubview:rightBarContainerView];

    [self addSubview:barContainerView];
    [self addSubview:btmContainerView];
    
}


-(void)removeAllConstraintsFromSbNav:(UIView *)view// All Constraint of the UIView and its childs are cleared
{
    
    [view removeConstraints:view.constraints];
    for (UIView * uv in [view subviews]) {
        [self removeAllConstraintsFromSbNav:uv];
    }
    
}

#pragma -mark
#pragma -mark CONSTRAINTS HANDLING

-(void)attachSBNavBarSelfConstraints
{
    /**
     SBNavBar Constraints
     */
    
    mainViewCtBlob = [[SBCtBlob alloc] initwithLeft:0 topPadding:0 rightPadding:0 btmPadding:-([UIScreen mainScreen].bounds.size.height-((defaultBarContainerHeight+defaultTopContainerHeight+defaultBtmContainerHeight)+ statusBarHeight)) ];
    
    
    self.translatesAutoresizingMaskIntoConstraints=NO;
    //self.superview.translatesAutoresizingMaskIntoConstraints=NO;
    
    
    mainViewLeftCt = [NSLayoutConstraint constraintWithItem:self
                                                  attribute:NSLayoutAttributeLeft
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:self.superview
                                                  attribute:NSLayoutAttributeLeft
                                                 multiplier:1.0
                                                   constant:mainViewCtBlob.leftPadding];
    
    mainViewTopCt = [NSLayoutConstraint constraintWithItem:self
                                                 attribute:NSLayoutAttributeTop
                                                 relatedBy:NSLayoutRelationEqual
                                                    toItem:self.superview
                                                 attribute:NSLayoutAttributeTop
                                                multiplier:1.0
                                                  constant:mainViewCtBlob.topPadding];
    
    mainViewRightCt = [NSLayoutConstraint constraintWithItem:self
                                                   attribute:NSLayoutAttributeRight
                                                   relatedBy:NSLayoutRelationEqual
                                                      toItem:self.superview
                                                   attribute:NSLayoutAttributeRight
                                                  multiplier:1.0
                                                    constant:mainViewCtBlob.rightPadding];
    
    mainViewBtmCt = [NSLayoutConstraint constraintWithItem:self
                                                 attribute:NSLayoutAttributeBottom
                                                 relatedBy:NSLayoutRelationEqual
                                                    toItem:self.superview
                                                 attribute:NSLayoutAttributeBottom
                                                multiplier:1.0
                                                  constant:mainViewCtBlob.btmPadding];
    
    [self.superview addConstraints:@[mainViewLeftCt,mainViewTopCt,mainViewRightCt,mainViewBtmCt]];
    
}
-(void)attachStatusBarConstraints
{
    /**
     STATUS BAR CONSTRAINTS
     */
    
    statusBarView.translatesAutoresizingMaskIntoConstraints=NO;
    statusBarCtBlob = [[SBCtBlob alloc] initwithLeft:0 topPadding:0 rightPadding:0 btmPadding:-(defaultBarContainerHeight+defaultTopContainerHeight+defaultBtmContainerHeight)];
    
    statusBarLeftCt = [NSLayoutConstraint constraintWithItem:statusBarView
                                                   attribute:NSLayoutAttributeLeft
                                                   relatedBy:NSLayoutRelationEqual
                                                      toItem:self
                                                   attribute:NSLayoutAttributeLeft
                                                  multiplier:1.0
                                                    constant:statusBarCtBlob.leftPadding];
    
    statusBarTopCt = [NSLayoutConstraint constraintWithItem:statusBarView
                                                  attribute:NSLayoutAttributeTop
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:self
                                                  attribute:NSLayoutAttributeTop
                                                 multiplier:1.0
                                                   constant:statusBarCtBlob.topPadding];
    
    statusBarRightCt = [NSLayoutConstraint constraintWithItem:statusBarView
                                                    attribute:NSLayoutAttributeRight
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self
                                                    attribute:NSLayoutAttributeRight
                                                   multiplier:1.0
                                                     constant:statusBarCtBlob.rightPadding];
    
    statusBarBtmCt = [NSLayoutConstraint constraintWithItem:statusBarView
                                                  attribute:NSLayoutAttributeBottom
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:self
                                                  attribute:NSLayoutAttributeBottom
                                                 multiplier:1.0
                                                   constant:statusBarCtBlob.btmPadding];
    
    [self addConstraints:@[statusBarLeftCt,statusBarTopCt,statusBarRightCt,statusBarBtmCt]];
    
}

-(void)attachTopContainerConstraints
{
    /**
     TOPCONTAINER BAR CONSTRAINTS
     */
    
    topContainerView.translatesAutoresizingMaskIntoConstraints=NO;
    topContainerCtBlob = [[SBCtBlob alloc] initwithLeft:0 topPadding:0 rightPadding:0 btmPadding:-(defaultBarContainerHeight+defaultBtmContainerHeight)];
    
    topContainerLeftCt = [NSLayoutConstraint constraintWithItem:topContainerView
                                                   attribute:NSLayoutAttributeLeft
                                                   relatedBy:NSLayoutRelationEqual
                                                      toItem:self
                                                   attribute:NSLayoutAttributeLeft
                                                  multiplier:1.0
                                                    constant:topContainerCtBlob.leftPadding];
    
    topContainerTopCt = [NSLayoutConstraint constraintWithItem:topContainerView
                                                  attribute:NSLayoutAttributeTop
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:statusBarView
                                                  attribute:NSLayoutAttributeBottom
                                                 multiplier:1.0
                                                   constant:topContainerCtBlob.topPadding];
    
    topContainerRightCt = [NSLayoutConstraint constraintWithItem:topContainerView
                                                    attribute:NSLayoutAttributeRight
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self
                                                    attribute:NSLayoutAttributeRight
                                                   multiplier:1.0
                                                     constant:topContainerCtBlob.rightPadding];
    
    topContainerBtmCt = [NSLayoutConstraint constraintWithItem:topContainerView
                                                  attribute:NSLayoutAttributeBottom
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:self
                                                  attribute:NSLayoutAttributeBottom
                                                 multiplier:1.0
                                                   constant:topContainerCtBlob.btmPadding];
    
    
    [self addConstraints:@[topContainerLeftCt,topContainerTopCt,topContainerRightCt,topContainerBtmCt]];
    
    
}
-(void)attachBarContainerConstraints
{
    /**
     BTMCONTAINER BAR CONSTRAINTS
     */
    
    barContainerView.translatesAutoresizingMaskIntoConstraints=NO;
    barContainerCtBlob = [[SBCtBlob alloc] initwithLeft:0 topPadding:0 rightPadding:0 btmPadding:-defaultBtmContainerHeight];
    
    barContainerLeftCt = [NSLayoutConstraint constraintWithItem:barContainerView
                                                      attribute:NSLayoutAttributeLeft
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                      attribute:NSLayoutAttributeLeft
                                                     multiplier:1.0
                                                       constant:barContainerCtBlob.leftPadding];
    
    barContainerTopCt = [NSLayoutConstraint constraintWithItem:barContainerView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:topContainerView
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:barContainerCtBlob.topPadding];
    
    barContainerRightCt = [NSLayoutConstraint constraintWithItem:barContainerView
                                                       attribute:NSLayoutAttributeRight
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self
                                                       attribute:NSLayoutAttributeRight
                                                      multiplier:1.0
                                                        constant:barContainerCtBlob.rightPadding];
    
    barContainerBtmCt = [NSLayoutConstraint constraintWithItem:barContainerView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:barContainerCtBlob.btmPadding];
    
    
    
    
    
    [self addConstraints:@[barContainerLeftCt,barContainerTopCt,barContainerRightCt,barContainerBtmCt]];
    
    
    //ATTACH LEFT_BAR_CONAINER, MIDDLE_BAR_CONTAINER AND RIGHT_BAR_CONTAINER CONSTRAINTS
    
    
    [self attachLeftBarContainerConstraints];
    [self attachMiddleBarContainerConstraints];
    [self attachRightBarContainerConstraints];
    
    
    
    
}
-(void)attachLeftBarContainerConstraints
{
    leftBarContainerView.translatesAutoresizingMaskIntoConstraints=NO;
    leftBarContainerCtBlob = [[SBCtBlob alloc] initwithLeft:2*defaultBarContainerHorizontalPadding topPadding:defaultBarContainerVerticalPadding rightPadding:-(defaultBarContainerHorizontalPadding*4 + barContainerMiddlerBarWidth+barContainerRightBarWidth) btmPadding:-defaultBarContainerVerticalPadding];

    
    //leftBarContainerCtBlob = [[SBCtBlob alloc] initwithLeft:0 topPadding:0 rightPadding:20 btmPadding:0];
    SBLog(@"attachLeftBarContainerConstraints %@",[leftBarContainerCtBlob debugDescription]);
    
    leftBarContainerLeftCt = [NSLayoutConstraint constraintWithItem:leftBarContainerView
                                                      attribute:NSLayoutAttributeLeft
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:barContainerView
                                                      attribute:NSLayoutAttributeLeft
                                                     multiplier:1.0
                                                       constant:leftBarContainerCtBlob.leftPadding];
    
    leftBarContainerTopCt = [NSLayoutConstraint constraintWithItem:leftBarContainerView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:barContainerView
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:leftBarContainerCtBlob.topPadding];
    
    leftBarContainerRightCt = [NSLayoutConstraint constraintWithItem:leftBarContainerView
                                                       attribute:NSLayoutAttributeRight
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:barContainerView
                                                       attribute:NSLayoutAttributeRight
                                                      multiplier:1.0
                                                        constant:leftBarContainerCtBlob.rightPadding];
    
    leftBarContainerBtmCt = [NSLayoutConstraint constraintWithItem:leftBarContainerView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:barContainerView
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:leftBarContainerCtBlob.btmPadding];
    
    
    [barContainerView addConstraints:@[leftBarContainerLeftCt,leftBarContainerTopCt,leftBarContainerRightCt,leftBarContainerBtmCt]];
    
    
    
    
}
-(void)attachMiddleBarContainerConstraints
{
    middleBarContainerView.translatesAutoresizingMaskIntoConstraints=NO;
    middleBarContainerCtBlob = [[SBCtBlob alloc] initwithLeft:3*defaultBarContainerHorizontalPadding+barContainerLeftBarWidth topPadding:defaultBarContainerVerticalPadding rightPadding:-(defaultBarContainerHorizontalPadding*3 + barContainerRightBarWidth) btmPadding:-defaultBarContainerVerticalPadding];
    
    
    //leftBarContainerCtBlob = [[SBCtBlob alloc] initwithLeft:0 topPadding:0 rightPadding:20 btmPadding:0];
    SBLog(@"attachMiddleBarContainerConstraints %@",[leftBarContainerCtBlob debugDescription]);
    
    middleBarContainerLeftCt = [NSLayoutConstraint constraintWithItem:middleBarContainerView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:barContainerView
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:middleBarContainerCtBlob.leftPadding];
    
    middleBarContainerTopCt = [NSLayoutConstraint constraintWithItem:middleBarContainerView
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:barContainerView
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:middleBarContainerCtBlob.topPadding];
    
    middleBarContainerRightCt = [NSLayoutConstraint constraintWithItem:middleBarContainerView
                                                           attribute:NSLayoutAttributeRight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:barContainerView
                                                           attribute:NSLayoutAttributeRight
                                                          multiplier:1.0
                                                            constant:middleBarContainerCtBlob.rightPadding];
    
    middleBarContainerBtmCt = [NSLayoutConstraint constraintWithItem:middleBarContainerView
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:barContainerView
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:middleBarContainerCtBlob.btmPadding];
    
    
    [barContainerView addConstraints:@[middleBarContainerLeftCt,middleBarContainerTopCt,middleBarContainerRightCt,middleBarContainerBtmCt]];
    
    
    
    
}
-(void)attachRightBarContainerConstraints
{
    rightBarContainerView.translatesAutoresizingMaskIntoConstraints=NO;
    rightBarContainerCtBlob = [[SBCtBlob alloc] initwithLeft:4*defaultBarContainerHorizontalPadding+barContainerLeftBarWidth+barContainerMiddlerBarWidth topPadding:defaultBarContainerVerticalPadding rightPadding:-(defaultBarContainerHorizontalPadding*1) btmPadding:-defaultBarContainerVerticalPadding];
    
    
    //leftBarContainerCtBlob = [[SBCtBlob alloc] initwithLeft:0 topPadding:0 rightPadding:20 btmPadding:0];
    SBLog(@"attachRightBarContainerConstraints %@",[leftBarContainerCtBlob debugDescription]);
    
    rightBarContainerLeftCt = [NSLayoutConstraint constraintWithItem:rightBarContainerView
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:barContainerView
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1.0
                                                             constant:rightBarContainerCtBlob.leftPadding];
    
    rightBarContainerTopCt = [NSLayoutConstraint constraintWithItem:rightBarContainerView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:barContainerView
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:rightBarContainerCtBlob.topPadding];
    
    rightBarContainerRightCt = [NSLayoutConstraint constraintWithItem:rightBarContainerView
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:barContainerView
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1.0
                                                              constant:rightBarContainerCtBlob.rightPadding];
    
    rightBarContainerBtmCt = [NSLayoutConstraint constraintWithItem:rightBarContainerView
                                                           attribute:NSLayoutAttributeBottom
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:barContainerView
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:rightBarContainerCtBlob.btmPadding];
    
    
    [barContainerView addConstraints:@[rightBarContainerLeftCt,rightBarContainerTopCt,rightBarContainerRightCt,rightBarContainerBtmCt]];
    
    
    
    
}
-(void)attachBtmContainerConstraints
{
    /**
     BTMCONTAINER BAR CONSTRAINTS
     */
    
    btmContainerView.translatesAutoresizingMaskIntoConstraints=NO;
    btmContainerCtBlob = [[SBCtBlob alloc] initwithLeft:0 topPadding:0 rightPadding:0 btmPadding:-0];
    
    btmContainerLeftCt = [NSLayoutConstraint constraintWithItem:btmContainerView
                                                      attribute:NSLayoutAttributeLeft
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                      attribute:NSLayoutAttributeLeft
                                                     multiplier:1.0
                                                       constant:btmContainerCtBlob.leftPadding];
    
    btmContainerTopCt = [NSLayoutConstraint constraintWithItem:btmContainerView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:barContainerView
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:btmContainerCtBlob.topPadding];
    
    btmContainerRightCt = [NSLayoutConstraint constraintWithItem:btmContainerView
                                                       attribute:NSLayoutAttributeRight
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self
                                                       attribute:NSLayoutAttributeRight
                                                      multiplier:1.0
                                                        constant:btmContainerCtBlob.rightPadding];
    
    btmContainerBtmCt = [NSLayoutConstraint constraintWithItem:btmContainerView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:btmContainerCtBlob.btmPadding];
    
    
    [self addConstraints:@[btmContainerLeftCt,btmContainerTopCt,btmContainerRightCt,btmContainerBtmCt]];
    
    
}


-(void)attachConstraints
{

    SBLog(@"DINGOLA %@ %@",NSStringFromClass([self class]),NSStringFromClass([self.superview class]));
    [self attachSBNavBarSelfConstraints];
    [self attachStatusBarConstraints];
    [self attachTopContainerConstraints];
    [self attachBarContainerConstraints];
    [self attachBtmContainerConstraints];
    
    
    
    
    
    
    
//============================================================================================
    
//
//    NSString * selfHorizontalCtString = [NSString stringWithFormat:@"H:|-%d-[self]-%d-|",mainViewCtBlob.leftPadding,mainViewCtBlob.rightPadding];
//    NSString * selfVerticalCtString = [NSString stringWithFormat:@"V:|-%d-[self]-%d-|",mainViewCtBlob.topPadding,mainViewCtBlob.btmPadding];
//
//    NSArray *selfHorizontalCts =[NSLayoutConstraint constraintsWithVisualFormat:selfHorizontalCtString options:0 metrics:nil views:sbNavBarViewsDict];
//    NSArray *selfVerticalCts =[NSLayoutConstraint constraintsWithVisualFormat:selfVerticalCtString options:0 metrics:nil views:sbNavBarViewsDict];
//
//    SBLog(@"futttialaaa");
//    [self.superview addConstraints:selfHorizontalCts];
//    [self.superview addConstraints:selfVerticalCts];
    
    //SBLog(@"%@ dimbo constraints %@  liptok",[mainViewCtBlob debugDescription],[self.superview constraints]);
    
    self.backgroundColor = [UIColor blueColor];
 
    SBLog(@"attachConstraints Called");
}

-(void)updateConstraints
{
    [super updateConstraints];
    SBLog(@"updateConstraints Called");
    [self updateNeededCtBlobs];
    
    mainViewLeftCt.constant = mainViewCtBlob.leftPadding;
    mainViewTopCt.constant = mainViewCtBlob.topPadding;
    mainViewRightCt.constant = mainViewCtBlob.rightPadding;
    mainViewBtmCt.constant = mainViewCtBlob.btmPadding;
    
    
    leftBarContainerLeftCt.constant = leftBarContainerCtBlob.leftPadding;
    leftBarContainerTopCt.constant = leftBarContainerCtBlob.topPadding;
    leftBarContainerRightCt.constant = leftBarContainerCtBlob.rightPadding;
    leftBarContainerBtmCt.constant = leftBarContainerCtBlob.btmPadding;
    
    middleBarContainerLeftCt.constant = middleBarContainerCtBlob.leftPadding;
    middleBarContainerTopCt.constant = middleBarContainerCtBlob.topPadding;
    middleBarContainerRightCt.constant = middleBarContainerCtBlob.rightPadding;
    middleBarContainerBtmCt.constant = middleBarContainerCtBlob.btmPadding;
    
    rightBarContainerLeftCt.constant = rightBarContainerCtBlob.leftPadding;
    rightBarContainerTopCt.constant = rightBarContainerCtBlob.topPadding;
    rightBarContainerRightCt.constant = rightBarContainerCtBlob.rightPadding;
    rightBarContainerBtmCt.constant = rightBarContainerCtBlob.btmPadding;
    
}

#pragma -mark


-(void)updateNeededCtBlobs
{
    mainViewCtBlob.btmPadding =-([UIScreen mainScreen].bounds.size.height-((defaultBarContainerHeight+defaultTopContainerHeight+defaultBtmContainerHeight)+ statusBarHeight));
    SBLog(@"(defaultBarContainerHeight+statusBarHeight) %d",(defaultBarContainerHeight+statusBarHeight));
    
    
    leftBarContainerCtBlob = [[SBCtBlob alloc] initwithLeft:2*defaultBarContainerHorizontalPadding topPadding:defaultBarContainerVerticalPadding rightPadding:-(defaultBarContainerHorizontalPadding*4 + barContainerMiddlerBarWidth+barContainerRightBarWidth) btmPadding:-defaultBarContainerVerticalPadding];
    middleBarContainerCtBlob = [[SBCtBlob alloc] initwithLeft:3*defaultBarContainerHorizontalPadding+barContainerLeftBarWidth topPadding:defaultBarContainerVerticalPadding rightPadding:-(defaultBarContainerHorizontalPadding*3 + barContainerRightBarWidth) btmPadding:-defaultBarContainerVerticalPadding];
    rightBarContainerCtBlob = [[SBCtBlob alloc] initwithLeft:4*defaultBarContainerHorizontalPadding+barContainerLeftBarWidth+barContainerMiddlerBarWidth topPadding:defaultBarContainerVerticalPadding rightPadding:-(defaultBarContainerHorizontalPadding*1) btmPadding:-defaultBarContainerVerticalPadding];
    
    
    
}

-(void)setupMainViewCtBlob:(SBCtBlob *)blob
{
    mainViewCtBlob.leftPadding = blob.leftPadding;
    mainViewCtBlob.topPadding = blob.topPadding;
    mainViewCtBlob.rightPadding = blob.rightPadding;
    mainViewCtBlob.btmPadding = blob.btmPadding;
}

-(void)setupStatusBarCtBlob:(SBCtBlob *)blob
{
    statusBarCtBlob.leftPadding = blob.leftPadding;
    statusBarCtBlob.topPadding = blob.topPadding;
    statusBarCtBlob.rightPadding = blob.rightPadding;
    statusBarCtBlob.btmPadding = blob.btmPadding;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    SBLog(@"awakeFromNib");
    
}

//Then add the following method:




#pragma -mark Helper Methods

/**
 This Method sets up the leftBar,Middle Bar and rightBar widths..
 
 left, middle and right BarWidthPoint are as such
 leftBarContainerWidthPoint+middleBarWidthPoint+rightBarWidthPoint = 1.0
 
 So the point should be given according to the wanted width of each bar respective to  defaultBarContainerWidth
 */

-(void)setUpBarContainerWidthPoint:(float)leftBarContainerWidthPoint
               middleBarWidthPoint:(float)middleBarWidthPoint
{
    
    
    currentBarContainerLeftBarWidthPoint=leftBarContainerWidthPoint;
    currentBarContainerMiddlerBarWidthPoint = middleBarWidthPoint;
    currentBarContainerRightBarWidthPoint = 1.0-leftBarContainerWidthPoint-middleBarWidthPoint;
    barContainerLeftBarWidth = (int)(currentBarContainerLeftBarWidthPoint* defaultBarContainerWidth);
    barContainerMiddlerBarWidth = (int)(currentBarContainerMiddlerBarWidthPoint* defaultBarContainerWidth);
    barContainerRightBarWidth = defaultBarContainerWidth-barContainerMiddlerBarWidth-barContainerLeftBarWidth ;
    
    SBLog(@"barContainerLeftBarWidth %d %d %d",barContainerLeftBarWidth,barContainerMiddlerBarWidth,barContainerRightBarWidth);
    
    
}


#pragma -mark Getters

-(NSMutableDictionary *)getLeftBarContainerToCustomize
{
    
    NSMutableDictionary  * retDict = [NSMutableDictionary dictionary];
    
    [retDict setObject:leftBarContainerView forKey:@"view"];
    [retDict setObject:[NSNumber numberWithInt:barContainerLeftBarWidth] forKey:@"width"];
    [retDict setObject:[NSNumber numberWithInt:defaultBarContainerHeight-2*defaultBarContainerVerticalPadding] forKey:@"height"];
    
    
    return retDict;
    
}
-(void)setLeftBarContainer:(UIView *)uv
{
    [leftBarContainerView removeFromSuperview];
    leftBarContainerView = uv;
    [barContainerView addSubview:leftBarContainerView];
    [self attachLeftBarContainerConstraints];
    
    
    leftBarContainerView.clipsToBounds = YES;
    
    [self updateConstraints];
    
}




#pragma -mark Orientation Related

- (void) orientationChanged:(NSNotification *)note
{
   
    UIDevice * device = note.object;
    
    SBLog(@"orientation Changed %f %f %f",[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height,[[UIApplication sharedApplication] statusBarFrame].size.height);
    defaultBarContainerWidth = [UIScreen mainScreen].bounds.size.width;
    [self setUpBarContainerWidthPoint:currentBarContainerLeftBarWidthPoint middleBarWidthPoint:currentBarContainerMiddlerBarWidthPoint];
    switch(device.orientation)
    {
        
        case UIDeviceOrientationPortrait:
        {
            SBLog(@"UIDeviceOrientationPortrait");
            statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
            statusBarHeight = statusBarHeight==0? defaultStatusBarHeight:statusBarHeight;
        }
            break;
        case UIDeviceOrientationPortraitUpsideDown:
        {
            SBLog(@"UIDeviceOrientationPortrait");
            statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
            statusBarHeight = statusBarHeight==0? defaultStatusBarHeight:statusBarHeight;
        }
            break;
        case UIDeviceOrientationUnknown:
            
        {
            SBLog(@"UIDeviceOrientationUnknown");
        }
            break;
        case UIDeviceOrientationFaceUp:
            
        {
            SBLog(@"UIDeviceOrientationFaceUp");
        }
            break;
        case UIDeviceOrientationFaceDown:
            
        {
            SBLog(@"UIDeviceOrientationFaceDown");
        }
            break;
        case UIDeviceOrientationLandscapeLeft:
        {
            SBLog(@"UIDeviceOrientationLandscapeLeft");
        }
            break;
        case UIDeviceOrientationLandscapeRight:
        {
            SBLog(@"UIDeviceOrientationLandscapeRight");
        }
            break;
        default:
        {
            statusBarHeight= defaultStatusBarHeight;
        }
            break;
    };
    [self updateConstraints];
    //[self attachConstraints];
    [self layoutSubviews];
    //[barContainerView layoutSubviews];
}



@end
