package com.menubarextra;

import android.graphics.Color;

import androidx.annotation.Nullable;

import com.facebook.react.module.annotations.ReactModule;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;

@ReactModule(name = MenubarExtraViewManager.NAME)
public class MenubarExtraViewManager extends MenubarExtraViewManagerSpec<MenubarExtraView> {

  public static final String NAME = "MenubarExtraView";

  @Override
  public String getName() {
    return NAME;
  }

  @Override
  public MenubarExtraView createViewInstance(ThemedReactContext context) {
    return new MenubarExtraView(context);
  }

  @Override
  @ReactProp(name = "color")
  public void setColor(MenubarExtraView view, @Nullable String color) {
    view.setBackgroundColor(Color.parseColor(color));
  }
}
