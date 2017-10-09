//
//  SBNavBarView.h
//  SBNavBar
//
//  Created by Saiful Islam on 9/28/17.
//  Copyright © 2017 saiful. All rights reserved.
//

#import <UIKit/UIKit.h>


#define SB_NAV_DEBUG


#ifdef SB_NAV_DEBUG
#define SBLog(fmt,...) NSLog(@"%@",[NSString stringWithFormat:(fmt), ##__VA_ARGS__]);
#else
#define SBLog(...)
#endif

#ifdef SB_NAV_DEBUG_DETATILED
#undef SBLog
#define SBLog(fmt, ...) NSLog((@"Func: %s, Line: %d, " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#endif





@interface SBNavBarView : UIView



-(void)attachConstraints;


/**
 This Method sets up the leftBar,Middle Bar and rightBar widths..
 
 left, middle and right BarWidthPoint are as such
 leftBarContainerWidthPoint+middleBarWidthPoint+rightBarWidthPoint = 1.0
 
 So the point should be given according to the wanted width of each bar respective to  defaultBarContainerWidth
 */

-(void)setUpBarContainerWidthPoint:(float)leftBarContainerWidthPoint
                middleBarWidthPoint:(float)middleBarWidthPoint;


-(NSMutableDictionary *)getLeftBarContainerToCustomize;
-(void)setLeftBarContainer:(UIView *)uv;


@end
