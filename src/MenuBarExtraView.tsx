import { StyleSheet } from 'react-native';
import React from 'react';
import MenubarExtraViewNativeComponent, {
  type NativeProps,
} from './MenubarExtraViewNativeComponent';

const MenuBarExtraView = (props: NativeProps) => {
  return (
    <MenubarExtraViewNativeComponent style={styles.container} {...props} />
  );
};

export default MenuBarExtraView;

const styles = StyleSheet.create({
  container: {
    position: 'absolute',
  },
});
