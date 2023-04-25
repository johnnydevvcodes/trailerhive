import 'package:flutter/cupertino.dart';

class CupertinoButtonSlim extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  const CupertinoButtonSlim(
      {super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        minSize: 0,
        padding: EdgeInsets.zero,
        onPressed: () => onPressed.call(),
        child: child);
  }
}
