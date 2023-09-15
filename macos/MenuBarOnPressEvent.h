#import <Foundation/Foundation.h>
#import <React/UIView+React.h>
#import <React/RCTViewManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuBarOnPressEvent : NSObject <RCTEvent>

- (instancetype) initWithReactTag:(NSNumber *)reactTag;

@end

NS_ASSUME_NONNULL_END
