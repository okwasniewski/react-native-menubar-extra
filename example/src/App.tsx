import * as React from 'react';

import { StyleSheet, Text, View } from 'react-native';
import {
  MenuBarExtraItem,
  MenuBarExtraSeparator,
  MenubarExtraView,
} from 'react-native-menubar-extra';

const MenuBar = () => {
  return (
    <MenubarExtraView icon="car">
      <MenuBarExtraItem
        title="First item"
        icon="paperplane"
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
      <MenuBar />
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
