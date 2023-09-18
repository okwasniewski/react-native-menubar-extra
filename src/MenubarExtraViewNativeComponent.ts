import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { ViewProps } from 'react-native';

interface NativeProps extends ViewProps {
  icon: string;
}

export default codegenNativeComponent<NativeProps>('MenubarExtraView');
