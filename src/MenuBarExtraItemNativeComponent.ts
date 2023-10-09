import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import { Platform, type ViewProps, type ImageURISource } from 'react-native';
import type {
  DirectEventHandler,
  WithDefault,
} from 'react-native/Libraries/Types/CodegenTypes';

if (Platform.OS !== 'macos') {
  throw new Error('react-native-menubar-extra is only supported on macOS.');
}

type ModifierKey =
  | 'CAPS_LOCK'
  | 'SHIFT'
  | 'CONTROL'
  | 'OPTION'
  | 'COMMAND'
  | 'NUMERIC_PAD'
  | 'HELP'
  | 'FUNCTION';

type ControlState = 'MIXED' | 'ON' | 'OFF';

interface NativeProps extends ViewProps {
  /**
   * The menu item's title.
   */
  title: string;
  /**
   * Name of SF Symbol as string that will appear in system status bar.
   */
  icon?: string;
  /**
   * Callback that is called after clicking on menu item.
   */
  onItemPress?: DirectEventHandler<undefined>;
  /**
   * The menu item’s unmodified key equivalent.
   * For example: "1" or "A".
   */
  keyEquivalent?: string;
  /**
   * The menu item’s keyboard equivalent modifiers.
   */
  keyEquivalentModifierMask?: WithDefault<ModifierKey, 'COMMAND'>;
  /**
   * State of the menu item. If not set, the menu item will be in the MIXED state.
   */
  controlState?: WithDefault<ControlState, 'MIXED'>;
  iconImage?: ImageURISource;
}

export default codegenNativeComponent<NativeProps>('MenuBarExtraItemView');
