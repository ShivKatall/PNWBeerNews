//
//  CBPost.h
//  PNW Beer News
//
//  Created by Cole Bratcher on 10/27/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBPost : NSObject

@property (nonatomic, strong) NSString *postTitle;
@property (nonatomic, strong) NSString *postLink;
@property (nonatomic, strong) NSString *postDescription;
@property (nonatomic, strong) NSString *postContent;

@end
