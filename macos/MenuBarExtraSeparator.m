#import "MenuBarExtraSeparator.h"

@interface MenuBarExtraSeparator () <MenuBarItemProtocol>

@end

@implementation MenuBarExtraSeparator

- (instancetype)init {
    if (self = [super init]) {
        _menuItem = [NSMenuItem separatorItem];
    }
    
    return self;
}

- (NSMenuItem *)getItem {
    return _menuItem;
}

@end
