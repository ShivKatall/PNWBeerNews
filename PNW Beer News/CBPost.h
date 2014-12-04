//
//  CBPost.h
//  PNW Beer News
//
//  Created by Cole Bratcher on 10/27/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBPost : NSObject

@property (nonatomic, strong) NSString *postSource;
@property (nonatomic, strong) NSString *postTitle;
@property (nonatomic, strong) NSString *postLink;
@property (nonatomic, strong) NSMutableString *postDescription;
//@property (nonatomic, strong) NSData *postDescriptionData;
//@property (nonatomic, strong) NSAttributedString *postDescriptionText;
@property (nonatomic, strong) NSData *postContentData;
@property (nonatomic, strong) NSAttributedString *postContentText;
@property (nonatomic, strong) NSDate *postDate;

-(NSString *)createOutputDate;
//-(void)createAttributedTextForDescriptionWithCompletionBlock:(void (^)())completion;
-(void)createAttributedTextForContentWithCompletionBlock:(void (^)())completion;

@end
