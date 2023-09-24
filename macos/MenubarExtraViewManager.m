#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import "RCTBridge.h"
#import "MenuBarExtraView.h"

@interface MenubarExtraViewManager : RCTViewManager
@end

@implementation MenubarExtraViewManager

RCT_EXPORT_MODULE(MenubarExtraView)

RCT_EXPORT_VIEW_PROPERTY(icon, NSString)
RCT_EXPORT_VIEW_PROPERTY(title, NSString)

- (NSView *)view
{
  return [[MenuBarExtraView alloc] init];
}

@end
