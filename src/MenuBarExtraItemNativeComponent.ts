import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { ViewProps } from 'react-native';

interface NativeProps extends ViewProps {
  title?: string;
  icon?: string;
  isSeparator?: boolean;
}

export default codegenNativeComponent<NativeProps>('MenuBarExtraItemView');
