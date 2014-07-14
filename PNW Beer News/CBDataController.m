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

- (void)createNewsSources {
    
    NSURL *seattleBeerNewsURL       = [NSURL URLWithString:@"http://seattlebeernews.com/feed/"];
    NSURL *washingtonBeerBlogURL    = [NSURL URLWithString:@"http://www.washingtonbeerblog.com/feed/"];
    NSURL *oregonCraftBeerURL       = [NSURL URLWithString:@"http://oregoncraftbeer.org/news/feed/"];
    NSURL *brewPublicURL            = [NSURL URLWithString:@"http://brewpublic.com/feed/"];
    NSURL *onTapURL                 = [NSURL URLWithString:@"http://magicvalley.com/search/?f=rss&c=blogs/ontap&l=50&s=start_time&sd=desc"];
    
    CBNewsSource *seattleBeerNews       = [[CBNewsSource alloc] initWithName:@"Seattle Beer News"
                                                                         URL:seattleBeerNewsURL
                                                                      active:YES];
    
    CBNewsSource *washingtonBeerBlog    = [[CBNewsSource alloc] initWithName:@"Washington Beer Blog"
                                                                         URL:washingtonBeerBlogURL
                                                                      active:YES];
    
    CBNewsSource *oregonCraftBeer       = [[CBNewsSource alloc] initWithName:@"Oregon Craft Beer"
                                                                         URL:oregonCraftBeerURL
                                                                      active:YES];
    
    CBNewsSource *brewPublic            = [[CBNewsSource alloc] initWithName:@"Brew Public"
                                                                         URL:brewPublicURL
                                                                      active:YES];
    
    CBNewsSource *onTap                 = [[CBNewsSource alloc] initWithName:@"On Tap: Idaho Beer Blog"
                                                                         URL:onTapURL
                                                                      active:YES];
    
    _newsSources = [[NSArray alloc] initWithObjects:seattleBeerNews, washingtonBeerBlog, oregonCraftBeer, brewPublic, onTap, nil];
}


@end  
