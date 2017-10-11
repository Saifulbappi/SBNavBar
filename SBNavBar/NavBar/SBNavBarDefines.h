//
//  SBNavBarDefines.h
//  SBNavBar
//
//  Created by Saiful Islam on 10/10/17.
//  Copyright © 2017 saiful. All rights reserved.
//

#ifndef SBNavBarDefines_h
#define SBNavBarDefines_h

#define SB_NAV_DEBUG


#ifdef SB_NAV_DEBUG
#define SBNavLog(fmt,...) NSLog(@"%@",[NSString stringWithFormat:(fmt), ##__VA_ARGS__]);
#else
#define SBNavLog(...)
#endif

#ifdef SB_NAV_DEBUG_DETATILED
#undef SBNavLog
#define SBNavLog(fmt, ...) NSLog((@"Func: %s, Line: %d, " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#endif

#define  BAR_CONTAINER_HEIGHT                        44
#define  DEFAULT_STATUSBAR_HEIGHT                    22
#define  DEFAULT_TOPCONTAINER_HEIGHT                 10
#define  DEFAULT_BTMCONTAINER_HEIGHT                 10
#define  DEFUALT_BARCONTAINER_VERTICAL_PADDING       2
#define  DEFUALT_BARCONTAINER_HORIZONTAL_PADDING     1


#define DEFAULT_PADDING_FOR_STANDARD_CONTAINER_SETUP       4




#pragma -mark backgroundColors Default

#define STATUSBAR_BACK_COLOR             [UIColor colorWithRed:2/255.0 green:39/255.0 blue:31/255.0 alpha:0.7]
#define TOP_CONTAINER_BACK_COLOR         [UIColor colorWithRed:56/255.0 green:115/255.0 blue:167/255.0 alpha:1.0]
#define BAR_CONTAINER_BACK_COLOR         [UIColor colorWithRed:6/255.0 green:76/255.0 blue:63/255.0 alpha:1.0]
#define LEFTBAR_CONTAINER_BACK_COLOR     [UIColor colorWithRed:183/255.0 green:29/255.0 blue:36/255.0 alpha:1.0]// [UIColor clearColor]//
#define MIDBAR_CONTAINER_BACK_COLOR      [UIColor colorWithRed:143/255.0 green:193/255.0 blue:89/255.0 alpha:1.0]//[UIColor clearColor]//
#define RIGHTBAR_CONTAINER_BACK_COLOR    [UIColor colorWithRed:86/255.0 green:198/255.0 blue:210/255.0 alpha:1.0]//[UIColor clearColor]//
#define BTM_CONTAINER_BACK_COLOR         [UIColor colorWithRed:21/255.0 green:150/255.0 blue:136/255.0 alpha:1.0]


#endif /* SBNavBarDefines_h */
