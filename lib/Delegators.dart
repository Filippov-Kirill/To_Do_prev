
import 'package:flutter/material.dart';

abstract class ShowBottomSheetDelegator {
  void showBottomSheet(void Function(BuildContext) builder, {
    void Function() onClosed
  });
}

abstract class ShowSnackBarDelegator {
  void showSnackBar(String text, Duration duration);
}

abstract class BottomNavigationItemClickedListenerDelegator {
  void addBottomNavigationItemClickedListener(void Function(String key) listener);
  void removeBottomNavigationItemClickedListener(void Function(String key) listener);
}

abstract class WeekBlocDelegator implements
  ShowBottomSheetDelegator,
  ShowSnackBarDelegator,
  BottomNavigationItemClickedListenerDelegator { }

abstract class SettingsBlocDelegator implements
  ShowBottomSheetDelegator,
  ShowSnackBarDelegator { }
