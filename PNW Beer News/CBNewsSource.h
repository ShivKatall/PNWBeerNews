//
//  CBNewsSource.h
//  PNW Beer News
//
//  Created by Cole Bratcher on 7/10/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBNewsSource : NSObject <NSXMLParserDelegate>

// Data
@property (nonatomic, strong) NSString *newsSourceName;
@property (nonatomic, strong) NSURL *newsSourceURL;
@property BOOL newsSourceActive;
@property (nonatomic, strong) NSMutableArray *posts;

- (id)initWithName:(NSString *)name URL:(NSURL *)url active:(BOOL)active;
- (void)parse;
- (void)parseWithCompletion:(void(^)())completion;

@end
