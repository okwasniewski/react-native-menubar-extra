import * as React from 'react';

import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import { MenuBarExtraItem, MenubarExtraView } from 'react-native-menubar-extra';

export default function App() {
  const [count, setCount] = React.useState(0);
  return (
    <View style={styles.container}>
      <TouchableOpacity
        onPress={() => {
          setCount((prev) => prev + 1);
        }}
      >
        <Text>Increment!</Text>
      </TouchableOpacity>
      <MenubarExtraView icon={`${count}.square`}>
        <MenuBarExtraItem title="Hey" icon="iphone" />
        <MenuBarExtraItem title="Unseen" isSeparator />
        <MenuBarExtraItem title="Hey 2" icon="1.square" />
      </MenubarExtraView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
