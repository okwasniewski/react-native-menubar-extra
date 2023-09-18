#ifdef RCT_NEW_ARCH_ENABLED
#import "RNMenuBarExtraSeparator.h"
#import "MenuBarItemProtocol.h"

#import <react/renderer/components/RNMenubarExtraViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNMenubarExtraViewSpec/EventEmitters.h>
#import <react/renderer/components/RNMenubarExtraViewSpec/Props.h>
#import <react/renderer/components/RNMenubarExtraViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@interface RNMenuBarExtraSeparator () <RCTMenuBarExtraSeparatorViewViewProtocol, MenuBarItemProtocol>

@end

@implementation RNMenuBarExtraSeparator

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<MenuBarExtraSeparatorViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const MenuBarExtraSeparatorViewProps>();
    _props = defaultProps;
    _menuItem = [NSMenuItem separatorItem];
  }

  return self;
}

- (NSMenuItem *)getItem {
    return _menuItem;
}

Class<RCTComponentViewProtocol> MenuBarExtraSeparatorViewCls(void)
{
    return RNMenuBarExtraSeparator.class;
}

@end
#endif
