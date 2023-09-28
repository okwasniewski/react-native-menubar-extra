import * as React from 'react';

import { Platform, StyleSheet, Text, View } from 'react-native';
import {
  MenuBarExtraItem,
  MenuBarExtraSeparator,
  MenubarExtraView,
} from 'react-native-menubar-extra';

const MenuBar = () => {
  return (
    <MenubarExtraView icon="car" title="Hey!">
      <MenuBarExtraItem
        title="First item"
        icon="paperplane"
        keyEquivalent="1"
        keyEquivalentModifierMask="OPTION"
        controlState="ON"
        onItemPress={() => {
          console.log('First item');
        }}
      >
        <MenuBarExtraItem title="First subitem">
          <MenuBarExtraItem
            title="Second subitem"
            onItemPress={() => {
              console.log('Second subitem');
            }}
          />
        </MenuBarExtraItem>
      </MenuBarExtraItem>
      <MenuBarExtraSeparator />
      <MenuBarExtraItem
        title="Second item"
        icon="eraser"
        controlState="ON"
        keyEquivalent="2"
        keyEquivalentModifierMask="SHIFT"
        onItemPress={() => console.log('Second item')}
      />
      <MenuBarExtraSeparator />
      <MenuBarExtraItem title="Third item" icon="pencil" />
      <MenuBarExtraItem title="Fourth item" icon="trash" />
      <MenuBarExtraItem
        title="Fifth item"
        icon="tray.fill"
        onItemPress={() => console.log('Fifth item')}
      />
    </MenubarExtraView>
  );
};

export default function App() {
  return (
    <>
      {/* Display menu bar only on macOS */}
      {Platform.OS === 'macos' ? <MenuBar /> : null}
      <View style={styles.container}>
        <Text>Hello!</Text>
      </View>
    </>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
