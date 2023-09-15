import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { ViewProps } from 'react-native';
import type { DirectEventHandler } from 'react-native/Libraries/Types/CodegenTypes';

interface NativeProps extends ViewProps {
  title?: string;
  icon?: string;
  isSeparator?: boolean;
  onItemPress?: DirectEventHandler<undefined>;
}

export default codegenNativeComponent<NativeProps>('MenuBarExtraItemView');
