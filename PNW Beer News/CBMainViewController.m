//
//  CBViewController.m
//  PNW Beer News
//
//  Created by Cole Bratcher on 7/10/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "CBMainViewController.h"
#import "CBDataController.h"
#import "CBNewsSource.h"

@interface CBMainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CBMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [DATA_CONTROLLER createNewsSources];
    
    for (CBNewsSource *newsSource in DATA_CONTROLLER.newsSources) {
        [newsSource parseWithCompletion:^(){
            [DATA_CONTROLLER.allPosts addObjectsFromArray:newsSource.posts];
        }];
    }
    
    NSLog(@"%@" ,DATA_CONTROLLER.allPosts);
}

#pragma mark - UITableView Delegate Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [DATA_CONTROLLER.allPosts count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell" forIndexPath:indexPath];
    
    return cell;
}

@end
