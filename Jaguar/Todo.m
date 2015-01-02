//
//  Todo.m
//  Jaguar
//
//  Created by Vinícius Sposito on 1/2/15.
//  Copyright (c) 2015 Rebel Cookie. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)init
{
    [NSException raise:@"Invalid title value" format:@"Title %@ is nil", self.title];
    
    return [self initWithTitle:@"Todo"];
}

- (instancetype)initWithTitle:(NSString *)aTitle
{
    if (self = [super init]) {
        self.title = aTitle;
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)aTitle notes:(NSString *)aNote
{
    if (self = [super init]) {
        self.title = aTitle;
        self.notes = aNote;
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)aTitle notes:(NSString *)aNote URL:(NSURL *)aURL
{
    if (self = [super init]) {
        self.title = aTitle;
        self.notes = aNote;
        self.URL = aURL;
    }
    
    return self;
}

@end
