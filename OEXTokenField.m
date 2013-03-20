//
//  OEXTokenField.m
//  OEXTokenField
//
//  Created by Nicolas BACHSCHMIDT on 16/03/2013.
//  Copyright (c) 2013 Octiplex. All rights reserved.
//

#import "OEXTokenField.h"
#import "OEXTokenFieldCell.h"

@interface OEXTokenField () <OEXTokenFieldCellDelegate>
@end

@implementation OEXTokenField

@dynamic delegate;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ( ! (self = [super initWithCoder:aDecoder]) )
        return nil;
    
    // Changing the cell's class in the XIB is easy to forget
    // Let's make sure we have a OEXTokenFieldCell
    
    if ( ! [self.cell isKindOfClass:[OEXTokenFieldCell class]] )
    {
        NSMutableData *data = [NSMutableData new];
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        [self.cell encodeWithCoder:archiver];
        [archiver finishEncoding];
        self.cell = [[OEXTokenFieldCell alloc] initWithCoder:[[NSKeyedUnarchiver alloc] initForReadingWithData:data]];
    }
    return self;
}

+ (Class)cellClass
{
    return [OEXTokenFieldCell class];
}

- (NSTextAttachmentCell *)tokenFieldCell:(OEXTokenFieldCell *)tokenFieldCell attachmentCellForRepresentedObject:(id)representedObject
{
    if ( [self.delegate respondsToSelector:@selector(tokenField:attachmentCellForRepresentedObject:)] )
        return [self.delegate tokenField:self attachmentCellForRepresentedObject:representedObject];
    
    return nil;
}

#pragma mark - NSTextViewDelegate

- (void)textView:(NSTextView *)aTextView clickedOnCell:(id <NSTextAttachmentCell>)cell inRect:(NSRect)cellFrame atIndex:(NSUInteger)charIndex
{
    [aTextView setSelectedRange:NSMakeRange(charIndex, 1)];
}

@end
