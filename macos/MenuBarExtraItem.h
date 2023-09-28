#import <AppKit/AppKit.h>
#import "MenuBarItemProtocol.h"
#import <React/UIView+React.h>
#import <React/RCTEventDispatcher.h>

@interface MenuBarExtraItem : RCTPlatformView

- (instancetype)initWithEventDispatcher:(id<RCTEventDispatcherProtocol>)eventDispatcher;

@property(nonatomic, copy) NSString* title;
@property(nonatomic, copy) NSString* icon;
@property(nonatomic, copy) NSString* keyEquivalent;
@property(nonatomic, assign) NSEventModifierFlags keyEquivalentModifierMask;
@property(nonatomic, assign) NSControlStateValue controlState;
@property(nonatomic, strong) NSMenuItem* menuItem;
@property(nonatomic, copy) RCTDirectEventBlock onItemPress;

@end

