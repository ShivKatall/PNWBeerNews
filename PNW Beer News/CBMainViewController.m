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

@interface CBMainViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CBMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [DATA_CONTROLLER createNewsSources];
    
    for (CBNewsSource *newsSource in DATA_CONTROLLER.newsSources) {
        [newsSource parseWithCompletion:^(){
            [DATA_CONTROLLER.allPosts addObjectsFromArray:newsSource.posts];
        }];
    }
    
    NSLog(@"%@" ,DATA_CONTROLLER.allPosts);
}

@end
