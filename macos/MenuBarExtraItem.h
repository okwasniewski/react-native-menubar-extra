#import <AppKit/AppKit.h>
#import <React/UIView+React.h>

@interface MenuBarExtraItem : RCTPlatformView

@property(nonatomic) NSString* title;
@property(nonatomic) NSString* icon;
@property(nonatomic) Boolean isSeparator;
@property(nonatomic, strong) NSMenuItem* menuItem;

@end
