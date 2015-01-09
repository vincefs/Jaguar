//
//  StaticTodoView.m
//  Jaguar
//
//  Created by Vinícius Sposito on 1/9/15.
//  Copyright (c) 2015 Rebel Cookie. All rights reserved.
//

#import "StaticTodoView.h"

@implementation StaticTodoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // Make the view gray since it is static
        self.backgroundColor = [UIColor grayColor];
        
        // Make it a circumference
        self.layer.cornerRadius = frame.size.width / 2;
        
        // TODO: Add labels
    }
    
    return self;
}

@end
