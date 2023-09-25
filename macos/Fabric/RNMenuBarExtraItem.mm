#ifdef RCT_NEW_ARCH_ENABLED
#import "RNMenuBarExtraItem.h"
#import "MenuBarItemProtocol.h"

#import <react/renderer/components/RNMenubarExtraViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNMenubarExtraViewSpec/EventEmitters.h>
#import <react/renderer/components/RNMenubarExtraViewSpec/Props.h>
#import <react/renderer/components/RNMenubarExtraViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@interface RNMenuBarExtraItem () <RCTMenuBarExtraItemViewViewProtocol, MenuBarItemProtocol>

@end

@implementation RNMenuBarExtraItem

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<MenuBarExtraItemViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        static const auto defaultProps = std::make_shared<const MenuBarExtraItemViewProps>();
        _props = defaultProps;
        
        _menuItem = [[NSMenuItem alloc] init];
        _menuItem.target = self;
        _menuItem.action = @selector(handlePress);
    }
    
    return self;
}

- (void)handlePress {
    if (self->_eventEmitter) {
        std::dynamic_pointer_cast<const MenuBarExtraItemViewEventEmitter>(self->_eventEmitter)->onItemPress({});
    }
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<MenuBarExtraItemViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<MenuBarExtraItemViewProps const>(props);
    
    if (oldViewProps.title != newViewProps.title) {
        _menuItem.title = [NSString stringWithUTF8String:newViewProps.title.c_str()];
    }
    
    if (oldViewProps.icon != newViewProps.icon) {
        if (@available(macOS 11.0, *)) {
            NSString *iconName = [NSString stringWithUTF8String:newViewProps.icon.c_str()];
            _menuItem.image = [NSImage imageWithSystemSymbolName:iconName accessibilityDescription:@""];
        }
    }
    
    if (oldViewProps.keyEquivalent != newViewProps.keyEquivalent) {
        _menuItem.keyEquivalent = [NSString stringWithUTF8String:newViewProps.keyEquivalent.c_str()];
    }
    
    if (oldViewProps.keyEquivalentModifierMask != newViewProps.keyEquivalentModifierMask) {
        NSEventModifierFlags eventModifierFlags = KeyEquivalentModifierMaskToNSEventModifierFlags(newViewProps.keyEquivalentModifierMask);
        _menuItem.keyEquivalentModifierMask = eventModifierFlags;
    }

    [super updateProps:props oldProps:oldProps];
}

- (void)mountChildComponentView:(RCTUIView<RCTComponentViewProtocol> *)childComponentView index:(NSInteger)index {
    if (_menuItem.submenu == nil) {
        _menuItem.submenu = [[NSMenu alloc] init];
    }
    
    if ([childComponentView conformsToProtocol:@protocol(MenuBarItemProtocol)]) {
        id<MenuBarItemProtocol> item = (id<MenuBarItemProtocol>)childComponentView;
        NSMenuItem *menuItem = [item getItem];
        
        [_menuItem.submenu insertItem:menuItem atIndex:index];
    }
}

- (void)unmountChildComponentView:(RCTUIView<RCTComponentViewProtocol> *)childComponentView index:(NSInteger)index {
    if (![childComponentView conformsToProtocol:@protocol(MenuBarItemProtocol)]) {
        return;
    }
    
    id<MenuBarItemProtocol> item = (id<MenuBarItemProtocol>)childComponentView;
    NSMenuItem *menuItem = [item getItem];
    
    if (_menuItem.submenu) {
        [_menuItem.submenu removeItem:menuItem];
    }
    
    if (_menuItem.submenu.numberOfItems == 0) {
        _menuItem.submenu = nil;
    }
}

- (NSMenuItem *)getItem {
    return _menuItem;
}

NSEventModifierFlags KeyEquivalentModifierMaskToNSEventModifierFlags(MenuBarExtraItemViewKeyEquivalentModifierMask modifierMask) {
    switch (modifierMask) {
        case MenuBarExtraItemViewKeyEquivalentModifierMask::COMMAND:
            return NSEventModifierFlagCommand;
        case MenuBarExtraItemViewKeyEquivalentModifierMask::CONTROL:
            return NSEventModifierFlagControl;
        case MenuBarExtraItemViewKeyEquivalentModifierMask::CAPS_LOCK:
            return NSEventModifierFlagCapsLock;
        case MenuBarExtraItemViewKeyEquivalentModifierMask::SHIFT:
            return NSEventModifierFlagShift;
        case MenuBarExtraItemViewKeyEquivalentModifierMask::NUMERIC_PAD:
            return NSEventModifierFlagNumericPad;
        case MenuBarExtraItemViewKeyEquivalentModifierMask::HELP:
            return NSEventModifierFlagHelp;
        case MenuBarExtraItemViewKeyEquivalentModifierMask::FUNCTION:
            return NSEventModifierFlagFunction;
        case MenuBarExtraItemViewKeyEquivalentModifierMask::OPTION:
            return NSEventModifierFlagOption;
    }
}

Class<RCTComponentViewProtocol> MenuBarExtraItemViewCls(void)
{
    return RNMenuBarExtraItem.class;
}

@end
#endif
