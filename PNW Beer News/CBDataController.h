//
//  CBDataController.h
//  PNW Beer News
//
//  Created by Cole Bratcher on 7/10/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBDataController : NSObject

@property (nonatomic, strong) NSArray *newsSources;
@property (nonatomic, strong) NSMutableArray *allPosts;

+ (CBDataController *)dataController;
- (void)createNewsSources;

@end
