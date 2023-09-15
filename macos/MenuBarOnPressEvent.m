#import "MenuBarOnPressEvent.h"

@implementation MenuBarOnPressEvent

@synthesize viewTag = _viewTag;

- (NSString *)eventName {
    return @"onItemPress";
}

- (instancetype) initWithReactTag:(NSNumber *)reactTag;
{
    if (self = [super init]) {
        _viewTag = reactTag;
    }
    return self;
}


- (BOOL)canCoalesce
{
    return NO;
}

+ (NSString *)moduleDotMethod
{
    return @"RCTEventEmitter.receiveEvent";
}

- (NSArray *)arguments
{
    return @[self.viewTag, RCTNormalizeInputEventName(self.eventName)];
}

@end

