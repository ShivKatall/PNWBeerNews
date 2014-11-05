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

-(void)createAttributedTextForDescriptionWithCompletionBlock:(void (^)())completion
{
        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithData:_postDescriptionData
                                                                              options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: [NSNumber numberWithInt:NSUTF8StringEncoding]}
                                                                   documentAttributes:nil
                                                                                error:nil];
        _postDescriptionText = attributedText;
    
    completion();
}

-(void)createAttributedTextForContentWithCompletionBlock:(void (^)())completion
{
        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithData:_postContentData
                                                                              options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: [NSNumber numberWithInt:NSUTF8StringEncoding]}
                                                                   documentAttributes:nil
                                                                                error:nil];
   
    _postContentText = attributedText;
    
    completion();
}

-(NSAttributedString *)formatAttributedText:(NSMutableAttributedString *)attributedText
{
    [attributedText beginEditing];
    attributedText addAttribute:NSFontAttributeName value: range:<#(NSRange)#>
}
                   
@end