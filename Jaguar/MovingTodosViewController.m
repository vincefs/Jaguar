//
//  MovingTodosViewController.m
//  Jaguar
//
//  Created by Vinícius Sposito on 1/9/15.
//  Copyright (c) 2015 Rebel Cookie. All rights reserved.
//

#import "MovingTodosViewController.h"
#import <CoreData/CoreData.h>

@interface MovingTodosViewController ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation MovingTodosViewController

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Moving Todos";
    [self getTodos];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getTodos
{
    NSManagedObjectContext *moc = [self managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"MovingTodo" inManagedObjectContext:moc];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
//    // Set example predicate and sort orderings...
//    NSNumber *minimumSalary = ...;
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:
//                              @"(lastName LIKE[c] 'Worsley') AND (salary > %@)", minimumSalary];
//    [request setPredicate:predicate];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"title" ascending:NO];
    [request setSortDescriptors:@[sortDescriptor]];
    
    NSError *error;
    NSArray *array = [moc executeFetchRequest:request error:&error];
    NSLog(@"%@", array);
    if (array == nil)
    {
        // Deal with error...
    }
}

@end
