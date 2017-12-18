//
//  SBNavBarView.m
//  SBNavBar
//
//  Created by Saiful Islam on 9/28/17.
//  Copyright © 2017 saiful. All rights reserved.
//

#import "SBNavBarView.h"
#import "SBNavBarView+SBNavBarExtender.h"
#import "SBCtBlob.h"




/**
 
                             SBNavBarView Layout
 
          --------------------------------------------------------
         |                      STATUS BAR                        |
          --------------------------------------------------------
         |                    TOP CONTAINER                       |
          --------------------------------------------------------
         |                     BAR CONTAINER                      |
         | ------------   -------------------------   ----------- |
         || LEFT BAR   | |       MIDDLE BAR        | | RIGHT BAR ||
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




@interface SBNavBarView()
{
    
}
@property(nonatomic,assign) int defaultTabBarHeight ; //If Tab Bar in Btm is Active
@end


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
    
    //BARIMAGEVIEW
    /**
     barImageView is a background Image of BarContainer.. if BarContainer Constraints are changed.. Then BarImageView Constraints MUST be changed accordingly;
     */
    SBCtBlob * barImageCtBlob;// This Blob Constraints is related to SBNavBarView
    
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
     BAR IMAGE CONSTRAINTS
     */
    
    NSLayoutConstraint * barImageLeftCt;
    NSLayoutConstraint * barImageTopCt;
    NSLayoutConstraint * barImageRightCt;
    NSLayoutConstraint * barImageBtmCt;
    
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
    
    
    /**
     view inits
     */
    
    if(self)
    {
        [self attachSubViews];
        [self configureStandardBarImage];
        
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
        
        _defaultTabBarHeight=0;
        
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
    }
    
    
    
    return self;
}


-(id)initForTab
{
    if ([self init]) {
        if ([[UIScreen mainScreen] nativeBounds].size.height==2436)//since there is no system api to detect iPhone X now.. using this as a work around for now
        {
            _defaultTabBarHeight=83;
        }
        else{
            _defaultTabBarHeight=DEFAULT_SYSTEM_TAB_BAR_HEIGHT;
        }
    }
    
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
    
    statusBarView.clipsToBounds = YES;
    topContainerView.clipsToBounds = YES;
    barContainerView.clipsToBounds = YES;
    barImageView.clipsToBounds = YES;
    leftBarContainerView.clipsToBounds = YES;
    rightBarContainerView.clipsToBounds = YES;
    middleBarContainerView.clipsToBounds = YES;
    btmContainerView.clipsToBounds = YES;
    
   
    statusBarView.backgroundColor = STATUSBAR_BACK_COLOR;
    topContainerView.backgroundColor = TOP_CONTAINER_BACK_COLOR;
    barContainerView.backgroundColor = BAR_CONTAINER_BACK_COLOR;
    leftBarContainerView.backgroundColor = LEFTBAR_CONTAINER_BACK_COLOR;
    middleBarContainerView.backgroundColor =MIDBAR_CONTAINER_BACK_COLOR ;
    rightBarContainerView.backgroundColor = RIGHTBAR_CONTAINER_BACK_COLOR;
    btmContainerView.backgroundColor =BTM_CONTAINER_BACK_COLOR ;
    
    
    
    [self addSubview:statusBarView];
    [self addSubview:topContainerView];

    
    //MUST INIT THE WIDTHS OF THE left,middle and rightBarContainerViews
    [self setUpBarContainerWidthPoint:0.33f middleBarWidthPoint:0.33f];//Default
    
    
    [barContainerView addSubview:leftBarContainerView];
    [barContainerView addSubview:middleBarContainerView];
    [barContainerView addSubview:rightBarContainerView];

    [self addSubview:barImageView];
    [self addSubview:barContainerView];
    
    [self addSubview:btmContainerView];
    
}




#pragma -mark
#pragma -mark CONSTRAINTS HANDLING

