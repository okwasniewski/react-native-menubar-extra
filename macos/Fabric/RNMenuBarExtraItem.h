#ifdef RCT_NEW_ARCH_ENABLED

#import <React/RCTViewComponentView.h>

@interface RNMenuBarExtraItem : RCTViewComponentView

@property(nonatomic) NSString* title;
@property(nonatomic) NSString* icon;
@property(nonatomic, strong) NSMenuItem* menuItem;

@end

#endif
