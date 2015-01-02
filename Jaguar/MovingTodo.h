//
//  MovingTodo.h
//  Jaguar
//
//  Created by Vinícius Sposito on 1/2/15.
//  Copyright (c) 2015 Rebel Cookie. All rights reserved.
//

#import "Todo.h"

typedef NS_ENUM(NSInteger, MovingTodoImportance) {
    MovingTodoImportanceLow,
    MovingTodoImportanceMedium,
    MovingTodoImportanceHigh
};

@interface MovingTodo : Todo

@property (nonatomic) MovingTodoImportance importance;
@property (strong, nonatomic) NSDate *date;

- (instancetype)initWithTitle:(NSString *)aTitle importance:(MovingTodoImportance)anImportance date:(NSDate *)aDate;

@end
