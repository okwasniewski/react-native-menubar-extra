#import "MenuBarExtraItem.h"
#import "MenuBarOnPressEvent.h"

@interface MenuBarExtraItem ()
@property(nonatomic, strong) id<RCTEventDispatcherProtocol> eventDispatcher;
@end

@implementation MenuBarExtraItem

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher {
    if (self = [super init]) {
        _eventDispatcher = eventDispatcher;
        
        self.menuItem = [[NSMenuItem alloc] init];
    }
    
    return self;
}

- (void)didSetProps:(NSArray<NSString *> *)changedProps {
    if ([changedProps containsObject:@"onItemPress"]) {
        self.menuItem.target = self;
        self.menuItem.action = @selector(handleClick);
    }
    if ([changedProps containsObject:@"title"]) {
        self.menuItem.title = self.title;
    }
    if ([changedProps containsObject:@"icon"]) {
        if (@available(macOS 11.0, *)) {
            self.menuItem.image = [NSImage imageWithSystemSymbolName:self.icon accessibilityDescription:@""];
        }
    }
}

- (void)handleClick {
    [self.eventDispatcher sendEvent:[[MenuBarOnPressEvent alloc] initWithReactTag:self.reactTag]];
}

- (void)insertReactSubview:(NSView *)subview atIndex:(NSInteger)atIndex {
    [super insertReactSubview:subview atIndex:atIndex];
   
    if (self.menuItem.submenu == nil) {
        self.menuItem.submenu = [[NSMenu alloc] init];
    }

    if ([subview isKindOfClass:self.class]) {
        MenuBarExtraItem *subItem = (MenuBarExtraItem*)subview;
        [self.menuItem.submenu addItem:subItem.menuItem];
    }
}

- (void)removeReactSubview:(NSView *)subview {
    if (![subview isKindOfClass:self.class]) {
        return;
    }
    
    MenuBarExtraItem *subItem = (MenuBarExtraItem*)subview;
    
    if (self.menuItem.submenu) {
        [self.menuItem.submenu removeItem:subItem.menuItem];
    }
    
    if (self.menuItem.submenu.numberOfItems == 0) {
        self.menuItem.submenu = nil;
    }
    [super removeReactSubview:subview];
}

@end
