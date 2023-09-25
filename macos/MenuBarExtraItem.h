#import <AppKit/AppKit.h>
#import "MenuBarItemProtocol.h"
#import <React/UIView+React.h>
#import <React/RCTEventDispatcher.h>

@interface MenuBarExtraItem : RCTPlatformView

- (instancetype)initWithEventDispatcher:(id<RCTEventDispatcherProtocol>)eventDispatcher;

@property(nonatomic) NSString* title;
@property(nonatomic) NSString* icon;
@property(nonatomic) NSString* keyEquivalent;
@property(nonatomic) NSEventModifierFlags keyEquivalentModifierMask;
@property(nonatomic, strong) NSMenuItem* menuItem;
@property(nonatomic, copy) RCTDirectEventBlock onItemPress;

@end

