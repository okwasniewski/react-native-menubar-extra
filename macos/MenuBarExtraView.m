#import "MenuBarExtraView.h"
#import "MenuBarItemProtocol.h"

@interface MenuBarExtraView ()

@property (nonatomic, strong) NSStatusItem *statusBarItem;
@property (nonatomic, strong) NSMenu *rootMenu;

@end


@implementation MenuBarExtraView

- (instancetype)init {
    if (self = [super init]) {
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
            image.template = YES;
            _statusBarItem.button.image = image;
        }
    }
}

- (void)didSetProps:(NSArray<NSString *> *)changedProps {
    if ([changedProps containsObject:@"icon"]) {
        [self updateIcon:self.icon];
    }
}

- (void)insertReactSubview:(NSView *)subview atIndex:(NSInteger)atIndex {
    [super insertReactSubview:subview atIndex:atIndex];
    
    if ([subview conformsToProtocol:@protocol(MenuBarItemProtocol)]) {
        id<MenuBarItemProtocol> item = (id<MenuBarItemProtocol>)subview;
        NSMenuItem *menuItem = [item getItem];
        if (menuItem) {
            [_rootMenu insertItem:menuItem atIndex:atIndex];
        }
    }
}

- (void)didUpdateReactSubviews {
    for (NSView *subview in self.reactSubviews) {
        if ([subview conformsToProtocol:@protocol(MenuBarItemProtocol)]) {
            id<MenuBarItemProtocol> item = (id<MenuBarItemProtocol>)subview;
            NSMenuItem *menuItem = [item getItem];
            [_rootMenu itemChanged:menuItem];
        }
    }
}

- (void)removeReactSubview:(NSView *)subview {
    [super removeReactSubview:subview];
    if ([subview conformsToProtocol:@protocol(MenuBarItemProtocol)]) {
        id<MenuBarItemProtocol> item = (id<MenuBarItemProtocol>)subview;
        NSMenuItem *menuItem = [item getItem];
        [_rootMenu removeItem:menuItem];
    }
}

@end

