//
//  SBCtBlob.h
//  SBNavBar
//
//  Created by Saiful Islam on 10/4/17.
//  Copyright © 2017 saiful. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBCtBlob : NSObject


@property(nonatomic,assign) int leftPadding;
@property(nonatomic,assign) int topPadding;
@property(nonatomic,assign) int rightPadding;
@property(nonatomic,assign) int btmPadding;
@property(nonatomic,assign) int width;
@property(nonatomic,assign) int height;


-(id)initwithLeft:(int)leftPadding
       topPadding:(int)topPadding
     rightPadding:(int)rightPadding
       btmPadding:(int)btmPadding;

-(id)initwithLeft:(int)leftPadding
       topPadding:(int)topPadding
     rightPadding:(int)rightPadding
       btmPadding:(int)btmPadding
            width:(int)width
           height:(int)height;


@end