-(void)attachSBNavBarSelfConstraints
{
    /**
     SBNavBar Constraints
     */
    
    mainViewCtBlob = [[SBCtBlob alloc] initwithLeft:0 topPadding:0 rightPadding:0 btmPadding:-([UIScreen mainScreen].bounds.size.height-_defaultTabBarHeight-((defaultBarContainerHeight+defaultTopContainerHeight+defaultBtmContainerHeight)+ statusBarHeight)) ];
    
    
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

-(void)attachBarImageConstraints
{
    /**
     BTMCONTAINER BAR CONSTRAINTS
     */
    
    barImageView.translatesAutoresizingMaskIntoConstraints=NO;
    barImageCtBlob = [[SBCtBlob alloc] initwithLeft:0 topPadding:0 rightPadding:0 btmPadding:-defaultBtmContainerHeight];
    
    barImageLeftCt = [NSLayoutConstraint constraintWithItem:barImageView
                                                      attribute:NSLayoutAttributeLeft
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                      attribute:NSLayoutAttributeLeft
                                                     multiplier:1.0
                                                       constant:barImageCtBlob.leftPadding];
    
    barImageTopCt = [NSLayoutConstraint constraintWithItem:barImageView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:topContainerView
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:barImageCtBlob.topPadding];
    
    barImageRightCt = [NSLayoutConstraint constraintWithItem:barImageView
                                                       attribute:NSLayoutAttributeRight
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self
                                                       attribute:NSLayoutAttributeRight
                                                      multiplier:1.0
                                                        constant:barImageCtBlob.rightPadding];
    
    barImageBtmCt = [NSLayoutConstraint constraintWithItem:barImageView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:barImageCtBlob.btmPadding];
    
    
    
    
    
    [self addConstraints:@[barImageLeftCt,barImageTopCt,barImageRightCt,barImageBtmCt]];
    
    
    
    
    
    
    
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


    [self attachSBNavBarSelfConstraints];
    [self attachStatusBarConstraints];
    [self attachTopContainerConstraints];
    [self attachBarContainerConstraints];
    [self attachBarImageConstraints];
    [self attachBtmContainerConstraints];
    
    
    
    
    
    
    
//============================================================================================
    
//
//    NSString * selfHorizontalCtString = [NSString stringWithFormat:@"H:|-%d-[self]-%d-|",mainViewCtBlob.leftPadding,mainViewCtBlob.rightPadding];
//    NSString * selfVerticalCtString = [NSString stringWithFormat:@"V:|-%d-[self]-%d-|",mainViewCtBlob.topPadding,mainViewCtBlob.btmPadding];
//
//    NSArray *selfHorizontalCts =[NSLayoutConstraint constraintsWithVisualFormat:selfHorizontalCtString options:0 metrics:nil views:sbNavBarViewsDict];
//    NSArray *selfVerticalCts =[NSLayoutConstraint constraintsWithVisualFormat:selfVerticalCtString options:0 metrics:nil views:sbNavBarViewsDict];
//
//    [self.superview addConstraints:selfHorizontalCts];
//    [self.superview addConstraints:selfVerticalCts];
    
    
    self.backgroundColor = [UIColor blueColor];
 
   
}


/**
   ViewArray should Contain--
     @{
         itemAttribute,
         relatedBy,
         toItem,
         toitemAttribute,
         multiplier
 
     }
 */
-(void)attachConstraintForView:(UIView*)uv
                  withSbCTBlob:(SBCtBlob *)blob
                andLeftViewArr:(NSArray*)leftViewArr
                 andTopViewArr:(NSArray*)topViewArr
               andRightViewArr:(NSArray *)rightViewArr
                 andBtmViewArr:(NSArray *)btmViewArr
                   andWidthArr:(NSArray *)widthArr
                  andHeightArr:(NSArray *)heightArr
                  andSuperView:(UIView *)superView
{
    uv.translatesAutoresizingMaskIntoConstraints=NO;
    NSLayoutConstraint* uvLeftCt, * uvTopCt, * uvRightCt, * uvBtmCt,*uvWidthCt,*uvHeightCt;
    
    
    if (leftViewArr) {
        uvLeftCt = [NSLayoutConstraint constraintWithItem:uv
                                                attribute:(NSLayoutAttribute)[leftViewArr[0] integerValue]
                                                relatedBy:(NSLayoutRelation)[leftViewArr[1] integerValue]
                                                   toItem:leftViewArr[2]
                                                attribute:(NSLayoutAttribute)[leftViewArr[3] integerValue]
                                               multiplier:[leftViewArr[4] floatValue]
                                                 constant:blob.leftPadding];
        [superView addConstraint:uvLeftCt];
    }
    if (topViewArr) {
        uvTopCt = [NSLayoutConstraint constraintWithItem:uv
                                               attribute:(NSLayoutAttribute)[topViewArr[0] integerValue]
                                               relatedBy:(NSLayoutRelation)[topViewArr[1] integerValue]
                                                  toItem:topViewArr[2]
                                               attribute:(NSLayoutAttribute)[topViewArr[3] integerValue]
                                              multiplier:[topViewArr[4] floatValue]
                                                constant:blob.topPadding];
        [superView addConstraint:uvTopCt];
    }
    if (rightViewArr) {
        uvRightCt = [NSLayoutConstraint constraintWithItem:uv
                                                 attribute:(NSLayoutAttribute)[rightViewArr[0] integerValue]
                                                 relatedBy:(NSLayoutRelation)[rightViewArr[1] integerValue]
                                                    toItem:rightViewArr[2]
                                                 attribute:(NSLayoutAttribute)[rightViewArr[3] integerValue]
                                                multiplier:[rightViewArr[4] floatValue]
                                                  constant:-blob.rightPadding];
        [superView addConstraint:uvRightCt];
    }
    
    if (btmViewArr) {
        uvBtmCt = [NSLayoutConstraint constraintWithItem:uv
                                               attribute:(NSLayoutAttribute)[btmViewArr[0] integerValue]
                                               relatedBy:(NSLayoutRelation)[btmViewArr[1] integerValue]
                                                  toItem:btmViewArr[2]
                                               attribute:(NSLayoutAttribute)[btmViewArr[3] integerValue]
                                              multiplier:[btmViewArr[4] floatValue]
                                                constant:-blob.btmPadding];
        [superView addConstraint:uvBtmCt];
    }
    if(widthArr)
    {
        uvWidthCt = [NSLayoutConstraint constraintWithItem:uv
                                               attribute:(NSLayoutAttribute)[widthArr[0] integerValue]
                                               relatedBy:(NSLayoutRelation)[widthArr[1] integerValue]
                                                  toItem:nil
                                               attribute:(NSLayoutAttribute)[widthArr[3] integerValue]
                                              multiplier:[widthArr[4] floatValue]
                                                constant:blob.width];
        [superView addConstraint:uvWidthCt];
    }
    if (heightArr) {
        uvHeightCt =[NSLayoutConstraint constraintWithItem:uv
                                                 attribute:(NSLayoutAttribute)[heightArr[0] integerValue]
                                                 relatedBy:(NSLayoutRelation)[heightArr[1] integerValue]
                                                    toItem:nil
                                                 attribute:(NSLayoutAttribute)[heightArr[3] integerValue]
                                                multiplier:[heightArr[4] floatValue]
                                                  constant:blob.height];
        [superView addConstraint:uvHeightCt];
    }

    
}


-(void)updateConstraints
{
    [super updateConstraints];
   
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
     mainViewCtBlob.btmPadding =-([UIScreen mainScreen].bounds.size.height-_defaultTabBarHeight -((defaultBarContainerHeight+defaultTopContainerHeight+defaultBtmContainerHeight)+ statusBarHeight));
    
    
    
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
   
    
}

//Then add the following method:




#pragma -mark Helper Methods


-(void)setUpBarContainerWidthPoint:(float)leftBarContainerWidthPoint
               middleBarWidthPoint:(float)middleBarWidthPoint
{
    NSAssert(leftBarContainerWidthPoint+middleBarWidthPoint<=1.0, @"\n\n\n ***** Invalid Width Point set!!! *****\n\n");
    
    currentBarContainerLeftBarWidthPoint=leftBarContainerWidthPoint;
    currentBarContainerMiddlerBarWidthPoint = middleBarWidthPoint;
    currentBarContainerRightBarWidthPoint = 1.0-leftBarContainerWidthPoint-middleBarWidthPoint;
    barContainerLeftBarWidth = (int)(currentBarContainerLeftBarWidthPoint* defaultBarContainerWidth);
    barContainerMiddlerBarWidth = (int)(currentBarContainerMiddlerBarWidthPoint* defaultBarContainerWidth);
    barContainerRightBarWidth = defaultBarContainerWidth-barContainerMiddlerBarWidth-barContainerLeftBarWidth ;
    
    
    
    
}

-(UIView *)getContainerViewForContainerType:(SBContainerType)containerType
{
    UIView * retView = [[UIView alloc] init];
    
    
    switch (containerType) {
        case SBContainerTypeStatusBar:
            retView  = statusBarView;
            break;
            
        case SBContainerTypeTopContainer:
            retView = topContainerView;
            break;
        case SBContainerTypeBarImage:
            retView = barImageView;
            break;
        case SBContainerTypeBarContainer:
            retView = barContainerView;
            break;
        case SBContainerTypeLeftBarContainer:
            retView = leftBarContainerView;
            break;
        case SBContainerTypeMiddleBarContainer:
            retView = middleBarContainerView;
            break;
        case SBContainerTypeRightBarContainer:
            retView = rightBarContainerView;
            break;
        case SBContainerTypeBtmContainer:
            retView = btmContainerView;
            break;
            
            
        default:
            break;
    }
    
    return retView;
    
}




-(void)setupBarContainerWithViews:(NSArray *)views
                 forContainerType:(SBContainerType)containerType
                        alignment:(SBAlignment)alignment
                isTopverticalWall:(bool)isTop/// if isTop==true the top is the vertical wall else- bottom
{
    
    
    
    UIView * containerView = [self getContainerViewForContainerType:containerType];
    
    //NSDictionary * getInfoOfContinerView = [self getContainerInfo:containerType];
    
    
    int viewCount=(int)[views count];
    
    UIView * leftView,*rightView;
    
    for (int i=0; i<viewCount; i++) {
        [containerView addSubview:[views objectAtIndex:i][0]];
    }
    
    int midView = (viewCount & 1)? viewCount>>1:(viewCount>>1)-1 ; //finding mid View for CenterAlignment
        
    for (int i=0; i<viewCount; i++)
    {
        NSArray * arrayAtIndex = [views objectAtIndex:i];
        
        //NSAssert((([arrayAtIndex count]!=2) && [arrayAtIndex[1]isKindOfClass:[SBCtBlob class]]), @"\n\n###Invalid! setupBarContainerWithViews Parameters!###\n");
        
      
        leftView = (i==0) ? containerView :[views objectAtIndex:i-1][0];
        rightView = (i==viewCount-1)?containerView:[views objectAtIndex:i+1][0];
        
        NSMutableArray * leftAttributeArr,*topAttributeArr, *rightAttributeArr, *btmAttributeArr,*widthAttributeArr,*heightAttributeArr;
        
        leftAttributeArr = [NSMutableArray arrayWithObjects:[NSNumber numberWithInteger:NSLayoutAttributeLeft]
                                         ,[NSNumber numberWithInteger:NSLayoutRelationEqual]
                                         ,leftView
                                         ,[NSNumber numberWithInteger:NSLayoutAttributeRight]
                                         ,[NSNumber numberWithFloat:1.0]
                                         ,nil];
        topAttributeArr = [NSMutableArray arrayWithObjects:[NSNumber numberWithInteger:NSLayoutAttributeTop]
                                             ,[NSNumber numberWithInteger:NSLayoutRelationEqual]
                                             ,containerView
                                             ,[NSNumber numberWithInteger:NSLayoutAttributeTop]
                                             ,[NSNumber numberWithFloat:1.0]
                                             ,nil];
        rightAttributeArr = [NSMutableArray arrayWithObjects:[NSNumber numberWithInteger:NSLayoutAttributeRight]
                                            ,[NSNumber numberWithInteger:NSLayoutRelationEqual]
                                            ,rightView
                                            ,[NSNumber numberWithInteger:NSLayoutAttributeLeft]
                                            ,[NSNumber numberWithFloat:1.0]
                                            ,nil];
        btmAttributeArr = [NSMutableArray arrayWithObjects:[NSNumber numberWithInteger:NSLayoutAttributeBottom]
                           ,[NSNumber numberWithInteger:NSLayoutRelationEqual]
                           ,containerView
                           ,[NSNumber numberWithInteger:NSLayoutAttributeBottom]
                           ,[NSNumber numberWithFloat:1.0]
                           ,nil];
        
        widthAttributeArr = [NSMutableArray arrayWithObjects:[NSNumber numberWithInteger:NSLayoutAttributeWidth]
                             ,[NSNumber numberWithInteger:NSLayoutRelationEqual]
                             ,@""
                             ,[NSNumber numberWithInteger:NSLayoutAttributeNotAnAttribute]
                             ,[NSNumber numberWithFloat:1.0]
                             ,nil];
        heightAttributeArr = [NSMutableArray arrayWithObjects:[NSNumber numberWithInteger:NSLayoutAttributeHeight]
                             ,[NSNumber numberWithInteger:NSLayoutRelationEqual]
                             ,@""
                             ,[NSNumber numberWithInteger:NSLayoutAttributeNotAnAttribute]
                             ,[NSNumber numberWithFloat:1.0]
                             ,nil];
        
        
        if (i==0) {
            leftAttributeArr[3]=[NSNumber numberWithInteger:NSLayoutAttributeLeft];
        }
        if (i==viewCount-1) {
            rightAttributeArr[3] =[NSNumber numberWithInteger:NSLayoutAttributeRight];
        }
        if (isTop) {
            btmAttributeArr = nil;
        }
        else{
            topAttributeArr = nil;
        }
        if (alignment==SBAlignmentLeft && (i==viewCount-1)) {
            rightAttributeArr = nil;
        }
        if (alignment==SBAlignmentRight && (i==0)) {
            leftAttributeArr = nil;
        }
        
        if(alignment==SBAlignmentCentre)
        {
            if (i==0) leftAttributeArr = nil;
            if(i==viewCount-1 && i!=midView) rightAttributeArr = nil;
            
            if (i==midView) {
                rightAttributeArr[2]=containerView;
                rightAttributeArr[3]=[NSNumber numberWithInteger:NSLayoutAttributeCenterX];
                
                ((SBCtBlob*)arrayAtIndex[1]).rightPadding -= viewCount&1 ? ((SBCtBlob*)arrayAtIndex[1]).width>>1 :0;
                
            }
            
            
        }
        [self attachConstraintForView:arrayAtIndex[0]
                         withSbCTBlob:arrayAtIndex[1]
                       andLeftViewArr:leftAttributeArr
                        andTopViewArr:topAttributeArr
                      andRightViewArr:rightAttributeArr
                        andBtmViewArr:btmAttributeArr
                          andWidthArr:widthAttributeArr
                         andHeightArr:heightAttributeArr
                         andSuperView:containerView];
        
    }
        
    
    
    [self updateConstraints];
}


-(void)setupBarContainerWithStandardPadding:(NSArray *)views
                           forContainerType:(SBContainerType)containerType
                                  alignment:(SBAlignment)alignment
                          isTopVerticalWall:(bool)isTop
{
    int containerHeight = [[[self getContainerInfo:containerType] objectForKey:@"height"] intValue];
    
    NSMutableArray * finalArrayToPass = [NSMutableArray array];
    
    for (int i=0; i<views.count; i++)
    {
        SBCtBlob * ctBlob = [[SBCtBlob alloc] initwithLeft:DEFAULT_PADDING_FOR_STANDARD_CONTAINER_SETUP topPadding:0 rightPadding:DEFAULT_PADDING_FOR_STANDARD_CONTAINER_SETUP btmPadding:0
                                                     width:((UIView*)views[i]).frame.size.width
                                                    height:((UIView*)views[i]).frame.size.height];
        
        if (isTop) ctBlob.topPadding = (containerHeight-ctBlob.height)>>1;  //containerHeight Shoudl be greater than ctBlob.height
        else ctBlob.btmPadding = (containerHeight-ctBlob.height)>>1;
        
        [finalArrayToPass addObject:[NSArray arrayWithObjects:views[i],ctBlob, nil]];
        
        
    }
    [self setupBarContainerWithViews:finalArrayToPass forContainerType:containerType alignment:alignment isTopverticalWall:isTop];
    
}


-(NSMutableDictionary *)getContainerInfo:(SBContainerType)containerType // Currently supports only these types SBContainerTypeLeftBarContainer,SBContainerTypeMiddleBarContainer,SBContainerTypeRightBarContainer
{
    
  NSMutableDictionary  * retDict = [NSMutableDictionary dictionary];

    
    switch (containerType) {
        
        case SBContainerTypeLeftBarContainer:
            [retDict setObject:leftBarContainerView forKey:@"view"];
            [retDict setObject:[NSNumber numberWithInt:barContainerLeftBarWidth] forKey:@"width"];
            [retDict setObject:[NSNumber numberWithInt:defaultBarContainerHeight-2*defaultBarContainerVerticalPadding] forKey:@"height"];
            break;
        case SBContainerTypeMiddleBarContainer:
            [retDict setObject:middleBarContainerView forKey:@"view"];
            [retDict setObject:[NSNumber numberWithFloat:barContainerMiddlerBarWidth] forKey:@"width"];
            [retDict setObject:[NSNumber numberWithFloat:defaultBarContainerHeight-2*defaultBarContainerVerticalPadding] forKey:@"height"];
            break;
        case SBContainerTypeRightBarContainer:
            [retDict setObject:rightBarContainerView forKey:@"view"];
            [retDict setObject:[NSNumber numberWithFloat:barContainerRightBarWidth] forKey:@"width"];
            [retDict setObject:[NSNumber numberWithFloat:defaultBarContainerHeight-2*defaultBarContainerVerticalPadding] forKey:@"height"];
            break;
            
        default:
            break;
    }
    return retDict;
}


-(void)setContinerViewWith:(UIView *)uv
          forContainerType:(SBContainerType)containerType
{
    
    switch (containerType) {
        case SBContainerTypeStatusBar:
            
            [statusBarView removeFromSuperview];
            statusBarView =uv;
            [self addSubview:statusBarView];
            [self attachStatusBarConstraints];
            statusBarView.clipsToBounds = YES;
            
            break;
            
        case SBContainerTypeTopContainer:
            
            [topContainerView removeFromSuperview];
            topContainerView =uv;
            [self addSubview:topContainerView];
            [self attachTopContainerConstraints];
            [self attachBarContainerConstraints];
            [self attachBarImageConstraints];
            [self attachBtmContainerConstraints];
            topContainerView.clipsToBounds = YES;
            
            break;
        
        case SBContainerTypeBarImage:
            
            [barImageView removeFromSuperview];
            barImageView =uv;
            [self addSubview:barImageView];
            [self attachBarImageConstraints];
            barImageView.clipsToBounds = YES;
            
            break;
        
        case SBContainerTypeBarContainer:
            
            [barContainerView removeFromSuperview];
            barContainerView =uv;
            [self addSubview:barContainerView];
            [self attachBarContainerConstraints];
            [self attachBtmContainerConstraints];
            barContainerView.clipsToBounds = YES;
            
            break;
        case SBContainerTypeLeftBarContainer:
            
            [leftBarContainerView removeFromSuperview];
            leftBarContainerView =uv;
            [barContainerView addSubview:leftBarContainerView];
            [self attachLeftBarContainerConstraints];
            leftBarContainerView.clipsToBounds = YES;
            
            break;
        case SBContainerTypeMiddleBarContainer:
            
            [middleBarContainerView removeFromSuperview];
            middleBarContainerView =uv;
            [barContainerView addSubview:middleBarContainerView];
            [self attachMiddleBarContainerConstraints];
            middleBarContainerView.clipsToBounds = YES;
            
            break;
        case SBContainerTypeRightBarContainer:
            
            [rightBarContainerView removeFromSuperview];
            rightBarContainerView =uv;
            [barContainerView addSubview:rightBarContainerView];
            [self attachRightBarContainerConstraints];
            rightBarContainerView.clipsToBounds = YES;
            
            break;
        case SBContainerTypeBtmContainer:
            
            [btmContainerView removeFromSuperview];
            btmContainerView =uv;
            [self addSubview:btmContainerView];
            [self attachBtmContainerConstraints];
            btmContainerView.clipsToBounds = YES;
            
            break;
        
            
        default:
            break;
    }
    
    [self updateConstraints];
}


-(void)removeAllConstraintsFromSbNav:(UIView *)view// All Constraint of the UIView and its childs are cleared
{
    
    [view removeConstraints:view.constraints];
    for (UIView * uv in [view subviews]) {
        [self removeAllConstraintsFromSbNav:uv];
    }
    
}

#pragma -mark Orientation Related

- (void) orientationChanged:(NSNotification *)note
{
   
    UIDevice * device = note.object;
    
    //SBNavLog(@"orientation Changed %f %f %f",[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height,[[UIApplication sharedApplication] statusBarFrame].size.height);
    defaultBarContainerWidth = [UIScreen mainScreen].bounds.size.width;
    [self setUpBarContainerWidthPoint:currentBarContainerLeftBarWidthPoint middleBarWidthPoint:currentBarContainerMiddlerBarWidthPoint];
    switch(device.orientation)
    {
        
        case UIDeviceOrientationPortrait:
        {
          //  SBNavLog(@"UIDeviceOrientationPortrait");
            statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
            statusBarHeight = statusBarHeight==0? defaultStatusBarHeight:statusBarHeight;
        }
            break;
        case UIDeviceOrientationPortraitUpsideDown:
        {
           // SBNavLog(@"UIDeviceOrientationPortrait");
            statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
            statusBarHeight = statusBarHeight==0? defaultStatusBarHeight:statusBarHeight;
        }
            break;
        case UIDeviceOrientationUnknown:
            
        {
           // SBNavLog(@"UIDeviceOrientationUnknown");
        }
            break;
        case UIDeviceOrientationFaceUp:
            
        {
           // SBNavLog(@"UIDeviceOrientationFaceUp");
        }
            break;
        case UIDeviceOrientationFaceDown:
            
        {
           // SBNavLog(@"UIDeviceOrientationFaceDown");
        }
            break;
        case UIDeviceOrientationLandscapeLeft:
        {
            //SBNavLog(@"UIDeviceOrientationLandscapeLeft");
        }
            break;
        case UIDeviceOrientationLandscapeRight:
        {
            //SBNavLog(@"UIDeviceOrientationLandscapeRight");
        }
            break;
        default:
        {
            statusBarHeight= defaultStatusBarHeight;
        }
            break;
    };
    [self updateConstraints];
    [self layoutSubviews];
    
}
#pragma -mark

-(void)dealloc
{
    @try
    {
        [self removeObserver:self forKeyPath:REG_VIEW_UPDATE];
    }
    @catch(id anException)
    {
        
    }
    
}



@end
