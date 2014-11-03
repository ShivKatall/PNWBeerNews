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
#import "CBPost.h"
#import "CBPostCell.h"

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
            [DATA_CONTROLLER sortAllPosts];
        }];
    }
    
    NSLog(@"%@" ,DATA_CONTROLLER.allPosts);
}

#pragma mark - UITableView Delegate Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [DATA_CONTROLLER.sortedPosts count];
}

-(CBPostCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CBPostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell" forIndexPath:indexPath];
    
    CBPost *post = [DATA_CONTROLLER.sortedPosts objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = post.postTitle;
    cell.sourceLabel.text = post.postSource;
    
    // Convert Date into String
    
    cell.dateLabel.text = [post createOutputDate];
    
    
    return cell;
}

@end
