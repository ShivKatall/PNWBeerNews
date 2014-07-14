//
//  CBNewsSource.h
//  PNW Beer News
//
//  Created by Cole Bratcher on 7/10/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBNewsSource : NSObject <NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableArray *feeds;

- (id)initWithName:(NSString *)name URL:(NSURL *)url active:(BOOL)active;
- (void)parse;

@end
