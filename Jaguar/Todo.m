//
//  Todo.m
//  Jaguar
//
//  Created by Vinícius Sposito on 1/4/15.
//  Copyright (c) 2015 Rebel Cookie. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)init
{
    [NSException raise:@"Invalid title and importance" format:@""];
    
    return [self initWithTitle:@"Todo" importance:MovingTodoImportanceLow date:[NSDate date]];
}

#pragma mark - Static todo

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

#pragma mark - Moving todo

- (instancetype)initWithTitle:(NSString *)aTitle
                   importance:(TodoImportance)anImportance
                         date:(NSDate *)aDate
{
    if (self = [super init]) {
        self.title = aTitle;
        self.importance = anImportance;
        self.date = aDate;
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)aTitle
                   importance:(TodoImportance)anImportance
                         date:(NSDate *)aDate
                        notes:(NSString *)aNote
{
    if (self = [super init]) {
        self.title = aTitle;
        self.importance = anImportance;
        self.date = aDate;
        self.notes = aNote;
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)aTitle
                   importance:(TodoImportance)anImportance
                         date:(NSDate *)aDate
                        notes:(NSString *)aNote
                          URL:(NSURL *)aURL
{
    if (self = [super init]) {
        self.title = aTitle;
        self.importance = anImportance;
        self.date = aDate;
        self.notes = aNote;
        self.URL = aURL;
    }
    
    return self;
}

@end
