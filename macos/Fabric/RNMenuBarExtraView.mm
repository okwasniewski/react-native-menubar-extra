#ifdef RCT_NEW_ARCH_ENABLED
#import "RNMenuBarExtraView.h"
#import "MenuBarItemProtocol.h"

#import <react/renderer/components/RNMenubarExtraViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNMenubarExtraViewSpec/EventEmitters.h>
#import <react/renderer/components/RNMenubarExtraViewSpec/Props.h>
#import <react/renderer/components/RNMenubarExtraViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@interface RNMenuBarExtraView () <RCTMenubarExtraViewViewProtocol>

@property (nonatomic, strong) NSStatusItem *statusBarItem;
@property (nonatomic, strong) NSMenu *rootMenu;

@end

@implementation RNMenuBarExtraView

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<MenubarExtraViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        static const auto defaultProps = std::make_shared<const MenubarExtraViewProps>();
        _props = defaultProps;
        
        _statusBarItem = [NSStatusBar.systemStatusBar statusItemWithLength:NSVariableStatusItemLength];
        [self updateIcon:self.icon];
        _rootMenu = [[NSMenu alloc] init];
        
        _statusBarItem.menu = _rootMenu;
    }
    
    return self;
}

- (void)updateIcon:(NSString *) symbolName {
    if (_statusBarItem.button) {
        if (@available(macOS 11.0, *)) {
            [self.menu insertItem:[NSMenuItem separatorItem] atIndex:1];
            NSImage *image = [NSImage imageWithSystemSymbolName:symbolName accessibilityDescription:nil];
            [image setTemplate:YES];
            _statusBarItem.button.image = image;
        }
    }
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<MenubarExtraViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<MenubarExtraViewProps const>(props);
    
    if (oldViewProps.icon != newViewProps.icon) {
        [self updateIcon:[NSString stringWithCString:newViewProps.icon.c_str() encoding:[NSString defaultCStringEncoding]]];
    }
    
    [super updateProps:props oldProps:oldProps];
}

- (void)mountChildComponentView:(RCTUIView<RCTComponentViewProtocol> *)childComponentView index:(NSInteger)index {
    if ([childComponentView conformsToProtocol:@protocol(MenuBarItemProtocol)]) {
        id<MenuBarItemProtocol> item = (id<MenuBarItemProtocol>)childComponentView;
        NSMenuItem *menuItem = [item getItem];
        if (menuItem) {
            [_rootMenu insertItem:menuItem atIndex:index];
        }
    }
}

- (void)unmountChildComponentView:(RCTUIView<RCTComponentViewProtocol> *)childComponentView index:(NSInteger)index {
    if ([childComponentView conformsToProtocol:@protocol(MenuBarItemProtocol)]) {
        id<MenuBarItemProtocol> item = (id<MenuBarItemProtocol>)childComponentView;
        NSMenuItem *menuItem = [item getItem];
        if (menuItem) {
            [_rootMenu removeItem:menuItem];
        }
    }
}

Class<RCTComponentViewProtocol> MenubarExtraViewCls(void)
{
    return RNMenuBarExtraView.class;
}

@end
#endif
