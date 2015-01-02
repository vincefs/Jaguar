//
//  MovingTodo.m
//  Jaguar
//
//  Created by Vinícius Sposito on 1/2/15.
//  Copyright (c) 2015 Rebel Cookie. All rights reserved.
//

#import "MovingTodo.h"

@implementation MovingTodo

- (instancetype)init
{
    [NSException raise:@"Invalid title and importance" format:@""];
    
    return [self initWithTitle:@"Todo" importance:MovingTodoImportanceLow date:[NSDate date]];
}

- (instancetype)initWithTitle:(NSString *)aTitle importance:(MovingTodoImportance)anImportance date:(NSDate *)aDate
{
    if (self = [super initWithTitle:aTitle]) {
        self.title = aTitle;
        self.importance = anImportance;
        self.date = aDate;
    }
    
    return self;
}

@end
