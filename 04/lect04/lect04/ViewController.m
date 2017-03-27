//
//  ViewController.m
//  lect04
//
//  Created by d.taraev on 25.03.17.
//  Copyright © 2017 mail.ru. All rights reserved.
//

#import "ViewController.h"
#import "DTModel.h"

@interface ViewController () <UITableViewDataSource>
{
    NSArray *array;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    array = @[@"Element1", @"Element2", @"Element3", @"Element4", @"Element5"];
    self.tableView.dataSource = self;
}



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    DTModel *model = [array[indexPath.row] isMemberOfClass:[DTModel class]] ? array[indexPath.row] : nil;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SampleCell" forIndexPath:indexPath];
    
    cell.textLabel.text = array[indexPath.row];
    
    return cell;
}

@end
