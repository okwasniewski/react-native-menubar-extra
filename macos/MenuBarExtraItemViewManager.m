#import <React/RCTViewManager.h>
#import "MenuBarExtraItem.h"

@interface MenuBarExtraItemViewManager : RCTViewManager
@end


@implementation MenuBarExtraItemViewManager

RCT_EXPORT_MODULE(MenuBarExtraItemView)

RCT_EXPORT_VIEW_PROPERTY(title, NSString)
RCT_EXPORT_VIEW_PROPERTY(icon, NSString)
RCT_EXPORT_VIEW_PROPERTY(iconImage, RCTImageSource)
RCT_EXPORT_VIEW_PROPERTY(keyEquivalent, NSString)
RCT_EXPORT_VIEW_PROPERTY(keyEquivalentModifierMask, NSEventModifierFlags)
RCT_EXPORT_VIEW_PROPERTY(controlState, NSControlStateValue)
RCT_EXPORT_VIEW_PROPERTY(onItemPress, RCTDirectEventBlock)

- (NSView *)view {
    return [[MenuBarExtraItem alloc] initWithBridge:self.bridge];
}

@end
