//
//  AddStaticViewController.m
//  Jaguar
//
//  Created by Vinícius Sposito on 1/9/15.
//  Copyright (c) 2015 Rebel Cookie. All rights reserved.
//

#import "AddStaticViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface AddStaticViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *fields;
@property (strong, nonatomic) NSMutableArray *UIFields;

@end

@implementation AddStaticViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fields = @[@"Title", @"Notes", @"URL"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addTodoToList:(id)sender
{
    for (UITextField *textField in self.UIFields) {
        NSLog(@"s");
        if (textField.tag > 1 && ![textField.text isEqualToString:@""]) {
            // Entao o usuario colocou informacoes suficientes para a cell ser uma moving cell
            
            NSLog(@"Added Moving");
            AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
            NSManagedObject *obj = [NSEntityDescription insertNewObjectForEntityForName:@"Todo"
                                                                 inManagedObjectContext:delegate.managedObjectContext];
            [obj setValue:[(UITextField *)[self.UIFields objectAtIndex:0] text] forKey:@"title"];
        } else {
            // O usuario decidiu colocar so um titulo, entao e uma static cell
        }
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fields.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSString *text = self.fields[indexPath.row];
    cell.textLabel.text = text;
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(70, 0, self.view.bounds.size.width - 80, 44)];
    // textField.textAlignment = NSTextAlignmentRight;
    textField.tag = indexPath.row + 1;
    [cell.contentView addSubview:textField];
    [self.UIFields addObject:textField];
    
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
