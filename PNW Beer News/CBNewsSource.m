//
//  CBNewsSource.m
//  PNW Beer News
//
//  Created by Cole Bratcher on 7/10/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "CBNewsSource.h"

@interface CBNewsSource () {
    NSXMLParser *parser;
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSMutableString *description;
    NSMutableString *content;
    NSString *sourceName;
    NSString *element;
}

@property (nonatomic, strong) NSString *newsSourceName;
@property (nonatomic, strong) NSURL *newsSourceURL;
@property BOOL newsSourceActive;

@end

@implementation CBNewsSource

- (id)initWithName:(NSString *)name URL:(NSURL *)url active:(BOOL)active {
    self = [super init];
    
    if (self) {
        _newsSourceName = name;
        _newsSourceURL = url;
        _newsSourceActive = active;
    }
    return self;
}

- (void)parse {
    _feeds = [NSMutableArray new];
    
    parser = [[NSXMLParser alloc] initWithContentsOfURL:_newsSourceURL];
    
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    element = elementName;
    
    if ([element isEqualToString:@"item"]) {
        
        
        item        = [NSMutableDictionary new];
        title       = [NSMutableString new];
        link        = [NSMutableString new];
        description = [NSMutableString new];
        content     = [NSMutableString new];
        
        //        sourceName  = _newsSourceName;
        
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"item"]) {
        
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"link"];
        [item setObject:description forKey:@"description"];
        [item setObject:content forKey:@"content:encoded"];
        
        [_feeds addObject:[item copy]];
        
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
        NSLog(@"%@ title: %@ \n" , _newsSourceName, title);
        
    } else if ([element isEqualToString:@"link"]) {
        [link appendString:string];
        NSLog(@"%@ link: %@ \n", _newsSourceName, link);
        
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock {
    
    NSString *contentFromCData = [[NSString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
    
    if ([element isEqualToString:@"description"]) {
        [description appendString:contentFromCData];
        NSLog(@"%@ description: %@ \n", _newsSourceName, description);
        
    } else if ([element isEqualToString:@"content:encoded"]) {
        [content appendString:contentFromCData];
        NSLog(@"%@ content: %@ \n", _newsSourceName, content);
        
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
}

@end
