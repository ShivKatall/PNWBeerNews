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

    _sourceLabel.text                   = _selectedPost.postSource;
    _titleLabel.text                    = _selectedPost.postTitle;
    _dateLabel.text                     = [_selectedPost createOutputDate];
    
    [_selectedPost createAttributedTextForDescriptionWithCompletionBlock:^{
        _descriptionLabel.attributedText = _selectedPost.postDescriptionText;
    }];
    
    [_selectedPost createAttributedTextForContentWithCompletionBlock:^{
        _contentTextView.attributedText = _selectedPost.postContentText;
    }];
    
}

@end
