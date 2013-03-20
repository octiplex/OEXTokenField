//
//  OEXTokenAttachmentCell.h
//  OEXTokenField
//
//  Created by Nicolas BACHSCHMIDT on 16/03/2013.
//  Copyright (c) 2013 Octiplex. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef NS_ENUM(NSUInteger, OEXTokenDrawingMode) {
    OEXTokenDrawingModeDefault,
    OEXTokenDrawingModeHighlighted,
    OEXTokenDrawingModeSelected,
};

typedef NS_ENUM(NSUInteger, OEXTokenJoinStyle) {
    OEXTokenJoinStyleNone,
    OEXTokenJoinStyleLeft,
    OEXTokenJoinStyleRight,
    OEXTokenJoinStyleBoth,
};

/** `OEXTokenAttachmentCell` is a subclass of `NSTextAttachmentCell` that provides methods for drawing text attachment tokens.
 
 `OEXTokenAttachmentCell` instances may be used to customize tokens in `<OEXTokenField>` and `<OEXTokenFieldCell>`. 
 
 The default implementation draws tokens that look indentical to the standard ones.
 */
@interface OEXTokenAttachmentCell : NSTextAttachmentCell

// TODO: Add documentation for the methods

- (NSSize)cellSizeForTitleSize:(NSSize)titleSize;
- (NSRect)titleRectForBounds:(NSRect)bounds;

- (void)drawTokenWithFrame:(NSRect)rect inView:(NSView *)controlView;
- (void)drawTitleWithFrame:(NSRect)rect inView:(NSView *)controlView;

- (OEXTokenDrawingMode)tokenDrawingMode;
- (OEXTokenJoinStyle)tokenJoinStyle;

- (NSColor *)tokenFillColorForDrawingMode:(OEXTokenDrawingMode)drawingMode;
- (NSColor *)tokenStrokeColorForDrawingMode:(OEXTokenDrawingMode)drawingMode;
- (NSColor *)tokenTitleColorForDrawingMode:(OEXTokenDrawingMode)drawingMode;

- (NSBezierPath *)tokenPathForBounds:(NSRect)bounds joinStyle:(OEXTokenJoinStyle)joinStyle;

@end
