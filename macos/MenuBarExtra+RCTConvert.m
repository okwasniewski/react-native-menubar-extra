#import <React/RCTConvert.h>
#import <React/RCTViewManager.h>

@implementation RCTConvert (MenuBarExtraTypes)

RCT_ENUM_CONVERTER(
   NSEventModifierFlags,
    (@{
      @"CAPS_LOCK" : @(NSEventModifierFlagCapsLock),
      @"SHIFT" : @(NSEventModifierFlagShift),
      @"CONTROL" : @(NSEventModifierFlagControl),
      @"OPTION" : @(NSEventModifierFlagOption),
      @"COMMAND" : @(NSEventModifierFlagCommand),
      @"NUMERIC_PAD" : @(NSEventModifierFlagNumericPad),
      @"HELP": @(NSEventModifierFlagHelp),
      @"FUNCTION": @(NSEventModifierFlagFunction),
    }),
    NSEventModifierFlagCommand,
    unsignedIntegerValue)

RCT_ENUM_CONVERTER(
    NSControlStateValue,
    (@{
      @"ON": @(NSControlStateValueOn),
      @"OFF": @(NSControlStateValueOff),
      @"MIXED": @(NSControlStateValueMixed),
    }),
    NSControlStateValueMixed,
    unsignedIntegerValue)

@end
