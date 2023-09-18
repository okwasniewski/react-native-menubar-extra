#import <Foundation/Foundation.h>

@protocol MenuBarItemProtocol <NSObject>

@required
- (NSMenuItem*) getItem;

@end
