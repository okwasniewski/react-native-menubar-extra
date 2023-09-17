#import "MenuBarExtraSeparator.h"
#import <React/RCTViewManager.h>


@interface MenuBarExtraSeparatorViewManager : RCTViewManager

@end

@implementation MenuBarExtraSeparatorViewManager


RCT_EXPORT_MODULE(MenuBarExtraSeparatorView)

- (NSView *)view
{
  return [[MenuBarExtraSeparator alloc] init];
}

@end
