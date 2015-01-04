//
//  DBHelper.m
//  Jaguar
//
//  Created by Lucas Marcal on 02/01/15.
//  Copyright (c) 2015 Rebel Cookie. All rights reserved.
//

#import "DBHelper.h"
@implementation DBHelper


-(instancetype)initWithContext:(NSManagedObjectContext *)context{
    if (self = [super init]) {
        _context = context;
    }
    return self;
}


-(void)SaveTodo:(Todo *)todo{
    
    NSManagedObject	*ToDo = [NSEntityDescription insertNewObjectForEntityForName:@"Todo" inManagedObjectContext:_context];
    
    NSError *error;
    
    if (![_context save:&error]){
        NSLog(@"Erro ao salvar: %@", [error localizedDescription]);
    }
}

@end