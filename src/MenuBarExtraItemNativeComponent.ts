import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import { Platform, type ViewProps } from 'react-native';
import type { DirectEventHandler } from 'react-native/Libraries/Types/CodegenTypes';

if (Platform.OS !== 'macos') {
  throw new Error('react-native-menubar-extra is only supported on macOS.');
}

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
}

export default codegenNativeComponent<NativeProps>('MenuBarExtraItemView');
