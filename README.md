## Introduction

`OEXTokenField` is a subclass of `NSTokenField` that allows token customization.

## How to use

`NSTokenField` tokens rely on text attachments, which are drawn by instances of `NSTextAttachmentCell`. `OEXTokenField` works by subsituting the default text attachment cells as they are inserted with cells provided by its delegate.

In order to provide custom token cells, you just need to implement the following delegation method:

    - (NSTextAttachmentCell *)tokenField:(OEXTokenField *)tokenField attachmentCellForRepresentedObject:(id)representedObject;

Any instance of `NSTextAttachmentCell` is fine. However, if you want to display tokens that look identical or similar to AppKit tokens, you may use and subclass the `OEXTokenAttachmentCell` class.

## Known issues

For the moment, `OEXTokenField` doesn't provide menus for represented objects that display custom attachment cells. 

## Source Code

The OEXTokenField code is available from GitHub:

    https://github.com/octiplex/OEXTokenField.git

## License

OEXTokenField is made available under the Revised BSD License. See the `LICENSE` file for more info.