//
//  CBDataController.m
//  PNW Beer News
//
//  Created by Cole Bratcher on 7/10/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "CBDataController.h"
#import "CBNewsSource.h"

@implementation CBDataController

+ (CBDataController *)dataController {
    static dispatch_once_t pred;
    static CBDataController *shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[CBDataController alloc] init];
    });
    return shared;
}

- (id)init
{
    self = [super init];
    _allPosts = [NSMutableArray new];
    
    return self;
}

- (void)createNewsSources
{
    
    NSURL *seattleBeerNewsURL       = [NSURL URLWithString:@"http://seattlebeernews.com/feed/"];
    NSURL *washingtonBeerBlogURL    = [NSURL URLWithString:@"http://www.washingtonbeerblog.com/feed/"];
    NSURL *oregonCraftBeerURL       = [NSURL URLWithString:@"http://oregoncraftbeer.org/news/feed/"];
    
    CBNewsSource *seattleBeerNews       = [[CBNewsSource alloc] initWithName:@"Seattle Beer News"
                                                                         URL:seattleBeerNewsURL
                                                                      active:YES];
    
    CBNewsSource *washingtonBeerBlog    = [[CBNewsSource alloc] initWithName:@"Washington Beer Blog"
                                                                         URL:washingtonBeerBlogURL
                                                                      active:YES];
    
    CBNewsSource *oregonCraftBeer       = [[CBNewsSource alloc] initWithName:@"Oregon Craft Beer"
                                                                         URL:oregonCraftBeerURL
                                                                      active:YES];
    
    
    _newsSources = [[NSArray alloc] initWithObjects:seattleBeerNews, washingtonBeerBlog, oregonCraftBeer, nil];
}


@end  
