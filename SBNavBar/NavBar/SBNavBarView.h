//
//  SBNavBarView.h
//  SBNavBar
//
//  Created by Saiful Islam on 9/28/17.
//  Copyright © 2017 saiful. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBNavBarDefines.h"





typedef NS_ENUM(NSInteger,SBAlignment)
{
    SBAlignmentLeft,
    SBAlignmentCentre,
    SBAlignmentRight
};

typedef NS_ENUM(NSInteger,SBContainerType)
{
    
    SBContainerTypeStatusBar,
    SBContainerTypeTopContainer,
    SBContainerTypeBarImage,
    SBContainerTypeBarContainer,
    SBContainerTypeLeftBarContainer,
    SBContainerTypeMiddleBarContainer,
    SBContainerTypeRightBarContainer,
    SBContainerTypeBtmContainer,
    SBContainerTypeSBNavBar
};



@interface SBNavBarView : UIView





/**
  Attaches constraints on the subviews of SBNavBarView
 */
-(void)attachConstraints;



/*!
  This Method sets up the leftBar,Middle Bar and rightBar widths..
 
 left, middle and right BarWidthPoint are as such
 leftBarContainerWidthPoint+middleBarWidthPoint+rightBarWidthPoint = 1.0
 
 So the point should be given according to the wanted width of each bar respective to  defaultBarContainerWidth
 */
-(void)setUpBarContainerWidthPoint:(float)leftBarContainerWidthPoint
                middleBarWidthPoint:(float)middleBarWidthPoint;


/**
  A Dictionary with the corresponding view .. current width,height
 
  CAUTION-- Currently supports SBContainerTypeLeftBarContainer,SBContainerTypeMiddleBarContainer,SBContainerTypeRightBarContainer
 */

-(NSMutableDictionary *)getContainerInfo:(SBContainerType)containerType;


/**
  This Method replace the existing container view
 */

-(void)setContinerViewWith:(UIView *)uv
          forContainerType:(SBContainerType)containerType;





/**
  This Method sets up a container with views array
 
  views array is an array of NSArray ..
 each array must contain this elements, @{UIView, SBCtBlob};
 
  A sample views array should look like-
 
 @{
     @{UIView1, SBCtBlob1}
     @{UIView2, SBCtBlob2}
     @{UIView3, SBCtBlob3}
     .....
  }
 
  Views final layout will be left to right accroding to index
 
         ------------------------------------
         |--UIView1--UIView2--UIView3.......|
         ------------------------------------
 
 CAUTION:
     Before setting this views.. the container view must be ready
 
 
 if isTop==true the top of containerView is the vertical wall else- the bottom of containerView
 
 */


-(void)setupBarContainerWithViews:(NSArray *)views
                 forContainerType:(SBContainerType)containerType
                        alignment:(SBAlignment)alignment
                isTopverticalWall:(bool)isTop;



/**
  This method works similarly like setupBarContainerWithViews method
  only standard paddings are set programatically
 
  Here Views Array should only contains views not SBCtBlobs
 
 A sample views array should look like-
 
 @{
     @{UIView1}
     @{UIView2}
     @{UIView3}
     .....
 }
 
 
 */
-(void)setupBarContainerWithStandardPadding:(NSArray *)views
                           forContainerType:(SBContainerType)containerType
                                  alignment:(SBAlignment)alignment
                          isTopVerticalWall:(bool)isTop;








@end
