//  CBNewsSource.m
//  PNW Beer News
//
//  Created by Cole Bratcher on 7/10/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "CBNewsSource.h"
#import "CBPost.h"

@interface CBNewsSource ()

// Functional
@property (nonatomic, strong) NSXMLParser *parser;
@property (nonatomic, strong) NSString *element;
@property (nonatomic, strong) NSDictionary *item;
@property (nonatomic, strong) CBPost *post;
@property (nonatomic, strong) NSMutableString *descriptionString;
@property (nonatomic, strong) NSData *xmlData;

@end

@implementation CBNewsSource

- (id)initWithName:(NSString *)name URL:(NSURL *)url active:(BOOL)active
{
    self = [super init];
    
    _posts = [NSMutableArray new];
    _post = [CBPost new];
    
    if (self) {
        _newsSourceName = name;
        _newsSourceURL = url;
        _newsSourceActive = YES;
    }
    return self;
}

- (void)parse
{
    _xmlData = [[NSData alloc] initWithContentsOfURL:_newsSourceURL];
    
// Look into this, especially GDataXML for better parsing methods. http://www.raywenderlich.com/2636/rss-reader-tutorial-for-ios-how-to-make-a-simple-rss-reader-iphone-app
    
    _parser = [[NSXMLParser alloc] initWithData:_xmlData];
    
    [_parser setDelegate:self];
    [_parser setShouldResolveExternalEntities:NO];
    if ([_parser parse] == NO) {
        NSLog(@"Cannot retrieve data from %@", _newsSourceURL);
        _foundData = NO;
    } else {
        _foundData = YES;
    }
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
    _element = elementName;
    
    if ([_element isEqualToString:@"item"]) {
        _item = [NSDictionary new];
        _post = [CBPost new];
        _post.postSource = _newsSourceName;
    }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    
    NSString *errorString = [NSString stringWithFormat:@"Unable to download data (Error code %li )",(long)[parseError code]];
    
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error loading content."
                                                         message:errorString
                                                        delegate:self
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
    [errorAlert show];
}

// Note, may need to make separate, expendable properties for these next two methods.

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if (_item) {
        
        _descriptionString = [NSMutableString new];
        
        if ([_element isEqualToString:@"title"]) {
            if (!_post.postTitle) {
                _post.postTitle = string;
            }
        } else if ([_element isEqualToString:@"link"]) {
            _post.postLink = string;
        } else if ([_element isEqualToString:@"pubDate"] && !_post.postDate) {
            NSString *feedDate = string;
            NSDateFormatter *inputFormatter = [NSDateFormatter new];
            [inputFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss '+0000'"];
            NSDate *date = [inputFormatter dateFromString:feedDate];
            _post.postDate = date;
        } else if ([_element isEqualToString:@"description"]) {
            [_descriptionString appendString:string];
            
            // See this Post for help: http://stackoverflow.com/questions/26545634/nsxmlparser-n-and-t-inside-of-text
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock {
    
    // [[NSString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
    
    if (_item) {
        //        if ([_element isEqualToString:@"description"]) {
        //            _post.postDescriptionData = CDATABlock;
        //        }

        if ([_element isEqualToString:@"content:encoded"]) {
            _post.postContentData = CDATABlock;
        }
    }
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"item"]) {
        _post.postDescription = _descriptionString;
        [_posts addObject:_post];
//        _post = nil;
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
}

#pragma mark - Extra Parser Methods

- (void)parseWithCompletion:(void(^)())completion {
    [self parse];
    
    completion();
}

@end
