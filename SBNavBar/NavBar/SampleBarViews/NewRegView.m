//
//  NewRegView.m
//  LiteDialer
//
//  Created by Saiful Islam on 10/12/17.
//  Copyright © 2017 REVE Systems. All rights reserved.
//

#import "NewRegView.h"

@implementation NewRegView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    self.statusLabel.font = [UIFont boldSystemFontOfSize:11];
    self.statusLabel.textColor = [UIColor whiteColor];
    self.statusLabel.textAlignment = NSTextAlignmentLeft;
    [self.statusLabel setBackgroundColor:[UIColor clearColor]];
    
    self.balanceLabel.font = [UIFont systemFontOfSize:11];
    self.balanceLabel.textColor = [UIColor whiteColor];
    self.balanceLabel.textAlignment = NSTextAlignmentRight;
    [self.balanceLabel setBackgroundColor:[UIColor clearColor]];
    
    
}

@end
