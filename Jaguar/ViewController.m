//
//  ViewController.m
//  Jaguar
//
//  Created by Vinícius Sposito on 1/1/15.
//  Copyright (c) 2015 Rebel Cookie. All rights reserved.
//

#import "ViewController.h"
#import "AddMovingController.h"
#import "AllTodosViewController.h"
#import "MovingTodosViewController.h"
#import "StaticTodosViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate>

@property (strong, nonatomic) NSArray *dataSource;
@property (strong, nonatomic) NSArray *imageThumbnails;

@end

@implementation ViewController

- (NSArray *)dataSource
{
    if (!_dataSource)_dataSource = [[NSArray alloc] initWithObjects:@"All", @"Moving", @"Static", nil];
    return _dataSource;
}

- (NSArray *)imageThumbnails
{
    if (!_imageThumbnails)_imageThumbnails = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"All_thumbnail"],
                                              [UIImage imageNamed:@"Moving_thumbnail"],
                                              [UIImage imageNamed:@"Static_thumbnail"],
                                              nil];
    
    return _imageThumbnails;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"Jaguar ß";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addTodo:(id)sender
{
    // Pushes a view controller to let the user add a new todo
    NSLog(@"%s at %s", __FILE__, __PRETTY_FUNCTION__);
    
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"What kind of todo do you want to add?"
                                                      delegate:self
                                             cancelButtonTitle:@"Cancel"
                                        destructiveButtonTitle:nil
                                             otherButtonTitles:nil];
    
    for (NSString *title in [NSArray arrayWithObjects:@"Moving", @"Static", nil]) {
        [sheet addButtonWithTitle:title];
    }
    
    [sheet showInView:self.view];
}

#pragma mark - Action sheet delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 1:
            NSLog(@"Moving");
            [self performSegueWithIdentifier:@"showAddMovingController" sender:self];
            break;
            
        case 2:
            NSLog(@"sa");
            [self performSegueWithIdentifier:@"showAddStaticController" sender:self];
            break;
            
        default:
            break;
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in a section
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return a configured cell
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.imageView.image = self.imageThumbnails[indexPath.row];
    cell.imageView.layer.cornerRadius = 7;
    cell.imageView.clipsToBounds = YES;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            // All
            
            AllTodosViewController *allController = [self.storyboard instantiateViewControllerWithIdentifier:@"allController"];
            [self.navigationController pushViewController:allController animated:YES];
        }
            break;
            
        case 1:
        {
            // Moving
            
            MovingTodosViewController *movingController = [self.storyboard instantiateViewControllerWithIdentifier:@"movingController"];
            [self.navigationController pushViewController:movingController animated:YES];
        }
            break;
            
        case 2:
        {
            // Static
            
            StaticTodosViewController *staticController = [self.storyboard instantiateViewControllerWithIdentifier:@"staticController"];
            [self.navigationController pushViewController:staticController animated:YES];
        }
            
        default:
            break;
    }
}

@end
