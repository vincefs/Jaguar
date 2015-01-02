//
//  MovingTodo.h
//  Jaguar
//
//  Created by Vinícius Sposito on 1/2/15.
//  Copyright (c) 2015 Rebel Cookie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovingTodo : NSObject

typedef NS_ENUM(NSInteger, MovingTodoImportance) {
    MovingTodoImportanceLow,
    MovingTodoImportanceMedium,
    MovingTodoImportanceHigh
};

/* Lista de coisas quem ambos os todos tem:
 Titulo
 Notas(opcional)
 URL(opcional)
 
 Ideias(ignorar por enquanto):
 contato(opcional)
 projeto(opcional)
 */

@property (strong, nonatomic) NSString *title;
@property (nonatomic) MovingTodoImportance importance;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSString *notes;
@property (strong, nonatomic) NSURL *URL;

- (instancetype)initWithTitle:(NSString *)aTitle importance:(MovingTodoImportance)anImportance date:(NSDate *)aDate;
- (instancetype)initWithTitle:(NSString *)aTitle; // For todos that do not have anything but a title
- (instancetype)initWithTitle:(NSString *)aTitle notes:(NSString *)aNote;
- (instancetype)initWithTitle:(NSString *)aTitle notes:(NSString *)aNote URL:(NSURL *)aURL;

@end
