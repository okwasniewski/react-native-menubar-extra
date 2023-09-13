#import "MenuBarExtraView.h"
#import "MenuBarExtraItem.h"

@interface MenuBarExtraView ()

@property (nonatomic, strong) NSStatusItem *statusBarItem;
@property (nonatomic, strong) NSMenu *rootMenu;

@end


@implementation MenuBarExtraView

- (instancetype)init {
    if (self = [super init]) {
        self.statusBarItem = [NSStatusBar.systemStatusBar statusItemWithLength:NSVariableStatusItemLength];
        [self updateIcon:self.icon];
        self.rootMenu = [[NSMenu alloc] init];
        self.statusBarItem.menu = self.rootMenu;
    }
    
    return self;
}

- (void)updateIcon:(NSString *) symbolName {
    if (self.statusBarItem.button) {
        if (@available(macOS 11.0, *)) {
            self.statusBarItem.button.image = [NSImage imageWithSystemSymbolName:symbolName accessibilityDescription:nil];
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
    
    if ([subview isKindOfClass:MenuBarExtraItem.class]) {
        MenuBarExtraItem* item = (MenuBarExtraItem*)subview;
        if (item.menuItem != nil) {
            [self.rootMenu addItem:item.menuItem];
        }
    }
}

- (void)didUpdateReactSubviews {
    for (NSView *subview in self.reactSubviews) {
        if ([subview isKindOfClass:MenuBarExtraItem.class]) {
            MenuBarExtraItem* item = (MenuBarExtraItem*)subview;
            [self.rootMenu itemChanged:item.menuItem];
        }
    }
}

- (void)removeReactSubview:(NSView *)subview {
    [super removeReactSubview:subview];
    if ([subview isKindOfClass:MenuBarExtraItem.class]) {
        MenuBarExtraItem* item = (MenuBarExtraItem*)subview;
        [self.rootMenu removeItem:item.menuItem];
    }
}

@end

