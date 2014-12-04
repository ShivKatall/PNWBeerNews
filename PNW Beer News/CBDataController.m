//
//  CBDataController.m
//  PNW Beer News
//
//  Created by Cole Bratcher on 7/10/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "CBDataController.h"
#import "CBNewsSource.h"
#import "CBPost.h"

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
//    NSURL *brewpublicURL            = [NSURL URLWithString:@"http://fulltextrssfeed.com/brewpublic.com/feed"];
    NSURL *boiseBeerCultureURL      = [NSURL URLWithString:@"http://boisebeerculture.blogspot.com/feeds/posts/default"];
    NSURL *alaskanBeerURL           = [NSURL URLWithString:@"http://alaskanbeer.blogspot.com/feeds/posts/default"];

    CBNewsSource *seattleBeerNews       = [[CBNewsSource alloc] initWithName:@"Seattle Beer News"
                                                                         URL:seattleBeerNewsURL
                                                                      active:YES];
    
    CBNewsSource *washingtonBeerBlog    = [[CBNewsSource alloc] initWithName:@"Washington Beer Blog"
                                                                         URL:washingtonBeerBlogURL
                                                                      active:YES];
    
    CBNewsSource *oregonCraftBeer       = [[CBNewsSource alloc] initWithName:@"Oregon Craft Beer"
                                                                         URL:oregonCraftBeerURL
                                                                      active:YES];
    
//    CBNewsSource *brewpublic            = [[CBNewsSource alloc] initWithName:@"Brewpublic"
//                                                                         URL:brewpublicURL
//                                                                      active:YES];
    
    CBNewsSource *boiseBeerCulture      = [[CBNewsSource alloc] initWithName:@"Boise Beer Culture"
                                                                         URL:boiseBeerCultureURL
                                                                      active:YES];
    
    CBNewsSource *alaskanBeer           = [[CBNewsSource alloc] initWithName:@"Alaskan Beer"
                                                                         URL:alaskanBeerURL
                                                                      active:YES];
    
    _newsSources = [[NSArray alloc] initWithObjects:seattleBeerNews, washingtonBeerBlog, oregonCraftBeer, boiseBeerCulture, alaskanBeer, nil];
}

- (void)sortAllPosts
{
    NSSortDescriptor *sortByDate = [NSSortDescriptor sortDescriptorWithKey:@"postDate" ascending:NO];
    _sortedPosts = [_allPosts sortedArrayUsingDescriptors:@[sortByDate]];
}

- (BOOL)foundAnyData
{
    BOOL dataFound = NO;
    
    for (CBNewsSource *newsSource in _newsSources) {
        if (newsSource.foundData == YES) {
            dataFound = YES;
            break;
        }
    }
    
    return dataFound;
}

@end
