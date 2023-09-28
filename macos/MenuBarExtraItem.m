#ifndef RCT_NEW_ARCH_ENABLED

#import "MenuBarExtraItem.h"
#import "MenuBarOnPressEvent.h"

@interface MenuBarExtraItem () <MenuBarItemProtocol>
@property(nonatomic, strong) id<RCTEventDispatcherProtocol> eventDispatcher;
@end

@implementation MenuBarExtraItem

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher {
    if (self = [super init]) {
        _eventDispatcher = eventDispatcher;
        _menuItem = [[NSMenuItem alloc] init];
    }
    
    return self;
}

- (void)didSetProps:(NSArray<NSString *> *)changedProps {
    if ([changedProps containsObject:@"onItemPress"]) {
        if (_onItemPress) {
            _menuItem.target = self;
            _menuItem.action = @selector(handleClick);
        } else {
            _menuItem.target = nil;
            _menuItem.action = nil;
        }
    }
    if ([changedProps containsObject:@"title"]) {
        _menuItem.title = _title;
    }
    if ([changedProps containsObject:@"icon"]) {
        if (@available(macOS 11.0, *)) {
            _menuItem.image = [NSImage imageWithSystemSymbolName:_icon accessibilityDescription:@""];
        }
    }
    if ([changedProps containsObject:@"keyEquivalent"]) {
        _menuItem.keyEquivalent = _keyEquivalent;
    }
    if ([changedProps containsObject:@"keyEquivalentModifierMask"]) {
        _menuItem.keyEquivalentModifierMask = _keyEquivalentModifierMask;
    }
    if ([changedProps containsObject:@"controlState"]) {
        _menuItem.state = _controlState;
    }
}


- (void)handleClick {
    [_eventDispatcher sendEvent:[[MenuBarOnPressEvent alloc] initWithReactTag:self.reactTag]];
}

- (void)insertReactSubview:(NSView *)subview atIndex:(NSInteger)atIndex {
    [super insertReactSubview:subview atIndex:atIndex];
    
    if (_menuItem.submenu == nil) {
        _menuItem.submenu = [[NSMenu alloc] init];
    }
    
    if ([subview conformsToProtocol:@protocol(MenuBarItemProtocol)]) {
        id<MenuBarItemProtocol> item = (id<MenuBarItemProtocol>)subview;
        NSMenuItem *menuItem = [item getItem];
        
        [_menuItem.submenu insertItem:menuItem atIndex:atIndex];
    }
}

- (void)removeReactSubview:(NSView *)subview {
    [super removeReactSubview:subview];
    
    if (![subview conformsToProtocol:@protocol(MenuBarItemProtocol)]) {
        return;
    }
    
    id<MenuBarItemProtocol> item = (id<MenuBarItemProtocol>)subview;
    NSMenuItem *menuItem = [item getItem];
    
    if (_menuItem.submenu) {
        [_menuItem.submenu removeItem:menuItem];
    }
    
    if (_menuItem.submenu.numberOfItems == 0) {
        _menuItem.submenu = nil;
    }
}

- (NSMenuItem*)getItem {
    return _menuItem;
}

@end

#endif
