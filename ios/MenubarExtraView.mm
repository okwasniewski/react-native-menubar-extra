#ifdef RCT_NEW_ARCH_ENABLED
#import "MenubarExtraView.h"

#import <react/renderer/components/RNMenubarExtraViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNMenubarExtraViewSpec/EventEmitters.h>
#import <react/renderer/components/RNMenubarExtraViewSpec/Props.h>
#import <react/renderer/components/RNMenubarExtraViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"
#import "Utils.h"

using namespace facebook::react;

@interface MenubarExtraView () <RCTMenubarExtraViewViewProtocol>

@end

@implementation MenubarExtraView {
    UIView * _view;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<MenubarExtraViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const MenubarExtraViewProps>();
    _props = defaultProps;

    _view = [[UIView alloc] init];

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<MenubarExtraViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<MenubarExtraViewProps const>(props);

    if (oldViewProps.color != newViewProps.color) {
        NSString * colorToConvert = [[NSString alloc] initWithUTF8String: newViewProps.color.c_str()];
        [_view setBackgroundColor: [Utils hexStringToColor:colorToConvert]];
    }

    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> MenubarExtraViewCls(void)
{
    return MenubarExtraView.class;
}

@end
#endif
