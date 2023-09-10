import * as React from 'react';

import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import MenuBarExtra from 'react-native-menubar-extra';

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
      <MenuBarExtra.View icon={`${count}.square`}>
        <MenuBarExtra.Item title="Hey" icon="iphone" />
        <MenuBarExtra.Item title="Unseen" isSeparator />
        <MenuBarExtra.Item title="Hey 2" icon="1.square" />
      </MenuBarExtra.View>
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
