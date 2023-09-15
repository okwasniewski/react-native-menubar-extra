#import <AppKit/AppKit.h>
#import <React/UIView+React.h>
#import <React/RCTEventDispatcher.h>

@interface MenuBarExtraItem : RCTPlatformView

- (instancetype)initWithEventDispatcher:(id<RCTEventDispatcherProtocol>)eventDispatcher;

@property(nonatomic) NSString* title;
@property(nonatomic) NSString* icon;
@property(nonatomic) Boolean isSeparator;
@property(nonatomic, strong) NSMenuItem* menuItem;
@property(nonatomic, copy) RCTDirectEventBlock onItemPress;

@end
