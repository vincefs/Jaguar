//
//  AddMovingController.m
//  Jaguar
//
//  Created by Vinícius Sposito on 1/9/15.
//  Copyright (c) 2015 Rebel Cookie. All rights reserved.
//

#import "AddMovingController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface AddMovingController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *fields;
@property (strong, nonatomic) NSArray *selectables;
@property (strong, nonatomic) NSMutableArray *UIFields;
@property (strong, nonatomic) UISegmentedControl *importanceSegmentedControl;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation AddMovingController

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
    self.fields = @[@"Title", @"Notes", @"URL"];
    self.selectables = @[@"Importance", @"Date"];
    self.UIFields = [[NSMutableArray alloc] init];
    NSLog(@"%s" __FILE__, __PRETTY_FUNCTION__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addTodoToList:(id)sender
{
    if ([[(UITextField *)[self.UIFields objectAtIndex:0] text] isEqualToString:@""] || [[(UITextField *)[self.UIFields objectAtIndex:1] text] isEqualToString:@""] || [[(UITextField *)[self.UIFields objectAtIndex:2] text] isEqualToString:@""]) {
        return;
        // Show error view or something
    }
    
    NSManagedObjectContext *context = self.self.managedObjectContext;
    NSManagedObject *obj = [NSEntityDescription insertNewObjectForEntityForName:@"MovingTodo"
                                                         inManagedObjectContext:context];
    
    [obj setValue:[(UITextField *)[self.UIFields objectAtIndex:0] text] forKey:@"title"];
    [obj setValue:[(UITextField *)[self.UIFields objectAtIndex:1] text] forKey:@"note"];
    [obj setValue:[(UITextField *)[self.UIFields objectAtIndex:2] text] forKey:@"url"];
    [obj setValue:[NSNumber numberWithInteger:self.importanceSegmentedControl.selectedSegmentIndex] forKey:@"importance"];
    
    NSError *error;
    [context save:&error];
    // TODO: setup date selector

    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return self.fields.count;
            break;
            
        case 1:
            return self.selectables.count;
            break;
        default:
            break;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.section == 0) {
        NSString *text = self.fields[indexPath.row];
        cell.textLabel.text = text;
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(70, 0, self.view.bounds.size.width - 80, 44)];
        textField.tag = indexPath.row + 1;
        [cell.contentView addSubview:textField];
        [self.UIFields addObject:textField];
    } else {
        NSString *text = self.selectables[indexPath.row];
        cell.textLabel.text = text;
        if ([text isEqualToString:@"Importance"]) {
            NSArray *itemArray = [NSArray arrayWithObjects: @"Low", @"Medium", @"High", nil];
            self.importanceSegmentedControl= [[UISegmentedControl alloc] initWithItems:itemArray];
            self.importanceSegmentedControl.frame = CGRectMake(115, (44 / 2) - (29 / 2), self.view.bounds.size.width - 125, 29);
            self.importanceSegmentedControl.selectedSegmentIndex = 0;
            [cell.contentView addSubview:self.importanceSegmentedControl];
        } else {
            cell.detailTextLabel.text = @"Preguica de implementar";
        }
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITextField *textField = (UITextField *)[cell.contentView viewWithTag:1];
    [textField becomeFirstResponder];
}

@end
