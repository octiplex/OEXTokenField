//
//  OEXTokenFieldCell.h
//  OEXTokenField
//
//  Created by Nicolas BACHSCHMIDT on 16/03/2013.
//  Copyright (c) 2013 Octiplex. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol OEXTokenFieldCellDelegate;

/** `OEXTokenFieldCell` is a subclass of `NSTokenFieldCell` that allows token customization.
 */
@interface OEXTokenFieldCell : NSTokenFieldCell

/** @name Accessing the Delegate */

/** The token field cell's delegate.
 @discussion The delegate must adopt the `<OEXTokenFieldCellDelegate>` protocol.
 */
@property(weak) id<OEXTokenFieldCellDelegate, NSTokenFieldCellDelegate> delegate;

/** @name Displaying Tokenized Attachment Cells */

/** Returns the attachment cell to be displayed for the given represented object.
 @param representedObject A represented object of the receiver.
 @return The attachment cell to be displayed for `representedObject`.
 @discussion The default implementation invokes `<[OEXTokenFieldCellDelegate tokenFieldCell:attachmentCellForRepresentedObject:]>` on the receiver's delegate if the method is implemented. Otherwise it returns `nil`.
 */
- (NSTextAttachmentCell *)attachmentCellForRepresentedObject:(id)representedObject;

@end

#pragma mark -

/** The `OEXTokenFieldDelegate` protocol defines the optional methods implemented by delegates of `<OEXTokenFieldCell>` objects.
 */
@protocol OEXTokenFieldCellDelegate <NSTokenFieldCellDelegate>

@optional

/** @name Displaying Tokenized Attachment Cells */

/** Allows the delegate to provide an attachment cell to be displayed for the given represented object.
 @param tokenFieldCell The token field cell that sent the message.
 @param representedObject A represented object of the token field cell.
 @return The attachment cell to be displayed for `representedObject`. If you return `nil` or do not implement this method, a standard token is displayed.
 */
- (NSTextAttachmentCell *)tokenFieldCell:(OEXTokenFieldCell *)tokenFieldCell attachmentCellForRepresentedObject:(id)representedObject;

@end
