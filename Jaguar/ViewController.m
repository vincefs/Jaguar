//
//  ViewController.m
//  Jaguar
//
//  Created by Vinícius Sposito on 1/1/15.
//  Copyright (c) 2015 Rebel Cookie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark - Table view devegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end
