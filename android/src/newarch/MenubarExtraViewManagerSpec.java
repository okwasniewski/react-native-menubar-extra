package com.menubarextra;

import android.view.View;

import androidx.annotation.Nullable;

import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ViewManagerDelegate;
import com.facebook.react.viewmanagers.MenubarExtraViewManagerDelegate;
import com.facebook.react.viewmanagers.MenubarExtraViewManagerInterface;
import com.facebook.soloader.SoLoader;

public abstract class MenubarExtraViewManagerSpec<T extends View> extends SimpleViewManager<T> implements MenubarExtraViewManagerInterface<T> {
  static {
    if (BuildConfig.CODEGEN_MODULE_REGISTRATION != null) {
      SoLoader.loadLibrary(BuildConfig.CODEGEN_MODULE_REGISTRATION);
    }
  }

  private final ViewManagerDelegate<T> mDelegate;

  public MenubarExtraViewManagerSpec() {
    mDelegate = new MenubarExtraViewManagerDelegate(this);
  }

  @Nullable
  @Override
  protected ViewManagerDelegate<T> getDelegate() {
    return mDelegate;
  }
}
