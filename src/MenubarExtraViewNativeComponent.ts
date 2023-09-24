import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import { Platform, type ViewProps } from 'react-native';

if (Platform.OS !== 'macos') {
  throw new Error('react-native-menubar-extra is only supported on macOS.');
}

export interface NativeProps extends ViewProps {
  /**
   * Title that will appear next to icon in system status bar.
   */
  title?: string;
  /**
   * Name of SF Symbol as string that will appear in system status bar.
   */
  icon?: string;
}

export default codegenNativeComponent<NativeProps>('MenubarExtraView');
