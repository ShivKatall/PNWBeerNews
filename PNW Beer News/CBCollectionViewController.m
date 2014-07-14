//
//  CBViewController.m
//  PNW Beer News
//
//  Created by Cole Bratcher on 7/10/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "CBCollectionViewController.h"
#import "CBDataController.h"
#import "CBNewsSource.h"

@interface CBCollectionViewController ()

@end

@implementation CBCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [DATA_CONTROLLER createNewsSources];
    
    for (CBNewsSource *newsSource in DATA_CONTROLLER.newsSources) {
        [newsSource parse];
    }
}

#pragma mark - Parser Delegate Methods



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
