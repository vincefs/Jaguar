//
//  Todo.m
//  Jaguar
//
//  Created by Vinícius Sposito on 1/4/15.
//  Copyright (c) 2015 Rebel Cookie. All rights reserved.
//

#import "Todo.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
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

- (void)save{
    AppDelegate * delegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext * context = [delegate managedObjectContext];
    NSManagedObject *newTodo;
    if(self.date == nil){
        newTodo = [NSEntityDescription insertNewObjectForEntityForName:@"StaticTodo" inManagedObjectContext:context];
        [newTodo setValue:self.title forKey:@"title"];
        [newTodo setValue:self.notes forKey:@"note"];
        [newTodo setValue:[NSString stringWithFormat:@"%@",_URL] forKey:@"url"];
    }else{
        newTodo = [NSEntityDescription insertNewObjectForEntityForName:@"MovingTodo" inManagedObjectContext:context];
        [newTodo setValue:self.title forKey:@"title"];
        [newTodo setValue:self.notes forKey:@"note"];
        [newTodo setValue:[NSString stringWithFormat:@"%@",_URL] forKey:@"url"];
        NSNumber * numba = [NSNumber numberWithInt:_importance];
        [newTodo setValue:numba forKey:@"importance"];
    }
    
    NSError * jooj;
    [context save:&jooj];
}

+ (NSArray *)getStatic{
    AppDelegate *AppDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context =[AppDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"StaticTodo" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    
    NSError *error;
    NSArray *todos = [context executeFetchRequest:request
                                              error:&error];
    return todos;
}

+ (NSArray *)getMoving{
    AppDelegate *AppDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context =[AppDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"MovingTodo" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    
    NSError *error;
    NSArray *todos = [context executeFetchRequest:request
                                            error:&error];
    return todos;
}

@end
