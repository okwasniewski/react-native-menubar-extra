import { Platform, type ViewProps } from 'react-native';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';

if (Platform.OS !== 'macos') {
  throw new Error('react-native-menubar-extra is only supported on macOS.');
}

interface NativeProps extends ViewProps {}

export default codegenNativeComponent<NativeProps>('MenuBarExtraSeparatorView');
