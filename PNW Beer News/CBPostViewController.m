//
//  CBPostViewController.m
//  PNW Beer News
//
//  Created by Cole Bratcher on 11/3/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "CBPostViewController.h"

@interface CBPostViewController ()

@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end

@implementation CBPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _sourceLabel.text       = _selectedPost.postSource;
    _titleLabel.text        = _selectedPost.postTitle;
    _descriptionLabel.text  = _selectedPost.postDescription;
    _contentTextView.text   = _selectedPost.postContent;
    _dateLabel.text         = [_selectedPost createOutputDate];
    
}

@end
