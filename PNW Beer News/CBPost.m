//
//  CBPost.m
//  PNW Beer News
//
//  Created by Cole Bratcher on 10/27/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "CBPost.h"

@implementation CBPost

-(NSString *)createOutputDate {
    NSDateFormatter *outputFormatter = [NSDateFormatter new];
    [outputFormatter setDateFormat:@"MMM dd"];
    NSString *outputDate = [outputFormatter stringFromDate:_postDate];
    
    return outputDate;
}

@end
