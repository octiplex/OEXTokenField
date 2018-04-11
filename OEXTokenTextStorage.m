//
//  OEXTokenTextStorage.m
//  OEXTokenField
//
//  Created by Nicolas BACHSCHMIDT on 16/03/2013.
//  Copyright (c) 2013 Octiplex. All rights reserved.
//

#import "OEXTokenTextStorage.h"

@implementation OEXTokenTextStorage
{
    NSMutableAttributedString *_string;
}

@dynamic delegate;

#pragma mark - init

- (id)initWithAttributedString:(NSAttributedString *)attrStr
{
    if ( ! (self = [super init]) )
        return nil;
    
    _string = [[NSMutableAttributedString alloc] initWithAttributedString:attrStr];
    return self;
}

- (id)init
{
    return [self initWithAttributedString:nil];
}

#pragma mark - Primitive Methods

- (NSString *)string
{
    return [_string string];
}

- (NSDictionary *)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range
{
    return [_string attributesAtIndex:location effectiveRange:range];
}

- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str
{
    [_string replaceCharactersInRange:range withString:str];
    [self edited:NSTextStorageEditedCharacters range:range changeInLength:str.length - range.length];
}

- (void)setAttributes:(NSDictionary *)attrs range:(NSRange)range
{
    [_string setAttributes:attrs range:range];
    NSTextAttachment *attachment = attrs[NSAttachmentAttributeName];
    if ( attachment && [self.delegate respondsToSelector:@selector(tokenTextStorage:updateTokenAttachment:forRange:)] )
        [self.delegate tokenTextStorage:self updateTokenAttachment:attachment forRange:range];
    [self edited:NSTextStorageEditedAttributes range:range changeInLength:0];
}

#pragma mark - Convenience Methods

- (void)removeAttribute:(NSString *)name range:(NSRange)range
{
    [_string removeAttribute:name range:range];
    [self edited:NSTextStorageEditedAttributes range:range changeInLength:0];
}

- (void)replaceCharactersInRange:(NSRange)range withAttributedString:(NSAttributedString *)attrString
{
    [_string replaceCharactersInRange:range withAttributedString:attrString];
    NSRange strRange = NSMakeRange(range.location, attrString.length);
    
    [_string enumerateAttribute:NSAttachmentAttributeName inRange:strRange options:0 usingBlock:^(NSTextAttachment *attachment, NSRange arange, BOOL *stop) {
        if ( attachment && [self.delegate respondsToSelector:@selector(tokenTextStorage:updateTokenAttachment:forRange:)] ) {
            [self.delegate tokenTextStorage:self updateTokenAttachment:attachment forRange:arange];
        }
    }];
    [self edited:NSTextStorageEditedAttributes | NSTextStorageEditedCharacters range:range changeInLength:strRange.length - range.length];
}

@end
