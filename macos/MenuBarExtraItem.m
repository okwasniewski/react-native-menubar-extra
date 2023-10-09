#ifndef RCT_NEW_ARCH_ENABLED

#import "MenuBarExtraItem.h"
#import "MenuBarOnPressEvent.h"
#import <React/RCTImageLoaderWithAttributionProtocol.h>
#import <React/RCTImageLoader.h>
#import <React/RCTImageSource.h>

@interface MenuBarExtraItem () <MenuBarItemProtocol>
@end

@implementation MenuBarExtraItem {
    __weak RCTBridge* _bridge;
    __weak id<RCTImageLoaderWithAttributionProtocol> _imageLoader;
}

- (instancetype)initWithBridge:(RCTBridge *)bridge {
    if (self = [super init]) {
        _menuItem = [[NSMenuItem alloc] init];
        _bridge = bridge;
        _imageLoader = [_bridge moduleForClass:[RCTImageLoader class]];
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
    
    if ([changedProps containsObject:@"iconImage"]) {
        __weak typeof(self) weakSelf = self;
        [_imageLoader loadImageWithURLRequest:_iconImage.request callback:^(NSError * _Nullable error, NSImage * _Nullable image) {
            if (error) {
                return;
            }
            weakSelf.menuItem.image = image;
            weakSelf.menuItem.image.size = weakSelf.iconImage.size;
        }];
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
    [_bridge.eventDispatcher sendEvent:[[MenuBarOnPressEvent alloc] initWithReactTag:self.reactTag]];
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
