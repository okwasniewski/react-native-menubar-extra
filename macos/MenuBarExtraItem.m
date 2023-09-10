#import "MenuBarExtraItem.h"

@implementation MenuBarExtraItem

- (instancetype)init {
    if (self = [super init]) {
        self.menuItem = [[NSMenuItem alloc] init];
        self.menuItem.target = self;
        self.menuItem.action = @selector(handleClick);
    }
    
    return self;
}

- (void)didSetProps:(NSArray<NSString *> *)changedProps {
    if ([changedProps containsObject:@"title"]) {
        self.menuItem.title = self.title;
    }
    if ([changedProps containsObject:@"icon"]) {
        self.menuItem.image = [NSImage imageWithSystemSymbolName:self.icon accessibilityDescription:@""];
    }
    
}

- (void)handleClick {
    NSLog(@"Clicked");
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

@end
