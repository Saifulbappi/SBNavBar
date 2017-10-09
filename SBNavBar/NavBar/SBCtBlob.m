//
//  SBCtBlob.m
//  SBNavBar
//
//  Created by Saiful Islam on 10/4/17.
//  Copyright © 2017 saiful. All rights reserved.
//

#import "SBCtBlob.h"

@implementation SBCtBlob

-(id)init{
    
    self = [super init];
    
    self.leftPadding=self.topPadding=self.rightPadding=self.btmPadding=self.width=self.height=0;
    
    return self;
    
}
-(id)initwithLeft:(int)leftPadding
       topPadding:(int)topPadding
     rightPadding:(int)rightPadding
       btmPadding:(int)btmPadding
{
    if ([self init]) {
        self.leftPadding=leftPadding;
        self.topPadding=topPadding;
        self.rightPadding=rightPadding;
        self.btmPadding=btmPadding;
    };
    
    
    return  self;
    
}
-(id)initwithLeft:(int)leftPadding
       topPadding:(int)topPadding
     rightPadding:(int)rightPadding
       btmPadding:(int)btmPadding
            width:(int)width
           height:(int)height
{
    if ([self init]) {
        self.leftPadding=leftPadding;
        self.topPadding=topPadding;
        self.rightPadding=rightPadding;
        self.btmPadding=btmPadding;
        self.width=width;
        self.height=height;
    };
   
    
    return  self;
    
}
- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"leftPadding %d\n"
                    "topPadding %d\n"
                    "rightPadding %d\n"
                    "btmPadding %d\n"
                    "width %d\n"
                    "height %d\n",self.leftPadding,self.topPadding,self.rightPadding,self.btmPadding,self.width,self.height];
}

@end
