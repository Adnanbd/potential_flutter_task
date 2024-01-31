import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);

  Size get size => mediaQuery.size;
  double get height => size.height;
  double get width => size.width;

  Future<T?> push<T>(Widget page) => Navigator.of(this).push<T>(MaterialPageRoute(builder: (_) => page));

  Future<T?> pushReplacement<T>(Widget page) =>
      Navigator.of(this).pushReplacement<T, T?>(MaterialPageRoute(builder: (_) => page));

  Future<T?> pushAndRemoveUntil<T>(Widget page) =>
      Navigator.of(this).pushAndRemoveUntil<T>(MaterialPageRoute(builder: (_) => page), (_) => false);

  void pop<T>([T? result]) => Navigator.of(this).pop(result);

  Future<T?> pushNamed<T>(String page, [Object? args]) => Navigator.of(this).pushNamed<T>(page, arguments: args);

  void showSnackBar(SnackBar snackBar) => ScaffoldMessenger.of(this).showSnackBar(snackBar);

  void showMountedSnackBar(SnackBar snackBar) => mounted
      ? ScaffoldMessenger.of(this).showSnackBar(snackBar)
      : debugPrint('Context is not mounted. SnackBar not shown.');
}
