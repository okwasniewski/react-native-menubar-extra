#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import "RCTBridge.h"

@interface MenubarExtraViewManager : RCTViewManager
@end

@implementation MenubarExtraViewManager

RCT_EXPORT_MODULE(MenubarExtraView)

- (NSView *)view
{
  return [[NSView alloc] init];
}

RCT_CUSTOM_VIEW_PROPERTY(color, NSString, NSView)
{
//  [view setBackgroundColor: [Utils hexStringToColor:json]];
}

@end
